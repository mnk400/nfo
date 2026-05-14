# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Project Overview

nfo is a minimal, lightweight Neofetch alternative written entirely in Bash. It displays system information with ASCII art, supporting macOS (Darwin) and Linux (with WSL detection).

## Development

Run in dev mode (uses local `config.conf` and `art/` instead of `~/.config/nfo/`):
```bash
./nfo --super-secret-dev-mode
```

Run tests (requires [bats](https://github.com/bats-core/bats-core)):
```bash
bats tests/integration.bats
```

Install locally:
```bash
cp nfo ~/.local/bin/nfo && mkdir -p ~/.config/nfo && cp -r config.conf art ~/.config/nfo/ && chmod +x ~/.local/bin/nfo
```

## Architecture

- **`nfo`** — the main script. Contains all system info gathering (`get_*_info`), display functions (`show_*`), config loading (`init_config`), and styling (`setup_styling`). The `nfo()` function acts as a dispatcher, routing string names to functions. Entry point is `main()`.
- **`config.conf`** — user configuration. Defines art style, color theme, and a `print_out()` function that controls which info lines are displayed and in what order.
- **`art/`** — directory of plain-text ASCII art files. Each `.txt` file is a single art piece; `ART='foo'` in config loads `art/foo.txt`. Adding new art is just dropping a file in.

**Program flow:** `main()` → `init_config()` (loads config, locates art dir) → `setup_styling()` (colors) → `print_out()` (from config, calls `nfo <name>` for each line) → dispatcher routes to `show_*`/`get_*` functions → `show_art` reads `art/<ART>.txt` → formatted output.

## Platform Handling

All platform-specific logic branches on `$(uname)` returning "Darwin" vs "Linux". Key differences:
- Memory: `vm_stat` on macOS, `/proc/meminfo` on Linux
- Battery: `pmset -g batt` on macOS, `/sys/class/power_supply/` on Linux
- Network: `ipconfig getifaddr` on macOS, `hostname -I` on Linux
- Packages: `brew` on macOS, `dpkg`/`rpm`/`pacman`/`apk` on Linux

## CI/CD

- **`tests.yml`** — runs bats tests + smoke test on both macOS and Ubuntu on push/PR
- **`auto-release.yml`** — auto-increments patch version, creates GitHub release, updates Homebrew tap formula on push to master
