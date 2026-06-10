{
  config,
  lib,
  ...
}: let
  cfg = config.modules.services;
in {
  options.modules.services.enable = lib.mkEnableOption "services";

  config = lib.mkIf cfg.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    virtualisation.docker.enable = true;

    security.polkit.enable = true;

    zramSwap.enable = true;
  };
}
