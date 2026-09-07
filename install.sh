#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="${OPENCLAW_SKILL_DIR:-$HOME/.openclaw/workspace/skills/examine-image}"
BIN_TARGET="${OPENCLAW_BIN_DIR:-$HOME/.openclaw/workspace/bin}"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/examine-image"
CONFIG_FILE="$CONFIG_DIR/config"

echo "Installing examine-image skill..."

mkdir -p "$INSTALL_DIR/bin" "$BIN_TARGET" "$CONFIG_DIR"
cp -f "$SKILL_DIR/bin/examine-image" "$INSTALL_DIR/bin/examine-image"
chmod +x "$INSTALL_DIR/bin/examine-image"
ln -sf "$INSTALL_DIR/bin/examine-image" "$BIN_TARGET/examine-image"

if [[ ! -f "$CONFIG_FILE" ]]; then
  cp "$SKILL_DIR/config.example" "$CONFIG_FILE"
  echo "Config created: $CONFIG_FILE"
  echo "Edit it to set your PRIMARY_MODEL and PRIMARY_HOST before use."
else
  echo "Config exists, skipping: $CONFIG_FILE"
fi

echo ""
echo "Installed to: $INSTALL_DIR"
echo "Symlinked:    $BIN_TARGET/examine-image"
echo ""
echo "Verify:"
echo "  examine-image --show-config"
echo "  examine-image /path/to/image.png"
