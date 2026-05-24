{
  config,
  lib,
  ...
}: let
  cfg = config.gh;
in {
  options.gh.enable = lib.mkEnableOption "gh";

  config = lib.mkIf cfg.enable {
    programs.gh = {
      enable = true;
      settings = {
        git_protocol = "https";
        prompt = "enabled";
        aliases.co = "pr checkout";
      };
    };
  };
}
