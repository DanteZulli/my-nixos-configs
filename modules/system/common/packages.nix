{ ... }:

{
  environment.systemPackages = with pkgs; [
    alejandra
    wget
    nixfmt-rfc-style
    libnotify
    lm_sensors
    fastfetch
    fortune
    nnn
  ];
}
