# Dante's NixOS Configuration

Flake-based NixOS + Home Manager configuration for my personal machines.

## Hosts

| Hostname | Hardware | Role |
|----------|----------|------|
| `lachata` | x86_64-linux | Personal desktop |

## Structure

```
.
├── flake.nix                     # Entry point
├── hosts/
│   └── lachata/                  # NixOS system config
│       ├── default.nix
│       └── hardware-configuration.nix
├── modules/
│   └── shared/                   # Shared NixOS modules
│       ├── boot.nix              # systemd-boot, latest kernel
│       ├── desktop.nix           # X11, LightDM, Budgie
│       ├── hardware.nix          # GPU/graphics enablement
│       ├── networking.nix        # NetworkManager
│       ├── nix.nix               # Flakes, GC config
│       ├── services.nix          # PipeWire, CUPS, Podman, zram
│       ├── shell.nix             # Zsh system-wide
│       ├── timezone.nix          # America/Argentina/Buenos_Aires
│       └── users.nix             # User: dante
└── home/                         # Home Manager (user-level)
    ├── core.nix                  # User config
    ├── packages.nix              # User packages
    ├── programs/
    │   ├── git.nix
    │   └── firefox.nix
    └── shell/
        ├── alacritty.nix
        ├── starship.nix
        └── zsh.nix
```

## Quickstart

```bash
just check       # Validate flake
just rebuild     # Build + switch system
just hm          # Build + switch home-manager
just upgrade     # Both at once
just format      # Format all .nix files with alejandra
just update      # Update flake lockfile
just clean       # GC old Nix store generations
```

## Cheatsheet

```bash
j check       # alias via zsh (runs `just check`)
nix flake check                      # syntax/type validation
nix-instantiate --eval --strict <file>  # eval a single file
```

## Requirements

- NixOS with flakes enabled
- `just` command runner
