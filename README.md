<h3 align="left"><img src="https://i.imgur.com/9YIHT6C.png" alt="nfo" height="80px"></h3>

Minimal fetch program with customizable ASCII art.

![](https://i.imgur.com/JyIAXzR.png)

## Install

### Homebrew

```bash
brew tap mnk400/tap
brew install nfo
```

### Manual

```bash
cp nfo ~/.local/bin/nfo
mkdir -p ~/.config/nfo
cp art.sh config.conf ~/.config/nfo/
chmod +x ~/.local/bin/nfo
```

Make sure `~/.local/bin` is in your `PATH`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

```bash
nfo
```

Configuration lives at `~/.config/nfo/config.conf`.

The `print_out()` function controls what appears and in what order:

```bash
print_out() {
    nfo art
    nfo host
    nfo os
    nfo kernel
    nfo up_time
    nfo total_memory
    nfo cpu
    nfo disk
    nfo battery
    nfo colors
}
```

Available entries:

```text
art host colors os kernel resolution up_time current_shell
totalpackages total_memory cpu disk terminal local_ip battery
```

Config options:

```bash
ART='nfo'          # nfo, key, file, name, toilet
TINT='Red'         # Magenta, Red, Blue, Cyan, Yellow, Green
ascii_bold='True'
toilet_host='False'
toilet_msg='this is nfo'
```

`toilet` art and host rendering require the `toilet` command.

## Development

Run with the repo-local config and art files:

```bash
./nfo --super-secret-dev-mode
```

Run tests:

```bash
bats tests/integration.bats
```

## Uninstall

```bash
brew uninstall nfo
```

Manual install:

```bash
rm ~/.local/bin/nfo
rm -rf ~/.config/nfo
```
