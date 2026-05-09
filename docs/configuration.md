# Configuration

nfo reads its config from `~/.config/nfo/config.conf`. Two things live there: the options that
control rendering, and a `print_out()` function that decides which lines appear and in what order.

## Options

```bash
ART='nfo'              # nfo, key, file, name, toilet
TINT='Red'             # Magenta, Red, Blue, Cyan, Yellow, Green
ascii_bold='True'      # bold labels
toilet_host='False'    # render the host line with toilet
toilet_msg='this is nfo'
```

`toilet` art and `toilet_host` require the [`toilet`](http://caca.zoy.org/wiki/toilet) command.

## `print_out()`

The function is called once per run. Each `nfo <name>` call emits a line.

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

Reorder, comment out, or remove entries to taste.

## Available entries

```text
art            host           colors         os
kernel         resolution     up_time        current_shell
totalpackages  total_memory   cpu            disk
terminal       local_ip       battery
```
