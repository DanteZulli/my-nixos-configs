{
  config,
  lib,
  ...
}: let
  cfg = config.git;
in {
  options.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user.name = "Dante Zulli";
        user.email = "dantezulli2004@gmail.com";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };
  };
}
