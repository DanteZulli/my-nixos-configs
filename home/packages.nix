{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    opencode
    zed-editor
    just
    krabby
    fortune
    alsa-utils
    fastfetch
    btop
  ];
}
