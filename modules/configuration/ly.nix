{
  config,
  lib,
  ...
}: let
  cfg = config.modules.ly;
in {
  options.modules.ly.enable = lib.mkEnableOption "ly";

  config = lib.mkIf cfg.enable {
    programs.sway.enable = true;

    services.displayManager.ly = {
      enable = true;
      defaultSession = "sway";
    };
  };
}
