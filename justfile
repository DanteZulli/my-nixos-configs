check:
    nix flake check

format:
    alejandra .

rebuild: check
    alejandra .
    sudo nixos-rebuild switch --flake .#lachata

hm:
    alejandra .
    home-manager switch --flake .#dante

upgrade: rebuild hm

update:
    nix flake update

clean:
    sudo nix-collect-garbage --delete-older-than 7d
