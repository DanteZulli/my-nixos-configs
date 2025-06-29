{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common
    ../../modules/desktop/gnome.nix
    ../../modules/users/dante.nix
  ];

  networking.hostName = "negrita";

  system.stateVersion = "25.05";
}
