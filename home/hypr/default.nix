{ hostname, ... }:

{
  imports = [
    (import ./hypr.nix { inherit hostname; })
    ./qt.nix
    ./gtk.nix
    ./wlsunset.nix
    (import ./waybar.nix { inherit hostname; })
    ./mako.nix
    ./rofi.nix
  ];
}
