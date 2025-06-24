{ config, pkgs, ... }:

{
  home = {
    username =  "dante";
    homeDirectory = "/home/dante";
  };

  home.packages = with pkgs; [
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

  # Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      fortune
    '';
    shellAliases = {
      nswitch= "sudo nixos-rebuild switch --flake ~/.my-nixos-configs#lachata";
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

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "foot";
    };
  };

  # Home Manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # DO NOT CHANGE
  home.stateVersion = "25.05";
}
