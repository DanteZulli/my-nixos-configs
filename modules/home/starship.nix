{
  config,
  lib,
  ...
}: let
  cfg = config.starship;
in {
  options.starship.enable = lib.mkEnableOption "starship";

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
      presets = ["tokyo-night"];
    };
  };
}
