#!/usr/bin/env bash
set -euo pipefail

exec /usr/bin/cloudflared --no-autoupdate tunnel --url http://10.128.46.175:8888

