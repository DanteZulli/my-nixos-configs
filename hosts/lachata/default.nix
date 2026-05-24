{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/shared
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.11";

  home-manager.users.dante = {...}: {
    imports = [../../home];

    git.enable = true;
    firefox.enable = true;
    direnv.enable = true;
    zoxide.enable = true;
    gh.enable = true;
    mangohud.enable = true;
    zellij.enable = true;
    zsh.enable = true;
    starship.enable = true;
    alacritty.enable = true;
  };
}
