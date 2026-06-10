{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.boot;
in {
  options.modules.boot.enable = lib.mkEnableOption "boot";

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 10;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
