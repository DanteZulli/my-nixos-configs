{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alejandra
    ani-cli
    blueberry
    btop
    code-cursor
    dbeaver-bin
    (discord.override {
      withOpenASAR = true;
    })
    eog
    fastfetch
    fortune
    grim
    hyprpicker
    hyprpolkitagent
    hyprsunset
    krabby
    libnotify
    lm_sensors
    networkmanagerapplet
    nixfmt-rfc-style
    nodejs
    nwg-look
    pnpm
    prusa-slicer
    qbittorrent
    rose-pine-hyprcursor
    slurp
    swaybg
    teamspeak6-client
    teamspeak_server
    temurin-bin
    udiskie
    wget
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.thunar-vcs-plugin
    xfce.thunar-volman
    zapzap
  ];
}
