{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.polybar;

  colors = {
    bg = "#1f1f28";
    fg = "#dcd7ba";

    black = "#090618";
    red = "#c34043";
    green = "#76946a";
    yellow = "#c0a36e";
    blue = "#7e9cd8";
    magenta = "#957fb8";
    cyan = "#6a9589";
    white = "#c8c093";

    brightBlack = "#727169";
    brightRed = "#e82424";
    brightGreen = "#98bb6c";
    brightYellow = "#e6c384";
    brightBlue = "#7fb4ca";
    brightMagenta = "#938aa9";
    brightCyan = "#7aa89f";
    brightWhite = "#dcd7ba";

    selectionBg = "#2d4f67";
    selectionFg = "#c8c093";

    orange = "#ffa066";
    salmon = "#ff5d62";
  };
in {
  options.polybar.enable = lib.mkEnableOption "polybar";

  config = lib.mkIf cfg.enable {
    services.polybar = {
      enable = true;
      package = pkgs.polybarFull;
      script = "polybar main &";
      settings = {
        "bar/main" = {
          width = "100%";
          height = 24;
          radius = 0;
          fixed-center = true;
          background = colors.bg;
          foreground = colors.fg;
          line-size = 2;
          border-bottom-size = 0;
          separator = " %{F${colors.brightMagenta}}/%{F-} ";
          padding-right = 1;
          modules-left = "i3";
          modules-center = "date";
          modules-right = "volume memory cpu network tray";
          font = ["Source Code Pro:size=11;2"];
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
        };

        "module/i3" = {
          type = "internal/i3";
          format = "<label-state> <label-mode>";
          label-focused = "%name%";
          label-focused-foreground = colors.fg;
          label-focused-background = "#2a2a37";
          label-focused-underline = colors.brightGreen;
          label-focused-padding = 1;
          label-visible = "%name%";
          label-visible-foreground = colors.brightBlack;
          label-visible-padding = 1;
          label-unfocused = "%name%";
          label-unfocused-foreground = "#54546d";
          label-unfocused-padding = 1;
          label-urgent-foreground = colors.brightRed;
          label-urgent-padding = 1;
        };

        "module/date" = {
          type = "internal/date";
          interval = 60;
          date = "%{F${colors.brightMagenta}}%a%{F-} %d%{F${colors.brightMagenta}}/%{F-}%m %H%{F${colors.brightMagenta}}:%{F-}%M%{F${colors.brightMagenta}}:%{F-}%S";
          label = "%date%";
        };

        "module/volume" = {
          type = "internal/pulseaudio";
          label-volume = "%{F${colors.brightGreen}}vol%{F-} %percentage%%";
          label-muted = "muted";
          label-muted-foreground = colors.brightBlack;
          label-volume-foreground = colors.white;
        };

        "module/memory" = {
          type = "internal/memory";
          label = "%{F${colors.brightGreen}}ram%{F-} %percentage_used%%";
          label-foreground = colors.white;
        };

        "module/cpu" = {
          type = "internal/cpu";
          label = "%{F${colors.brightGreen}}cpu%{F-} %percentage%%";
          label-foreground = colors.white;
        };

        "module/network" = {
          type = "internal/network";
          interface-type = "wired";
          label-connected = "%{F${colors.brightGreen}}%ifname%%{F-} %local_ip%";
          label-disconnected = "disconnected";
          label-disconnected-foreground = colors.brightRed;
          label-connected-foreground = colors.white;
        };

        "module/tray" = {
          type = "internal/tray";
          tray-spacing = 5;
        };
      };
    };
  };
}
