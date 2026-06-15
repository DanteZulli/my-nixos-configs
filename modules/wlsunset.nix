{ den, ... }:
{
  den.aspects.wlsunset.homeManager = {
    services.wlsunset = {
      enable = true;
      systemdTarget = "sway-session.target";
      latitude = "-34.77";
      longitude = "-58.40";
      temperature = {
        day = 5500;
        night = 3700;
      };
    };

    systemd.user.sessionVariables = {
      WAYLAND_DISPLAY = "wayland-1";
    };
  };
}
