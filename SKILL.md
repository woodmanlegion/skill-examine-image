# SKILL.md — examine-image

One-shot vision model inference. Takes an image file and returns a text description using a local or remote Ollama vision model.

## Install

```bash
claw-gh-install woodmanlegion/skill-examine-image
# or manually:
./install.sh
```

## Usage

```bash
examine-image <image-path>
examine-image --prompt "What text is visible?" screenshot.png
examine-image --fallback photo.jpg          # tries gumon/qwen3.8:27b if primary fails
examine-image --model gemma4:cloud image.png
examine-image --show-config                 # print resolved settings
```

## Environment

| Variable | Default | Description |
|----------|---------|-------------|
| `EXAMINE_IMAGE_MODEL` | `minimax-m3:cloud` | Primary vision model |
| `EXAMINE_IMAGE_HOST` | `http://127.0.0.1:11434` | Primary Ollama host |

## Models

| Model | Host | Vision | Notes |
|-------|------|--------|-------|
| `minimax-m3:cloud` | `ollama-local` (127.0.0.1:11434) | ✅ | Default; 1M context, cost-free |
| `qwen3.8:27b` | `ollama-fallback` (YOUR-HOST via Tailscale) | ✅ | Fallback; thinking + tools, confirmed working |
