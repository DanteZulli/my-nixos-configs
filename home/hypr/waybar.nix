{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        layer = "top";
        position = "top";
        height = 30;
        margin = {
          top = 0;
          bottom = 0;
          left = 0;
          right = 0;
        };
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
