{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.direnv;
in {
  options.direnv.enable = lib.mkEnableOption "direnv";

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
