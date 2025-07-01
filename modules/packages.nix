{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ===== NIX DEVELOPMENT TOOLS =====
    alejandra
    nixfmt-rfc-style

    # ===== SYSTEM MONITORING & INFO =====
    btop
    lm_sensors
    fastfetch

    # ===== UTILITIES =====
    wget
    fortune
    krabby

    # ===== DESKTOP UTILITIES =====
    nwg-look
  ];
}
