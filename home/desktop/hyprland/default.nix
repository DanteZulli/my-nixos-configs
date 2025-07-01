{ hostname, ... }:

{
  imports = [
    (import ./hyprland.nix { inherit hostname; })
    ./qt.nix
    ./gtk.nix
    ./wlsunset.nix
    ./waybar.nix
    ./mako.nix
    ./wofi.nix
  ];
}
