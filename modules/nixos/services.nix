{...}: {
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = true;

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  virtualisation.docker.enable = true;

  zramSwap.enable = true;
}
