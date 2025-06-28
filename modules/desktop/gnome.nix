{
  ...
}:

{
  services = {

    xserver = {
      enable = false;

      displayManager = {
        gdm = {
          enable = true;
        };
      };

      desktopManager = {
        gnome = {
          enable = true;
        };
      };

    };

    gnome.core-apps.enable = false;
  };
}
