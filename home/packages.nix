{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    alsa-utils
    ani-cli
    btop
    direnv
    fastfetch
    fortune
    gh
    heroic
    just
    krabby
    mangohud
    micro
    nodejs_24
    opencode
    protonup-ng
    podman-compose
    yt-dlp
    blanket
    nicotine-plus
    skyscraper
    temurin-bin
    vscode-fhs
    zellij
  ];
}
