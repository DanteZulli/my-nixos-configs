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
    mako
    libnotify
    wl-clipboard
    rofi-wayland
    swww
    grim
    slurp
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum

    rose-pine-hyprcursor
    rose-pine-icon-theme
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
