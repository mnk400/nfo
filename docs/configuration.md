# Configuration

nfo reads its config from `~/.config/nfo/nfo.conf`. The file defines a handful of options
plus an `INFO_ROWS` array that controls which info rows appear in the right-hand column
and in what order.

## Options

```bash
ART='nfo'              # art piece — resolves to art/<ART>.txt
TINT='Cyan'            # accent color — Red, Green, Yellow, Blue, Magenta, Cyan
DOTS='small'           # color preview row — small, medium, square, none
SHOW_HOST='True'       # show user@host header above the rows
```

`ART` resolves to `~/.config/nfo/art/<name>.txt` — drop new `.txt` files in that directory
to add more art.

## `INFO_ROWS`

```bash
INFO_ROWS=(
    os
    krn
    up
    sh
    pkg
    mem
    cpu
    dsk
    bat
)
```

Reorder, comment out, or remove entries to taste. Battery is skipped automatically on
machines without a battery.

## Available rows

```text
os     OS name and version
krn    kernel name and version
up     system uptime
sh     current shell
pkg    installed package count
mem    used / total memory
cpu    CPU model
dsk    used / total disk for /
bat    battery percentage
res    display resolution
term   terminal program
ip     local IP address
```
