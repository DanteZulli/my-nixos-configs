# List all available recipes
[default]
list:
    @just --list --unsorted

# Build and switch NixOS system + home (#lachata)
[group('nix')]
rebuild:
    nix flake check
    alejandra --quiet .
    sudo nixos-rebuild switch --flake .#lachata

# Same as rebuild with verbose debug output
[group('nix')]
debug:
    nix flake check
    alejandra --quiet .
    sudo nixos-rebuild switch --flake .#lachata --show-trace --verbose

# Update all flake inputs to latest commits
[group('nix')]
update:
    nix flake update

