#!/usr/bin/env bash
# FAF SessionStart hook — fail-open, receipt-oriented
set -euo pipefail

PLUGIN_ROOT="${GROK_PLUGIN_ROOT:-.}"
DATA_DIR="${GROK_PLUGIN_DATA:-/tmp/faf-plugin}"
mkdir -p "$DATA_DIR"
LOG="$DATA_DIR/session-start.log"

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) SessionStart cwd=$PWD" >> "$LOG"

# Prefer git-root project.faf when inside a work tree
FAF_FILE=""
KIND=""
GIT_ROOT=""
if GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null); then
  if [[ -f "$GIT_ROOT/project.faf" ]]; then
    FAF_FILE="$GIT_ROOT/project.faf"
    KIND="git-root"
  fi
fi

# Else walk up from cwd
if [[ -z "$FAF_FILE" ]]; then
  dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/project.faf" ]]; then
      FAF_FILE="$dir/project.faf"
      KIND="walk-up"
      break
    fi
    dir=$(dirname "$dir")
  done
fi

if [[ -z "$FAF_FILE" ]]; then
  echo "No project.faf found — skipping" >> "$LOG"
  exit 0
fi

# Label home workspace stub (not a product repo)
HOME_STUB=0
if [[ "$FAF_FILE" == "$HOME/project.faf" ]]; then
  HOME_STUB=1
  KIND="${KIND}+home-stub"
fi

echo "Found: $FAF_FILE kind=$KIND" >> "$LOG"

{
  echo "---"
  echo "faf_path: $FAF_FILE"
  echo "cwd: $PWD"
  echo "git_root: ${GIT_ROOT:-}"
  echo "kind: $KIND"
  echo "home_stub: $HOME_STUB"
  echo "timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "plugin: faf@1.0.0"
  echo "status: discovered"
} > "$DATA_DIR/last-faf-receipt.txt"

# Path first — always print absolute path so the user can trust (or reject) the hit
if [[ "$HOME_STUB" -eq 1 ]]; then
  echo "FAF path: $FAF_FILE"
  echo "FAF: workspace stub (not a product repo). cd into a real project or pass a path. Then: faf-context / faf-score."
else
  echo "FAF path: $FAF_FILE"
  echo "FAF context available ($KIND) — use faf-context or faf-score to load and score."
fi

exit 0
