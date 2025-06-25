{ config, pkgs, lib, ... }:

let
  getHardwareConfig = let
    local = ./hardware-configuration.nix;
    global = "/etc/nixos/hardware-configuration.nix";
  in
    if builtins.pathExists local then local
    else if builtins.pathExists global then global
    else throw "hardware-configuration.nix not found";
in

{
  imports = [
    getHardwareConfig
    ../../modules
  ];

  networking.hostName = "lachata";
  system.stateVersion = "25.05";
}