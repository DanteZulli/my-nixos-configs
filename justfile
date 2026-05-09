check:
    nix flake check

format:
    alejandra --quiet .

rebuild: check
    alejandra --quiet .
    sudo nixos-rebuild switch --flake .#lachata

hm:
    alejandra --quiet .
    home-manager switch --flake .#dante

upgrade: rebuild hm

update:
    nix flake update

clean:
    sudo nix-collect-garbage --delete-older-than 7d
