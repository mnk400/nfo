# nfo Makefile
# =============

SHELL := /bin/bash
PREFIX := /usr/local
BINDIR := $(PREFIX)/bin
CONFIGDIR := $(HOME)/.config/nfo

# Default target
.PHONY: all
all: help

# Help target
.PHONY: help
help:
	@echo "nfo - A minimal neofetch alternative"
	@echo ""
	@echo "Available targets:"
	@echo "  install     - Install nfo system-wide"
	@echo "  uninstall   - Remove nfo from system"
	@echo "  reinstall   - Reinstall nfo"
	@echo "  lint        - Run shellcheck on scripts"

# Installation
.PHONY: install
install: lint
	@echo "Installing nfo..."
	@chmod +x nfo
	@mkdir -p "$(CONFIGDIR)"
	@cp art.sh "$(CONFIGDIR)/"
	@if [ ! -f "$(CONFIGDIR)/config.conf" ]; then \
		echo "Installing default config..."; \
		cp config.conf "$(CONFIGDIR)/"; \
	else \
		echo "Existing config found, preserving user configuration"; \
		echo "Default config available as config.conf.default"; \
		cp config.conf "$(CONFIGDIR)/config.conf.default"; \
	fi
	@sudo cp nfo "$(BINDIR)/"
	@echo "Installation complete!"
	@echo "Run 'nfo' to test the installation"

# Uninstallation
.PHONY: uninstall
uninstall:
	@echo "Uninstalling nfo..."
	@rm -rf "$(CONFIGDIR)"
	@sudo rm -f "$(BINDIR)/nfo"
	@sudo rm -f "$(BINDIR)/nfo-dev"
	@echo "Uninstallation complete!"

# Reinstallation
.PHONY: reinstall
reinstall: uninstall install

# Lint check using shellcheck
.PHONY: lint
lint:
	@echo "Running shellcheck..."
	@if command -v shellcheck >/dev/null 2>&1; then \
		shellcheck nfo art.sh || echo "Warning: shellcheck found issues"; \
	else \
		echo "Warning: shellcheck not installed, skipping lint check"; \
	fi
