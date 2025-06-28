{
  pkgs,
  ...
}:

{
  services = {
    xserver = {
      enable = true;
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3blocks
          i3lock
          i3status
        ];
      };
    };

    displayManager = {
      sddm = {
        enable = true;
      };
    };
  };
}
