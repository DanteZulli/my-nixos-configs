{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.polybar;
in {
  options.polybar.enable = lib.mkEnableOption "polybar";

  config = lib.mkIf cfg.enable {
    services.polybar = {
      enable = true;
      package = pkgs.polybarFull;
      script = "";
      settings = {
        "bar/main" = {
          width = "100%";
          height = 24;
          radius = 0;
          fixed-center = true;
          background = "#1f1f28";
          foreground = "#dcd7ba";
          line-size = 2;
          border-bottom-size = 0;
          module-margin-left = 2;
          module-margin-right = 2;
          modules-left = "i3 title";
          modules-center = "date";
          modules-right = "fs volume memory cpu network";
          font = ["Source Code Pro:size=11;2"];
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
        };

        "module/i3" = {
          type = "internal/i3";
          format = "<label-state> <label-mode>";
          label-focused = "%name%";
          label-focused-foreground = "#dcd7ba";
          label-focused-background = "#2a2a37";
          label-focused-underline = "#98bb6c";
          label-focused-padding = 1;
          label-visible = "%name%";
          label-visible-foreground = "#727169";
          label-visible-padding = 1;
          label-unfocused = "%name%";
          label-unfocused-foreground = "#54546d";
          label-unfocused-padding = 1;
          label-urgent = "%name%";
          label-urgent-foreground = "#e82424";
          label-urgent-padding = 1;
        };

        "module/title" = {
          type = "internal/xwindow";
          format = "<label>";
          label = "%name%";
          label-maxlen = 60;
          label-foreground = "#c8c093";
        };

        "module/date" = {
          type = "internal/date";
          interval = 60;
          date = "%a %d/%m %H:%M:%S";
          label = "%date%";
        };

        "module/fs" = {
          type = "internal/fs";
          mountpoint = "/";
          label = "%free%";
          label-foreground = "#c8c093";
        };

        "module/volume" = {
          type = "internal/pulseaudio";
          label-volume = "%percentage%%";
          label-muted = "muted";
          label-muted-foreground = "#727169";
          label-volume-foreground = "#c8c093";
        };

        "module/memory" = {
          type = "internal/memory";
          label = "ram %percentage_used%%";
          label-foreground = "#c8c093";
        };

        "module/cpu" = {
          type = "internal/cpu";
          label = "cpu %percentage%%";
          label-foreground = "#c8c093";
        };

        "module/network" = {
          type = "internal/network";
          interface-type = "wired";
          label-connected = "%local_ip%";
          label-disconnected = "disconnected";
          label-disconnected-foreground = "#e82424";
          label-connected-foreground = "#c8c093";
        };
      };
    };
  };
}
