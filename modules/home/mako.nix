{
  config,
  lib,
  ...
}: let
  cfg = config.mako;
  inherit (import ../../assets/colors.nix) primary normal;
in {
  options.mako.enable = lib.mkEnableOption "mako";

  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;
      settings = {
        font = "SauceCodePro Nerd Font Mono 10";
        background-color = primary.background;
        text-color = primary.foreground;
        border-color = normal.blue;
        border-radius = 6;
        default-timeout = 5000;
        width = 350;
        height = 150;
        margin = 12;
        padding = 12;
        anchor = "top-right";
        layer = "overlay";
        max-visible = 5;
        progress-color = normal.green;
      };
    };
  };
}
