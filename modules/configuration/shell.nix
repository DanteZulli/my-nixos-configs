{
  config,
  lib,
  ...
}: let
  cfg = config.modules.shell;
in {
  options.modules.shell.enable = lib.mkEnableOption "shell";

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
  };
}
