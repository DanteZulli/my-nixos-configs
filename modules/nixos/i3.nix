{...}: {
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    desktopManager.wallpaper = {
      mode = "fill";
      combineScreens = true;
    };
  };
  services.displayManager = {
    defaultSession = "none+i3";
    ly.enable = true;
  };
}
