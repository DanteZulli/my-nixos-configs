{ hostname, ... }:

{
  imports = [
    (import ./hyprland.nix { inherit hostname; })
    ./qt.nix
    ./gtk.nix
    ./waybar.nix
    ./mako.nix
    ./rofi.nix
  ];
}
