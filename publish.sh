#!/usr/bin/env bash
# Quick edit -> push for World Life Web.
# Usage:   ./publish.sh "your commit message"
#          ./publish.sh                 (uses a default message)
set -e
msg="${*:-Update site}"

git add -A
if git diff --cached --quiet; then
  echo "Nothing to commit."
  exit 0
fi
git commit -m "$msg"
git push
echo "Pushed: $msg"
echo "Live in ~1 min -> https://unexpear.github.io/world-life-web/"
