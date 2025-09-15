#!/usr/bin/env bash
set -euo pipefail

exec /usr/bin/cloudflared --no-autoupdate tunnel --url http://127.0.0.1:8080

