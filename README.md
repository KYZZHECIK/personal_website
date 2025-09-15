# personal_website

This repository contains a very small static website meant to be served from a
Raspberry Pi 5 using Python's built-in web server. The provided `cloudflared`
configuration exposes the site to the internet via a temporary Cloudflare
quick tunnel so a custom domain is not required.

## Directory layout

* `website/` – HTML files to be served.
* `scripts/run_server.sh` – launches `python -m http.server` on port `8080`.
* `scripts/run_cloudflared.sh` – opens a Cloudflare quick tunnel to the local site.

* `systemd/website.service` – runs the server at boot.
* `systemd/cloudflared-quick.service` – starts a Cloudflare quick tunnel for
  external access.

## Local testing

```bash
./scripts/run_server.sh &
curl -I http://localhost:8080
```

## Raspberry Pi setup

1. Install dependencies:

   ```bash
   sudo apt update && sudo apt install python3 cloudflared -y
   ```

2. Clone this repository into `/home/server/personal_website` (or adjust the
   paths in the service files).

3. Copy the unit files, reload systemd, and enable them:


   ```bash
   sudo cp systemd/*.service /etc/systemd/system/
   sudo systemctl daemon-reload
   sudo systemctl enable --now website.service cloudflared-quick.service
   ```

4. View the Cloudflare tunnel URL:

   ```bash
   journalctl -u cloudflared-quick.service -f
   ```

   Cloudflare prints a temporary `https://<random>.trycloudflare.com` address
   that forwards traffic to your Raspberry Pi.

The `server` user referenced in the unit files can be replaced with any user
that owns the repository.

