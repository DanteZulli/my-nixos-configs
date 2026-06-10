{
  config,
  lib,
  ...
}: let
  cfg = config.modules.fonts;
in {
  options.modules.fonts.enable = lib.mkEnableOption "fonts";

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.defaultFonts.monospace = ["Source Code Pro"];
  };
}
