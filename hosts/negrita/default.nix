{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/hardware
    ../../modules/desktop
    ../../modules/virtualisation
    ../../modules/packages.nix
    ../../modules/users/dante.nix
  ];

  networking.hostName = "negrita";

  system.stateVersion = "25.05";
}
