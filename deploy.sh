#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

./build.sh

# Publish the generated site to the docs/ folder used by GitHub Pages.
# --delete removes stale files; CNAME is regenerated from static/CNAME.
rsync -a --delete public/ docs/
touch docs/.nojekyll

git add docs

if git diff --cached --quiet; then
  echo "No changes to publish."
  exit 0
fi

git commit -m "Publish site"
git push
