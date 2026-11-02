#!/usr/bin/env bash
# Claude Code status line + Claude usage formatter (macOS & Linux).
#   statusline.sh          read Claude's JSON on stdin, cache rate limits, print the status line (ANSI)
#   statusline.sh --tmux   print usage from the cache with tmux style codes (for status-right)
cache_dir="$HOME/.cache/claude-usage"
cache="$cache_dir/status.json"

C_OK="#a3be8c" C_WARN="#ebcb8b" C_HIGH="#bf616a" C_DIM="#4c566a" C_TXT="#d8dee9"
STALE_AFTER=1800 # seconds

if [ "$1" = --tmux ]; then
  fg() { printf '#[fg=%s]' "$1"; }
  bold='#[bold]' nobold='#[nobold]' reset=''
else
  fg() { printf '\033[38;2;%d;%d;%dm' "0x${1:1:2}" "0x${1:3:2}" "0x${1:5:2}"; }
  bold=$'\033[1m' nobold=$'\033[22m' reset=$'\033[0m'
fi

now=$(date +%s)

# fmt_time <epoch> <format>: BSD date (macOS) uses -r, GNU date (Linux) uses -d @
fmt_time() { date -r "$1" "+$2" 2>/dev/null || date -d "@$1" "+$2"; }

pct_color() { if (($1 >= 80)); then echo "$C_HIGH"; elif (($1 >= 50)); then echo "$C_WARN"; else echo "$C_OK"; fi; }

countdown() {
  local s=$(($1 - now))
  if ((s >= 86400)); then echo "$((s / 86400))d$((s % 86400 / 3600))h"
  elif ((s >= 3600)); then echo "$((s / 3600))h$(printf %02d $((s % 3600 / 60)))m"
  else echo "$((s / 60))m"; fi
}

# segment <label> <pct> <resets_at> <reset_text>
segment() {
  if (($3 <= now)); then
    printf '%s%s reset' "$(fg $C_DIM)" "$1"
  else
    printf '%s%s %s%s%s%%%s %s↻%s' "$(fg $C_TXT)" "$1" "$(fg "$(pct_color "$2")")" "$bold" "$2" "$nobold" "$(fg $C_DIM)" "$4"
  fi
}

# usage <rate_limits json>: "5h 20% ↻2h49m 14:20 │ 7d 70% ↻Fri 21:00"
usage() {
  local p5 r5 p7 r7
  read -r p5 r5 p7 r7 < <(jq -r '[.five_hour.used_percentage, .five_hour.resets_at,
    .seven_day.used_percentage, .seven_day.resets_at] | map(. // 0 | floor) | @tsv' <<<"$1")
  printf '%s %s│ %s' \
    "$(segment 5h "$p5" "$r5" "$(countdown "$r5") $(fmt_time "$r5" %H:%M)")" "$(fg $C_DIM)" \
    "$(segment 7d "$p7" "$r7" "$(fmt_time "$r7" '%a %H:%M')")"
}

if [ "$1" = --tmux ]; then
  [ -f "$cache" ] || exit 0
  ts=$(jq -r '.ts // 0' "$cache")
  age=$((now - ts))
  if ((age < 60)); then age_txt="now"
  elif ((age < 3600)); then age_txt="$((age / 60))m"
  else age_txt="$((age / 3600))h"; fi
  age_color=$C_DIM
  ((age >= STALE_AFTER)) && age_color=$C_WARN
  printf '%s %s│ %s%s ' "$(usage "$(jq -c '.rate_limits' "$cache")")" "$(fg $C_DIM)" "$(fg $age_color)" "$age_txt"
  exit 0
fi

input=$(cat)
mkdir -p "$cache_dir"
line=$(jq -r '"\(.model.display_name) · ctx \(.context_window.used_percentage // 0)%"' <<<"$input")

# Prompt-style prefix (mirrors the starship prompt used by fish): directory + git branch/dirty.
cwd=$(jq -r '.workspace.current_dir // .cwd // empty' <<<"$input")
if [ -n "$cwd" ]; then
  dir=$cwd
  case "$dir" in
    "$HOME") dir="~" ;;
    "$HOME"/*) dir="~/${dir#"$HOME"/}" ;;
  esac
  IFS=/ read -ra parts <<<"$dir"
  n=${#parts[@]}
  ((n > 3)) && dir="…/${parts[n - 3]}/${parts[n - 2]}/${parts[n - 1]}"
  prompt="$(fg "#88c0d0")$bold$dir$nobold"
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short -q HEAD 2>/dev/null ||
    git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    prompt="$prompt $(fg "#b48ead") $branch"
    if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null | head -n 1)" ]; then
      prompt="$prompt $(fg "$C_HIGH")[!]"
    fi
  fi
  line="$prompt $(fg $C_DIM)│ $(fg $C_TXT)$line"
fi

if rate_limits=$(jq -ce '.rate_limits' <<<"$input"); then
  tmp=$(mktemp "$cache_dir/.status.XXXXXX")
  jq --argjson ts "$now" '{ts: $ts, rate_limits}' <<<"$input" >"$tmp" && mv "$tmp" "$cache"
  # skip usage when tmux's status bar (status-right) already shows it
  if [ -z "$TMUX" ] || [ "$(tmux display -p -t "$TMUX_PANE" '#{status}' 2>/dev/null)" = off ]; then
    line="$line $(fg $C_DIM)│ $(usage "$rate_limits")"
  fi
fi

printf '%s%s%s\n' "$(fg $C_TXT)" "$line" "$reset"
