{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    mangohud
    micro
    opencode
    protonup-ng
    zed-editor
    just
    krabby
    fortune
    alsa-utils
    fastfetch
    btop
    zellij
  ];
}
