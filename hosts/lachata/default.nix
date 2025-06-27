{
  config,
  pkgs,
  lib,
  ...
}:

let
  getHardwareConfig =
    let
      local = ./hardware-configuration.nix;
      global = "/etc/nixos/hardware-configuration.nix";
    in
    if builtins.pathExists local then
      local
    else if builtins.pathExists global then
      global
    else
      throw "hardware-configuration.nix not found";
in

{
  imports = [
    getHardwareConfig
    ../../modules/system/packages.nix
    ../../modules/system/zram.nix
    ../../modules/system/keymap.nix
    ../../modules/system/nix.nix
    ../../modules/system/bootloader.nix
    ../../modules/system/networking.nix
    ../../modules/system/time-i18n.nix
    ../../modules/desktop/gnome
    ../../modules/users/dante.nix
  ];

  networking.hostName = "lachata";

  system.stateVersion = "25.05";
}
