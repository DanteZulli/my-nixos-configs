{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.users;
in {
  options.modules.users.enable = lib.mkEnableOption "users";

  config = lib.mkIf cfg.enable {
    users.users.dante = {
      isNormalUser = true;
      description = "Dante Zulli";
      shell = pkgs.bash;
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "input"
        "render"
        "gamemode"
        "docker"
      ];
    };
  };
}
