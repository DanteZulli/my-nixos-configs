{ hostname, ... }:

{
  imports = [
    (import ./hypr.nix { inherit hostname; })
    ./wlsunset.nix
    (import ./waybar.nix { inherit hostname; })
    ./mako.nix
    ./rofi.nix
  ];
}
