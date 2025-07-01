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
    mako
    libnotify
    wl-clipboard
    rofi-wayland
    swww
    grim
    slurp

    rose-pine-hyprcursor
    rose-pine-gtk-theme
    rose-pine-kvantum
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
