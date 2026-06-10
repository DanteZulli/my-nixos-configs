{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.fonts;
in {
  options.modules.fonts.enable = lib.mkEnableOption "fonts";

  config = lib.mkIf cfg.enable {
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
      nerd-fonts.sauce-code-pro
    ];

    fonts.fontconfig = {
      defaultFonts = {
        serif = ["SauceCodePro Nerd Font"];
        sansSerif = ["SauceCodePro Nerd Font"];
        monospace = ["SauceCodePro Nerd Font Mono"];
      };
    };
  };
}
