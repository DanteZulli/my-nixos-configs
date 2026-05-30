{
  config,
  lib,
  ...
}: let
  cfg = config.redshift;
in {
  options.redshift.enable = lib.mkEnableOption "redshift";

  config = lib.mkIf cfg.enable {
    services.redshift = {
      enable = true;
      latitude = "-34.77";
      longitude = "-58.40";
      provider = "manual";
      temperature = {
        day = 5500;
        night = 3700;
      };
    };
  };
}
