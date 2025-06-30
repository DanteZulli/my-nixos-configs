{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    kitty
    waybar
    mako
    libnotify
    wl-clipboard
    rofi-wayland
    swww
    grim
    slurp
  ];

  security.polkit.enable = true;

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  services.displayManager.ly.enable = true;
}
