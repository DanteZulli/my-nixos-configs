{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
