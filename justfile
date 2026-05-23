j:
    @echo "rebuild rebuild NixOS system + home (#lachata)"
    @echo "update  update flake lockfile (inputs)"
    @echo "sync    git add + commit + push"
    @echo "change  one-shot opencode run"

rebuild:
    nix flake check
    alejandra --quiet .
    sudo nixos-rebuild switch --flake .#lachata

update:
    nix flake update

sync:
    git add . && git commit && git push

change +query:
    opencode run --dangerously-skip-permissions "{{query}}"
