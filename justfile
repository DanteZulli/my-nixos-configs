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
