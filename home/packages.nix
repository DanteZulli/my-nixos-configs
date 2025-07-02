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
    whatsie

    # Thunar File Manager
    thunar
    thunar-archive-plugin
    thunar-volman
    thunar-media-tags-plugin
    thunar-vcs-plugin
  ];
}
