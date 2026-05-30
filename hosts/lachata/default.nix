{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.11";

  home-manager.users.dante = {...}: {
    imports = [../../modules/home];

    opencode.enable = true;
    git.enable = true;
    firefox.enable = true;
    direnv.enable = true;
    gh.enable = true;
    mangohud.enable = true;
    zsh.enable = true;
    starship.enable = true;
    alacritty.enable = true;
    i3.enable = true;
  };
}
