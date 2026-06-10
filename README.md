# Dante's NixOS Configuration

Flake-based NixOS + Home Manager configuration for **x86_64-linux** machines.

Currently manages a single host (`lachata`) with Sway, a gaming toolchain, and a fully declarative user environment.

## Layout

| Path | What lives there |
|------|------------------|
| `hosts/<name>/` | Per-machine config: imports system modules + enables desired user features. Each host also has an auto-generated `hardware-configuration.nix`. |
| `modules/configuration/` | **System-level** NixOS modules: boot, fonts, nix, timezone, networking, keyboard, ly, hardware, services, gaming, shell, thunar, users. All feature-gated via `modules.<name>.enable`. |
| `modules/home/` | **User-level** Home Manager modules for `dante`: packages, CLI tools, GUI apps, shell config. Mostly feature-gated via `<name>.enable` (except `core.nix` and `packages.nix`, which are unconditional). |

## Prerequisites

- **NixOS** (installed, any version)
- **Flakes** enabled (`nix.settings.experimental-features = [ "nix-command" "flakes" ]`)
- **`just`** command runner (or install via `nix-shell -p just`)

## Setup on a new machine

```bash
# 1. Clone the repo
git clone git@github.com:DanteZulli/my-nixos-configs.git /etc/nixos
cd /etc/nixos

# 2. Generate hardware config for this machine
sudo nixos-generate-config --show-hardware-config > hosts/<new-hostname>/hardware-configuration.nix

# 3. Create a host entry
#    Copy hosts/lachata/default.nix to hosts/<new-hostname>/default.nix,
#    update the hostname, enable/disable feature modules as needed.

# 4. Register the host in flake.nix
#    Add: nixosConfigurations.<new-hostname> = mkHost "<new-hostname>";

# 5. Rebuild
sudo nixos-rebuild switch --flake .#<new-hostname>
```

## Day-to-day commands

| Command | What it does |
|---------|-------------|
| `just rebuild` | Format (alejandra) → nixos-rebuild switch (system + home) |
| `just debug` | Same as rebuild with `--show-trace --verbose` |
| `just update` | `nix flake update` (refresh all inputs to latest) |
| `just clean` | Keep last 10 system + user generations, then nix-collect-garbage --delete-old |
| `just list` | Show all available recipes |
| `j <command>` | Zsh alias: runs `just` from the nixos dir regardless of cwd (available when `zsh.enable = true`) |
