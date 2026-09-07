# AGENTS.md — examine-image

Vision inference skill. Call `examine-image` to get a text description of any image file.

## Quick reference

```bash
examine-image /path/to/image.png
examine-image --prompt "What does this error message say?" /path/to/screenshot.png
examine-image --fallback /path/to/image.png   # use qwen3.8:27b on gumon if primary fails
```

## When to use

- Inbound MMS images that need description before you can reply
- Screenshots shared by the user that you can't render inline
- Any time you have an image path and need its content as text

## Defaults

- Primary model: `minimax-m3:cloud` via local Ollama (`127.0.0.1:11434`)
- Fallback model: `qwen3.8:27b` on `YOUR-HOST.YOUR-TAILNET.ts.net:11434` (Tailscale, no SSH needed)

Use `--fallback` to enable automatic fallback if the primary model fails or is unavailable.

## Output

Plain text description printed to stdout. Use `--json` to get the raw Ollama API response.

## Related

- `mms-receive` — inbound MMS images land at paths you can pass directly to this tool
- `claude-termux-x11/bin/x11-screenshot` — produces PNG files you can examine with this tool
