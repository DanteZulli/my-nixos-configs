{
  config,
  lib,
  ...
}: let
  cfg = config.modules.hardware;
in {
  options.modules.hardware.enable = lib.mkEnableOption "hardware";

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
