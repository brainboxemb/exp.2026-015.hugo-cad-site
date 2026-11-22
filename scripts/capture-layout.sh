#!/usr/bin/env bash
# Render generated Hugo model pages in real headless Chrome and retain
# screenshots as CI presentation evidence.
#
# Input: public/ from the normal Hugo build.
# Output: artifacts/layout/*.png
#
# The production baseURL contains /exp.2026-015.hugo-cad-site/. Mirror that
# path below a temporary localhost document root so CSS, JS and image URLs are
# exercised exactly as generated.
set -euo pipefail

repo_path="exp.2026-015.hugo-cad-site"
visual_root="build/visual-root"
artifact_dir="artifacts/layout"
port="8765"

rm -rf "$visual_root" "$artifact_dir"
mkdir -p "$visual_root/$repo_path" "$artifact_dir"
cp -a public/. "$visual_root/$repo_path/"

python -m http.server "$port" \
  --bind 127.0.0.1 \
  --directory "$visual_root" \
  > "$artifact_dir/browser-server.log" 2>&1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true' EXIT

python - <<'PY'
import time
import urllib.request

url = "http://127.0.0.1:8765/exp.2026-015.hugo-cad-site/models/simple-mft-concept/"
for _ in range(40):
    try:
        with urllib.request.urlopen(url, timeout=1) as response:
            if response.status == 200:
                break
    except Exception:
        time.sleep(0.25)
else:
    raise SystemExit("visual preview server did not become ready")
PY

chrome="$(command -v google-chrome || command -v google-chrome-stable || command -v chromium || true)"
if [ -z "$chrome" ]; then
  echo "No Chrome/Chromium executable available on runner" >&2
  exit 1
fi

run_chrome() {
  local user_data_dir
  local status
  user_data_dir="$(mktemp -d)"

  if timeout --signal=TERM --kill-after=5s 45s \
      "$chrome" \
      --user-data-dir="$user_data_dir" \
      --headless \
      --no-sandbox \
      --disable-gpu \
      --disable-dev-shm-usage \
      --hide-scrollbars \
      --virtual-time-budget=3500 \
      "$@"; then
    status=0
  else
    status=$?
  fi

  rm -rf "$user_data_dir"
  return "$status"
}

simple_url="http://127.0.0.1:${port}/${repo_path}/models/simple-mft-concept/"
plate_url="http://127.0.0.1:${port}/${repo_path}/models/plate/"

# Concept reference.
run_chrome \
  --window-size=1600,1400 \
  --screenshot="$PWD/$artifact_dir/simple-mft-concept-overview.png" \
  "$simple_url"

run_chrome \
  --window-size=1600,12000 \
  --screenshot="$PWD/$artifact_dir/simple-mft-concept-full.png" \
  "$simple_url"

# Generic model-detail route under review.
run_chrome \
  --window-size=1600,1400 \
  --screenshot="$PWD/$artifact_dir/plate-overview.png" \
  "$plate_url"

run_chrome \
  --window-size=1600,9000 \
  --screenshot="$PWD/$artifact_dir/plate-full.png" \
  "$plate_url"

test -s "$artifact_dir/simple-mft-concept-overview.png"
test -s "$artifact_dir/simple-mft-concept-full.png"
test -s "$artifact_dir/plate-overview.png"
test -s "$artifact_dir/plate-full.png"

if grep -Eq '"GET [^"]+" 404 ' "$artifact_dir/browser-server.log"; then
  echo "Rendered page requested one or more missing local assets:" >&2
  grep -E '"GET [^"]+" 404 ' "$artifact_dir/browser-server.log" >&2
  exit 1
fi
