#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Serve the files in the repository's `website` directory on port 8080
exec python -m http.server 8080 --directory ./website
