{
  config,
  lib,
  ...
}: let
  cfg = config.modules.keyboard;
in {
  options.modules.keyboard.enable = lib.mkEnableOption "keyboard";

  config = lib.mkIf cfg.enable {
    console.keyMap = "us-acentos";
  };
}
