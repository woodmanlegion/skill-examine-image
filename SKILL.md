# SKILL.md — examine-image

One-shot vision model inference. Takes an image file and returns a text description using a local or remote Ollama vision model.

## Install

```bash
claw-gh-install woodmanlegion/skill-examine-image
# or manually:
./install.sh
```

`install.sh` creates `~/.config/examine-image/config` from `config.example` if none exists. Edit it to set your model and host before use.

## Usage

```bash
examine-image <image-path>
examine-image --prompt "What text is visible?" screenshot.png
examine-image --fallback photo.jpg          # try fallback model/host if primary fails
examine-image --model llava:7b image.png    # override model for this call
examine-image --show-config                 # print resolved settings
```

## Configuration

`~/.config/examine-image/config` (shell key=value, created by install):

| Key | Description |
|-----|-------------|
| `PRIMARY_MODEL` | Vision model to use (required) |
| `PRIMARY_HOST` | Ollama base URL (default: `http://127.0.0.1:11434`) |
| `FALLBACK_MODEL` | Model to try with `--fallback` |
| `FALLBACK_HOST` | Ollama host for fallback model |
| `DEFAULT_PROMPT` | Prompt when none is specified |

All keys can also be set via env vars prefixed `EXAMINE_IMAGE_` (e.g. `EXAMINE_IMAGE_PRIMARY_MODEL`).

## Requirements

- `curl`
- `base64`
- `jq` (optional — used for cleaner response parsing if available)
- An Ollama instance with a vision-capable model
