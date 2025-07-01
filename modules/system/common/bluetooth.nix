{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  hardware.pulseaudio.enable = true;

}
