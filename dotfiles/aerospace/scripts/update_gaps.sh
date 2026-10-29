#!/usr/bin/env bash
set -Eeuo pipefail
# set -x  # bật nếu cần trace

LOCK_DIR="/tmp/aero_gaps.lockdir"   # lock bằng mkdir
LOG="/tmp/aero_gaps.log"
CFG="${HOME}/.config/aerospace/aerospace.toml"
TARGET_MONITOR="LG HDR WQHD"

ts() { date '+%Y-%m-%d %H:%M:%S%z'; }
log() { echo "[$(ts)] [pid=$$] $*" >> "$LOG"; }

# --- LOCK bằng mkdir (atomic), có chờ & dọn stale ---
release_lock() { rmdir "$LOCK_DIR" 2>/dev/null || true; log "Lock released"; }
trap 'log "ERROR at line $LINENO (exit $?)"; release_lock' ERR
trap release_lock EXIT

acquire_lock() {
  local waited_ms=0 step_ms=100 max_wait_ms=2000
  while ! mkdir "$LOCK_DIR" 2>/dev/null; do
    # Nếu lock bị “kẹt” lâu (stale), dọn nó
    # macOS: mtime bằng giây
    if [[ -d "$LOCK_DIR" ]]; then
      local mtime now age
      mtime=$(stat -f "%m" "$LOCK_DIR" 2>/dev/null || echo 0)
      now=$(date +%s)
      age=$(( now - mtime ))
      if (( age >= 3 )); then
        log "Stale lock detected (age=${age}s) -> removing"
        rmdir "$LOCK_DIR" 2>/dev/null || true
        continue
      fi
    fi

    if (( waited_ms >= max_wait_ms )); then
      log "Lock busy (mkdir, waited ${max_wait_ms}ms). Exit."
      exit 0
    fi
    usleep $(( step_ms * 1000 )) 2>/dev/null || sleep 0.1
    waited_ms=$(( waited_ms + step_ms ))
  done
  log "Lock acquired (mkdir)"
}

acquire_lock

log "---- update_gaps.sh START ----"
log "PATH=$PATH"
command -v aerospace >>"$LOG" 2>&1 || log "aerospace not found in PATH!"

get_window_count() {
  aerospace list-windows --workspace focused --count 2>>"$LOG" || echo 0
}

get_focused_monitor() {
  aerospace list-monitors --focused --format "%{monitor-name}" 2>>"$LOG" | head -n1
}

apply_outer_gaps() {
  local left="$1" right="$2"
  log "STEP1: apply_outer_gaps left=$left right=$right"

  if [[ ! -f "$CFG" ]]; then
    log "ERROR: config file not found: $CFG"
    return 0
  fi

  log "STEP2: check markers"
  if ! grep -q '# BEGIN_DYNAMIC_OUTER' "$CFG"; then
    log "WARN: Marker BEGIN_DYNAMIC_OUTER not found in $CFG"
  fi
  if ! grep -q '# END_DYNAMIC_OUTER' "$CFG"; then
    log "WARN: Marker END_DYNAMIC_OUTER not found in $CFG"
  fi

  log "STEP3: generate temp config"
  local tmp; tmp="$(mktemp)"
  if ! awk -v L="$left" -v R="$right" '
      BEGIN { inside_block=0 }
      /# BEGIN_DYNAMIC_OUTER/ { print; print "    outer.left  = " L; print "    outer.right = " R; inside_block=1; next }
      /# END_DYNAMIC_OUTER/   { inside_block=0 }
      { if (!inside_block) print }
    ' "$CFG" > "$tmp"; then
    log "ERROR: awk failed to generate temp config"
    rm -f "$tmp" 2>/dev/null || true
    return 0
  fi

  log "STEP4: compare tmp vs cfg"
  set +e
  cmp -s "$tmp" "$CFG" 2>>"$LOG"
  cmp_rc=$?
  set -e
  if [[ $cmp_rc -eq 0 ]]; then
    log "No change in config; skip reload."
    rm -f "$tmp" 2>/dev/null || true
    return 0
  elif [[ $cmp_rc -eq 2 ]]; then
    log "ERROR: cmp error (likely race or file access issue)"
    rm -f "$tmp" 2>/dev/null || true
    return 0
  fi

  log "STEP5: move tmp -> cfg"
  if ! mv "$tmp" "$CFG"; then
    log "ERROR: failed to mv $tmp -> $CFG"
    rm -f "$tmp" 2>/dev/null || true
    return 0
  fi

  log "STEP6: reload-config"
  if ! aerospace reload-config >>"$LOG" 2>&1; then
    log "ERROR: reload-config failed"
    aerospace check-config >>"$LOG" 2>&1 || log "ERROR: check-config failed"
  fi
}

update_gaps() {
  local count monitor
  count="$(get_window_count)"
  monitor="$(get_focused_monitor)"
  log "window_count=$count | focused_monitor=$monitor"

  if [[ "$count" == "1" && "$monitor" == "$TARGET_MONITOR" ]]; then
    apply_outer_gaps 600 600
  else
    apply_outer_gaps 15 15
  fi
}

update_gaps
log "---- update_gaps.sh END ----"
