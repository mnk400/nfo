# Development

Run with the repo-local `config.conf` and `art.sh` instead of the installed copies under
`~/.config/nfo/`:

```bash
./nfo --super-secret-dev-mode
```

Run tests (requires [bats](https://github.com/bats-core/bats-core)):

```bash
bats tests/integration.bats
```
