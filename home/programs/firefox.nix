{
  config,
  lib,
  ...
}: let
  cfg = config.firefox;
in {
  options.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf cfg.enable {
    programs.firefox.enable = true;
  };
}
