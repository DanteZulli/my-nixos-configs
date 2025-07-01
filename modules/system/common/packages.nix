{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alejandra
    wget
    nixfmt-rfc-style
    lm_sensors
    fastfetch
    fortune
    btop
    nwg-look
    krabby
  ];
}
