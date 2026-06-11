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
      nerd-fonts.caskaydia-mono
      nerd-fonts.caskaydia-cove
    ];

    fonts.fontconfig = {
      defaultFonts = {
        serif = ["CaskaydiaCove Nerd Font Light" "CaskaydiaMono Nerd Font Light"];
        sansSerif = ["CaskaydiaCove Nerd Font Light" "CaskaydiaMono Nerd Font Light"];
        monospace = ["CaskaydiaMono Nerd Font Mono Light"];
      };
    };
  };
}
