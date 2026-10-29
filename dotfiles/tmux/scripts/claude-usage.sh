#!/usr/bin/env bash
# tmux status: Claude Code rate limits from cache written by ~/.claude/statusline.sh
cache="$HOME/.cache/claude-usage/status.json"
[ -f "$cache" ] || exit 0

C_OK="#a3be8c" C_WARN="#ebcb8b" C_HIGH="#bf616a" C_DIM="#4c566a" C_TXT="#d8dee9"
STALE_AFTER=1800 # seconds

now=$(date +%s)
read -r ts p5 r5 p7 r7 < <(jq -r '[.ts, .rate_limits.five_hour.used_percentage, .rate_limits.five_hour.resets_at,
  .rate_limits.seven_day.used_percentage, .rate_limits.seven_day.resets_at] | map(. // 0 | floor) | @tsv' "$cache")

# fmt_time <epoch> <format>: BSD date (macOS) uses -r, GNU date (Linux) uses -d @
fmt_time() { date -r "$1" "+$2" 2>/dev/null || date -d "@$1" "+$2"; }

pct_color() { if (($1 >= 80)); then echo "$C_HIGH"; elif (($1 >= 50)); then echo "$C_WARN"; else echo "$C_OK"; fi; }

countdown() {
  local s=$(($1 - now))
  if ((s >= 86400)); then echo "$((s / 86400))d$((s % 86400 / 3600))h"
  elif ((s >= 3600)); then echo "$((s / 3600))h$(printf %02d $((s % 3600 / 60)))m"
  else echo "$((s / 60))m"; fi
}

# label pct resets_at reset_text
segment() {
  if (($3 <= now)); then
    printf '#[fg=%s]%s reset' "$C_DIM" "$1"
  else
    printf '#[fg=%s]%s #[fg=%s,bold]%s%%#[nobold] #[fg=%s]↻%s' "$C_TXT" "$1" "$(pct_color "$2")" "$2" "$C_DIM" "$4"
  fi
}

age=$((now - ts))
if ((age < 60)); then age_txt="now"
elif ((age < 3600)); then age_txt="$((age / 60))m"
else age_txt="$((age / 3600))h"; fi
age_color=$C_DIM
((age >= STALE_AFTER)) && age_color=$C_WARN

printf '%s #[fg=%s]│ %s #[fg=%s]│ #[fg=%s]%s ' \
  "$(segment 5h "$p5" "$r5" "$(countdown "$r5") $(fmt_time "$r5" %H:%M)")" "$C_DIM" \
  "$(segment 7d "$p7" "$r7" "$(fmt_time "$r7" '%a %H:%M')")" "$C_DIM" \
  "$age_color" "$age_txt"
