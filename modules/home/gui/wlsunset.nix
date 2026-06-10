{
  config,
  lib,
  ...
}: let
  cfg = config.wlsunset;
in {
  options.wlsunset.enable = lib.mkEnableOption "wlsunset";

  config = lib.mkIf cfg.enable {
    services.wlsunset = {
      enable = true;
      latitude = "-34.77";
      longitude = "-58.40";
      temperature = {
        day = 5500;
        night = 3700;
      };
    };
  };
}
