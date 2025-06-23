{ config, pkgs, ... }:

{
  home.username = "dante";
  home.homeDirectory = "/home/dante";

  home.packages = with pkgs; [
    fortune
    btop
    lm_sensors # for `sensors` command
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

  # Home Manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # DO NOT CHANGE
  home.stateVersion = "25.05";
}
