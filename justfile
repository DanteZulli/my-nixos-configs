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

# ---

# One-shot opencode run (e.g. `just change update flake inputs`)
[group('opencode')]
change +query:
    opencode run --dangerously-skip-permissions "{{query}}"

# Git add, commit, and push (alias for the alias)
[group('git')]
sync:
    git add . && git commit && git push
