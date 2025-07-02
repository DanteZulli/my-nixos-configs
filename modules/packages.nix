{ pkgs, ... }:

{
  # ============= SYSTEM PACKAGES =============
  # System level packages, available to all users
  # Location: /run/current-system/sw/bin/
  # Permissions: Requires root privileges to install
  # Usage: System tools, services, global utilities
  environment.systemPackages = with pkgs; [
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
  ];
}
