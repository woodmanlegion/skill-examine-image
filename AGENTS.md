# AGENTS.md — examine-image

Vision inference skill. Call `examine-image` to get a text description of any image file.

## Quick reference

```bash
examine-image /path/to/image.png
examine-image --prompt "What does this error message say?" /path/to/screenshot.png
examine-image --fallback /path/to/image.png   # use fallback model if primary fails
```

## When to use

- Inbound MMS images that need description before you can reply
- Screenshots shared by the user that you can't render inline
- Any time you have an image path and need its content as text

## Defaults

Configured via `~/.config/examine-image/config`. Run `examine-image --show-config` to see the resolved settings for this installation.

Use `--fallback` to enable automatic fallback to the configured `FALLBACK_MODEL`/`FALLBACK_HOST` if the primary model fails or is unavailable.

## Output

Plain text description printed to stdout. Use `--json` to get the raw Ollama API response.

## Related

- `mms-receive` — inbound MMS images land at paths you can pass directly to this tool
- `claude-termux-x11/bin/x11-screenshot` — produces PNG files you can examine with this tool
