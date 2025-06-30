{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hypr/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "network"
          "tray"
          "clock"
        ];
      };
    };
  };
}
