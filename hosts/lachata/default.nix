{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/shared
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.11";

  home-manager.users.dante = import ../../home;
}
