#!/bin/bash
set -e
# Fetch IA/TOK exemplars directly via Gitea LFS (fresh, no expiry)
apt-get update -qq && apt-get install -y -qq git-lfs > /dev/null
git clone --depth 1 https://git.pirateib.sh/pirateIB/rdojo.git /tmp/rdojo_full 2>&1 | tail -3
cd /tmp/rdojo_full
# LFS smudge will 401 without creds for large blobs — try anonymous pull
git lfs fetch --all 2>&1 | head -5
ls public/exemplars/*.json 2>&1 | head -3
# If LFS pull succeeded, PDFs would appear under submissions/ — check
find . -name "*.pdf" 2>/dev/null | head -5
