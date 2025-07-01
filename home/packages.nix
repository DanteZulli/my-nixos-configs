{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # ===== DEVELOPMENT TOOLS =====
    temurin-bin
    dbeaver-bin

    # ===== PRODUCTIVITY APPS =====
    ferdium
    code-cursor
    (discord.override {
      withOpenASAR = true;
    })

    # ===== MEDIA APPS =====
    qbittorrent
  ];
}
