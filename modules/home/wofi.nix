{
  config,
  lib,
  ...
}: let
  cfg = config.wofi;
in {
  options.wofi.enable = lib.mkEnableOption "wofi";

  config = lib.mkIf cfg.enable {
    programs.wofi = {
      enable = true;
      settings = {
        show = "drun";
        matching = "fuzzy";
        no_actions = true;
        insensitive = true;
      };
      style = ''

      '';
    };
  };
}
