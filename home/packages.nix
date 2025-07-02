{ pkgs, ... }:

{
  # ============= USER PACKAGES =============
  # User level packages, available to the current user
  # Location: ~/.nix-profile/bin/
  # Permissions: No root privileges required
  # Usage: Personal tools, applications
  home.packages = with pkgs; [
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
  ];
}
