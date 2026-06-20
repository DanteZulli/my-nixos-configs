# List all available recipes
[default]
list:
    @just --list --unsorted

# Build and switch NixOS system + home (#lachata)
[group('nix')]
rebuild:
    alejandra --quiet .
    nix run .#lachata -- switch

# Keep last 10 system + user generations and GC the store
[group('nix')]
clean:
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +10
    nix-env --profile /home/dante/.local/state/nix/profiles/home-manager --delete-generations +10
    sudo nix-collect-garbage --delete-old

# Update all flake inputs to latest commits
[group('nix')]
update:
    nix flake update

# Run a VM to test a host's config without rebooting (default: lachata)
[group('nix')]
vm hostname="lachata":
    nix run .#vm-{{hostname}}
