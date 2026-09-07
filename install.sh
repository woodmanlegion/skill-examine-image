#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="${OPENCLAW_SKILL_DIR:-$HOME/.openclaw/workspace/skills/examine-image}"
BIN_TARGET="${OPENCLAW_BIN_DIR:-$HOME/.openclaw/workspace/bin}"

echo "Installing examine-image skill..."

mkdir -p "$INSTALL_DIR/bin" "$BIN_TARGET"
cp -f "$SKILL_DIR/bin/examine-image" "$INSTALL_DIR/bin/examine-image"
chmod +x "$INSTALL_DIR/bin/examine-image"

# Symlink into workspace bin so agents can call it directly
ln -sf "$INSTALL_DIR/bin/examine-image" "$BIN_TARGET/examine-image"

echo "Installed to: $INSTALL_DIR"
echo "Symlinked:    $BIN_TARGET/examine-image"
echo ""
echo "Test it:"
echo "  examine-image --show-config"
echo "  examine-image /path/to/image.png"
echo "  examine-image --fallback /path/to/image.png"
