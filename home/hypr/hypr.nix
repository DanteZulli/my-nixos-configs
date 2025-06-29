{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  home.file.".config/hypr/hyprland.conf".text = builtins.readFile ./hyprland.conf;
  
}
