{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alejandra
    nixfmt-rfc-style
    btop
    lm_sensors
    fastfetch
    wget
    fortune
    krabby
    nwg-look
    udiskie
    temurin-bin
    dbeaver-bin
    code-cursor
    (discord.override {
      withOpenASAR = true;
    })
    prusa-slicer
    qbittorrent
    ani-cli
    zapzap
    libnotify
    wl-clipboard
    swaybg
    grim
    slurp
    hyprsunset
    rose-pine-hyprcursor

    # Thunar File Manager
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.thunar-media-tags-plugin
    xfce.thunar-vcs-plugin

    eog
  ];
}
