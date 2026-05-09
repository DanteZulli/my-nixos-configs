{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    alsa-utils
    ani-cli
    btop
    direnv
    fastfetch
    fortune
    just
    krabby
    mangohud
    micro
    nodejs_24
    opencode
    protonup-ng
    skyscraper
    vscode-fhs
    zellij
  ];
}
