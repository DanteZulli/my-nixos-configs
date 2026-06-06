# List all available recipes
[default]
list:
    @just --list --unsorted

# Build and switch NixOS system + home (#lachata)
[group('nix')]
rebuild:
    alejandra --quiet .
    sudo nixos-rebuild switch --flake .#lachata

# Same as rebuild with verbose debug output
[group('nix')]
debug:
    alejandra --quiet .
    sudo nixos-rebuild switch --flake .#lachata --show-trace --verbose

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

