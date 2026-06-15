{den, ...}: {
  den.aspects.services.nixos = {
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
