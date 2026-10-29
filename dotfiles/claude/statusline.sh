#!/usr/bin/env bash
# Claude Code statusLine: cache account-wide rate limits for tmux, print a short line for Claude's UI.
input=$(cat)
cache_dir="$HOME/.cache/claude-usage"
mkdir -p "$cache_dir"

if jq -e '.rate_limits' >/dev/null 2>&1 <<<"$input"; then
  tmp=$(mktemp "$cache_dir/.status.XXXXXX")
  jq --argjson ts "$(date +%s)" '{ts: $ts, rate_limits}' <<<"$input" >"$tmp" && mv "$tmp" "$cache_dir/status.json"
fi

jq -r '"\(.model.display_name) · ctx \(.context_window.used_percentage // 0)%"' <<<"$input"
