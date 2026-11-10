#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v hugo >/dev/null 2>&1; then
  echo "Hugo is not installed. Install the version pinned in README.md." >&2
  exit 1
fi

hugo --minify --cleanDestinationDir --destination public

# Keep the historical /feed/index.xml path working for existing subscribers.
mkdir -p public/feed
cp public/index.xml public/feed/index.xml

# Keep historical singular taxonomy paths working (/tag/... and /category/...).
# Hugo 0.169 requires distinct plural taxonomy paths.
rm -rf public/tag public/category
cp -R public/tags public/tag
cp -R public/categories public/category
