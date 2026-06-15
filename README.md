# My NixOS Configuration

Personal NixOS + Home Manager flake for **x86_64-linux** machines, built with the [Den framework](https://github.com/vic/den).

## Repository layout

- `modules/`: Den framework modules (host, user, services, desktop, tooling, etc.)
- `hosts/<machine>/`: per-host hardware config (auto-generated, do not edit) -> planning to migrate to [NixOS Facter](https://github.com/nix-community/nixos-facter)
- `assets/`: shared assets

## Common commands

### Rebuild and switch (system + home)

```shell
just rebuild
```

### Update all flake inputs

```shell
just update
```

### Test config in a QEMU VM

```shell
just vm
```

### Syntax-check a single file

```shell
nix-instantiate --eval --strict <file>
```
