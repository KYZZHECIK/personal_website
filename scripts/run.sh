#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
exec python -m http.server 8080 --directory ./public