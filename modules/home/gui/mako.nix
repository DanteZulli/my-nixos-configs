{
  config,
  lib,
  ...
}: let
  cfg = config.mako;
in {
  options.mako.enable = lib.mkEnableOption "mako";

  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;
      settings = {
        default-timeout = 5000;
        layer = "overlay";
        anchor = "top-right";
        background-color = "#2E3440";
        text-color = "#D8DEE9";
        border-color = "#A3BE8C";
        border-radius = 4;
        border-size = 2;
        width = 350;
        height = 150;
        padding = "10";
        group-by = "app-name";
        sort-by-score = true;
        font = "System Sans 11";
      };
    };
  };
}
