{
  config,
  lib,
  ...
}: let
  cfg = config.zoxide;
in {
  options.zoxide.enable = lib.mkEnableOption "zoxide";

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
