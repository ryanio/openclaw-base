FROM docker.io/cloudflare/sandbox:0.7.0

# Version args for cache-busting and tracking
ARG NODE_VERSION=22.13.1
ARG OPENCLAW_VERSION=2026.2.22

ENV NODE_VERSION=${NODE_VERSION}

# Install Node.js 22 (required by openclaw) and rsync (for R2 backup sync)
# The base image has Node 20, we need to replace it with Node 22
RUN apt-get update && apt-get install -y xz-utils ca-certificates rsync \
    && curl -fsSLk https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz -o /tmp/node.tar.xz \
    && tar -xJf /tmp/node.tar.xz -C /usr/local --strip-components=1 \
    && rm /tmp/node.tar.xz \
    && npm install -g pnpm \
    && npm install -g openclaw@${OPENCLAW_VERSION} \
    && mkdir -p /root/.openclaw /root/.openclaw-templates /root/clawd/skills \
    && openclaw --version > /openclaw-version.txt

# Store version info for debugging
RUN echo "Node: $(node --version), OpenClaw: $(cat /openclaw-version.txt)" > /versions.txt
