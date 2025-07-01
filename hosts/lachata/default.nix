{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/hardware
    ../../modules/hardware/graphics/amd.nix
    ../../modules/desktop
    ../../modules/virtualisation
    ../../modules/packages.nix
    ../../modules/users/dante.nix
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.05";
}
