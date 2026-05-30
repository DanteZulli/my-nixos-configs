{...}: {
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
    ly.enable = true;
  };
  security.pam.services = {
    i3lock.enable = true;
    i3lock-color.enable = true;
  };
}
