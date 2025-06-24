{ config, pkgs, ... }:

{

  imports = [
    ./sway.nix
    ./terminal.nix
  ];

  home = {
    username =  "dante";
    homeDirectory = "/home/dante";
  };

  home.packages = with pkgs; [
    # Programming
    code-cursor
    temurin-bin

    # Misc
    fastfetch
    fortune

    # Utilities
    btop
    lm_sensors
  ];

  # Git
  programs.git = {
    enable = true;
    userName = "Dante Zulli";
    userEmail = "dantezulli2004@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      push = { autoSetupRemote = true; };
    };
  };

  # LibreWolf
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
  };

  # Home Manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # DO NOT CHANGE
  home.stateVersion = "25.05";
}
