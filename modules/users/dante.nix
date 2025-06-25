{ config, pkgs, ... }:

{
  users.users.dante = {
    isNormalUser = true;
    description = "Dante Zulli";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
    packages = with pkgs; [];
  };
}
