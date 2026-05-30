{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.i3;
in {
  options.i3.enable = lib.mkEnableOption "i3";

  config = lib.mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod1";
        terminal = "alacritty";
        gaps = {
          inner = 10;
          outer = 5;
        };
        bars = [{
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
        }];
      };
      extraConfig = ''
        default_border none
      '';
    };
  };
}
