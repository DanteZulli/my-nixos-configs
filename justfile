j:
    @echo "check   validate flake structure"
    @echo "format  format all .nix files (alejandra)"
    @echo "rebuild rebuild NixOS system (#lachata)"
    @echo "hm      switch home-manager config (#dante)"
    @echo "upgrade rebuild + hm (system AND user)"
    @echo "update  update flake lockfile (inputs)"
    @echo "sync    git add + commit + push"
    @echo "change  one-shot opencode run"
    @echo "clean   nix-collect-garbage old gen"

check:
    nix flake check

format:
    alejandra --quiet .

rebuild: check
    alejandra --quiet .
    sudo nixos-rebuild switch --flake .#lachata

hm:
    alejandra --quiet .
    home-manager switch -b backup --flake .#dante

upgrade: rebuild hm

update:
    nix flake update

sync:
    git add . && git commit && git push

change +query:
    opencode run --dangerously-skip-permissions "{{query}}"

clean:
    sudo nix-collect-garbage --delete-older-than 7d
