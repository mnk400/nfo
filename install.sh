#!/bin/bash
set -e

# nfo one-liner installer
REPO_URL="https://raw.githubusercontent.com/mnk400/nfo/master"
INSTALL_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME/.config/nfo"

echo "Installing nfo..."

# Create directories
mkdir -p "$INSTALL_DIR" "$CONFIG_DIR"

# Download files directly from GitHub
curl -fsSL "$REPO_URL/nfo" -o "$INSTALL_DIR/nfo"
curl -fsSL "$REPO_URL/art.sh" -o "$CONFIG_DIR/art.sh"

# Install config if it doesn't exist
if [ ! -f "$CONFIG_DIR/config.conf" ]; then
    echo "Installing default config..."
    curl -fsSL "$REPO_URL/config.conf" -o "$CONFIG_DIR/config.conf"
else
    echo "Preserving existing config"
    curl -fsSL "$REPO_URL/config.conf" -o "$CONFIG_DIR/config.conf.default"
fi

chmod +x "$INSTALL_DIR/nfo"

echo "✓ nfo installed to $INSTALL_DIR/nfo"
echo "✓ Config installed to $CONFIG_DIR/"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo ""
    echo "⚠️  Add ~/.local/bin to your PATH:"
    echo "   echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
    echo "   echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc"
    echo "   Then restart your terminal or run: source ~/.bashrc"
fi

echo ""
echo "Run 'nfo' to test installation"
