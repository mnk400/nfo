<!---
https://i.imgur.com/cyk5eVN.png
-->
<h3 align="left"><img src="https://i.imgur.com/9YIHT6C.png" alt="logo" height="80px"></h3>

A CLI fetch utility written in bash

![](https://i.imgur.com/JyIAXzR.png)

## Installation

### Using Brew

To install using `brew` you'd have to tap my homebrew repository

```bash
brew tap manik/tap https://github.com/mnk400/homebrew-tap
brew install nfo
```

### Manual Install

1. Copy `nfo` to a directory in your PATH
2. Copy `art.sh` and `config.conf` to `~/.config/nfo/`
3. Make sure `nfo` is executable: `chmod +x nfo`

### Uninstall

```bash
brew uninstall nfo
```

or if you installed manually

```bash
rm ~/.local/bin/nfo
rm -rf ~/.config/nfo
```

**Note:** Make sure `~/.local/bin` is in your PATH. Add this to your shell config if needed:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Configuration

The configuration file is located at `~/.config/nfo/config.conf`. You can customize what information to display and how it appears.

### Available Display Options

Add any of these to your `print_out()` function in the config file:

| Function | Description | Example Output |
|----------|-------------|----------------|
| `nfo art` | Display ASCII art | Shows selected artwork |
| `nfo host` | Username and hostname | `user@hostname` |
| `nfo colors` | Color palette | Colored blocks |
| `nfo os` | Operating system | `macOS 14.0` or `Ubuntu 22.04` |
| `nfo kernel` | Kernel version | `Darwin 23.0.0` |
| `nfo resolution` | Screen resolution | `1920x1080` |
| `nfo up_time` | System uptime | `2 days, 5 hours` |
| `nfo current_shell` | Current shell | `zsh 5.9` |
| `nfo totalpackages` | Installed packages | `1,234 packages` |
| `nfo total_memory` | Memory usage | `8.0 GiB / 16.0 GiB` |
| `nfo cpu` | CPU information | `Apple M1 Pro` |
| `nfo disk` | Disk usage | `256 GB / 512 GB (50%)` |
| `nfo terminal` | Terminal emulator | `iTerm2` |
| `nfo local_ip` | Local IP address | `192.168.1.100` |

### ASCII Art Options

Set the `ART` variable in your config:

| Option | Description | Requirements |
|--------|-------------|--------------|
| `nfo` | Default nfo logo | None |
| `key` | Keyboard ASCII art | None |
| `file` | File/folder ASCII art | None |
| `name` | Name-based ASCII art | None |
| `toilet` | Custom text with toilet | `toilet` command installed |

### Color Themes

Set the `TINT` variable to one of:
- `Magenta`
- `Red` 
- `Blue`
- `Cyan`
- `Yellow`
- `Green`

### Example Configuration

```bash
# Basic configuration
ART='nfo'
TINT='Red'
ascii_bold='True'

# Custom output - add/remove/reorder as needed
print_out() {
    nfo art
    nfo host
    nfo os
    nfo kernel
    nfo up_time
    nfo total_memory
    nfo cpu
    nfo colors
}
```

### Advanced Options

| Variable | Description | Default |
|----------|-------------|---------|
| `toilet_host` | Use toilet for hostname display | `False` |
| `toilet_msg` | Message for toilet art | `this is nfo` |
