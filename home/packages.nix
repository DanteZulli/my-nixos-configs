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
    opencode
    protonup-ng
    vscode-fhs
    zellij
  ];
}
