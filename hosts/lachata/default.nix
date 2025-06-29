{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common
    ../../modules/users/dante.nix
    ../../modules/desktop/hyprland.nix
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.05";
}
