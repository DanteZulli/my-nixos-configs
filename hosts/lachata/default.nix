{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/configuration
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.11";

  modules.boot.enable = true;
  modules.fonts.enable = true;
  modules.nix.enable = true;
  modules.timezone.enable = true;
  modules.networking.enable = true;
  modules.keyboard.enable = true;
  modules.ly.enable = true;
  modules.hardware.enable = true;
  modules.services.enable = true;
  modules.gaming.enable = true;
  modules.shell.enable = true;
  modules.thunar.enable = true;
  modules.users.enable = true;

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
    sway.enable = true;
    waybar.enable = true;
    wlsunset.enable = true;
    mako.enable = true;
    obs-studio.enable = true;
    foot.enable = true;
    wofi.enable = true;
  };
}
