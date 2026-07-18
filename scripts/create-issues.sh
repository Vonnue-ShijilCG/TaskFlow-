#!/usr/bin/env bash
# Bulk-creates all seeded bugs as GitHub Issues on the current repo.
#
# Prerequisites:
#   1. Install the GitHub CLI: https://cli.github.com
#   2. Run `gh auth login` once
#   3. Run this script from inside the cloned repo, AFTER you've pushed it
#      to GitHub (it uses `gh issue create`, which targets the repo of the
#      current working directory — or pass --repo owner/name).
#
# Usage:
#   ./scripts/create-issues.sh
#   ./scripts/create-issues.sh --repo your-org/taskflow-practice

set -euo pipefail

REPO_FLAG=()
if [[ "${1:-}" == "--repo" && -n "${2:-}" ]]; then
  REPO_FLAG=(--repo "$2")
fi

if ! command -v gh &> /dev/null; then
  echo "GitHub CLI (gh) is not installed. See https://cli.github.com"
  exit 1
fi

if ! command -v jq &> /dev/null; then
  echo "jq is required. Install it (e.g. 'brew install jq' or 'apt install jq') and re-run."
  exit 1
fi

echo "Creating labels (skips any that already exist)..."
declare -A LABEL_COLORS=(
  ["bug: color"]="d73a4a"
  ["bug: alignment"]="fbca04"
  ["bug: text"]="0e8a16"
  ["good first issue"]="7057ff"
  ["medium"]="d4c5f9"
)
for label in "${!LABEL_COLORS[@]}"; do
  gh label create "$label" --color "${LABEL_COLORS[$label]}" "${REPO_FLAG[@]}" 2>/dev/null || true
done

COUNT=$(jq length issues.json)
echo "Found $COUNT issues in issues.json. Creating them now..."

for i in $(seq 0 $((COUNT - 1))); do
  TITLE=$(jq -r ".[$i].title" issues.json)
  BODY=$(jq -r ".[$i].body" issues.json)
  LABELS=$(jq -r ".[$i].labels | join(\",\")" issues.json)

  echo "  [$((i + 1))/$COUNT] $TITLE"
  gh issue create --title "$TITLE" --body "$BODY" --label "$LABELS" "${REPO_FLAG[@]}" > /dev/null
done

echo "Done. Created $COUNT issues."
