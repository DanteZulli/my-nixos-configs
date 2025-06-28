{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common.nix
    ../../modules/desktop/gnome.nix
    ../../modules/desktop/xmonad.nix
    ../../modules/users/dante.nix
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.05";
}
