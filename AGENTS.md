# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Project Overview

nfo is a minimal, lightweight Neofetch alternative written entirely in Bash. It displays system information with ASCII art, supporting macOS (Darwin) and Linux (with WSL detection).

## Development

Run in dev mode (uses local `nfo.conf` and `art/` instead of `~/.config/nfo/`):
```bash
./nfo --super-secret-dev-mode
```

Install locally:
```bash
cp nfo ~/.local/bin/nfo && mkdir -p ~/.config/nfo && cp -r nfo.conf art ~/.config/nfo/ && chmod +x ~/.local/bin/nfo
```

## Architecture

- **`nfo`** — the main script. `get_*` functions return raw values; `build_row` formats them; `render()` composes art (left) and info column (right) into a single side-by-side block with the host header on top and color-dot row on the bottom.
- **`nfo.conf`** — user configuration. Declares `ART`, `TINT`, `DOTS`, `SHOW_HOST`, and an `INFO_ROWS` array listing which rows to render and in what order.
- **`art/`** — directory of plain-text ASCII art files. `ART='foo'` loads `art/foo.txt`.

**Program flow:** `main()` → `init_config()` (loads config, locates art dir) → `setup_styling()` (raw ANSI accent + dim) → `render()` (reads art, builds info_lines, vertically centers art against info, prints side-by-side).

## Bash compatibility

The script targets bash 3.2 (macOS system bash). Avoid `mapfile`, negative array indices (`${arr[-1]}`), associative arrays, and any other bash 4+ features.

## Platform Handling

All platform-specific logic branches on `$(uname)` returning "Darwin" vs "Linux". Key differences:
- Memory: `vm_stat` on macOS, `/proc/meminfo` on Linux
- Battery: `pmset -g batt` on macOS, `/sys/class/power_supply/` on Linux
- Network: `ipconfig getifaddr` on macOS, `hostname -I` on Linux
- Packages: `brew` on macOS, `dpkg`/`rpm`/`pacman`/`apk` on Linux

## CI/CD

- **`tests.yml`** — runs bats tests + smoke test on both macOS and Ubuntu on push/PR
- **`auto-release.yml`** — auto-increments patch version, creates GitHub release, updates Homebrew tap formula on push to master
