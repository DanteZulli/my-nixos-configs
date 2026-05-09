check:
    nix flake check

rebuild: check
    sudo nixos-rebuild switch --flake .#lachata

hm:
    home-manager switch --flake .#dante

upgrade: rebuild hm

update:
    nix flake update

clean:
    sudo nix-collect-garbage --delete-older-than 7d
