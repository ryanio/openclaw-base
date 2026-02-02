# openclaw-base

Pre-built Docker base image for [OpenClaw](https://docs.openclaw.ai/) on Cloudflare containers.

## What's included

- Cloudflare sandbox base image
- Node.js 22
- pnpm
- OpenClaw CLI (auto-updated daily)
- rsync (for R2 sync operations)

## Usage

```dockerfile
FROM ghcr.io/ryanio/openclaw-base:latest

COPY your-files/ /root/clawd/
```

## Automated updates

A GitHub Action checks daily for new OpenClaw releases and rebuilds the image automatically.

## Tags

- `latest` - Most recent build
- `openclaw-X.Y.Z` - Pinned to specific OpenClaw version
