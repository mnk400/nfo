<h3 align="left"><img src="https://i.imgur.com/9YIHT6C.png" alt="nfo" height="80px"></h3>

<!-- site:strip-start -->
> Minimal fetch program with customizable ASCII art.
<!-- site:strip-end -->

![](https://i.imgur.com/JyIAXzR.png)

## What is this

A small system fetch tool, written in Bash. Picks up the usual suspects — OS, kernel, uptime,
memory, CPU, disk, battery — and prints them next to a chunk of ASCII art. macOS and Linux.

The output is fully configurable: pick an art style, pick a tint, and reorder or drop any of
the info lines from a single function in your config.

<!-- site:strip-start -->
## Install

Homebrew:

```bash
brew install mnk400/tap/nfo
```

Manual:

```bash
cp nfo ~/.local/bin/nfo
mkdir -p ~/.config/nfo
cp art.sh config.conf ~/.config/nfo/
chmod +x ~/.local/bin/nfo
```

Make sure `~/.local/bin` is in your `PATH`.

## Uninstall

```bash
brew uninstall nfo
# or, for manual installs:
rm ~/.local/bin/nfo && rm -rf ~/.config/nfo
```
<!-- site:strip-end -->

## Quick start

```bash
nfo
```

Config lives at `~/.config/nfo/config.conf`. To change what shows up, edit the `print_out()`
function:

```bash
print_out() {
    nfo art
    nfo host
    nfo os
    nfo up_time
    nfo total_memory
    nfo cpu
    nfo battery
    nfo colors
}
```

## Documentation

- [Configuration](./docs/configuration.md) — options, `print_out()`, available entries
- [Development](./docs/development.md) — dev mode, tests
