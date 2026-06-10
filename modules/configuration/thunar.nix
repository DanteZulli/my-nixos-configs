{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.thunar;
in {
  options.modules.thunar.enable = lib.mkEnableOption "thunar";

  config = lib.mkIf cfg.enable {
    programs.thunar.enable = true;
    programs.xfconf.enable = true;
    programs.thunar.plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];

    services.gvfs.enable = true;
    services.tumbler.enable = true;
    services.udisks2.enable = true;
  };
}
