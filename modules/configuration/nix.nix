{
  config,
  lib,
  ...
}: let
  cfg = config.modules.nix;
in {
  options.modules.nix.enable = lib.mkEnableOption "nix";

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nixpkgs.config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
  };
}
