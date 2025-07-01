{ hostname, ... }:

{
  imports = [
    (import ./hyprland { inherit hostname; })
  ];
}
