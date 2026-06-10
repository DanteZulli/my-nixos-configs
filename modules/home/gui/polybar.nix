{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.polybar;

  # Colors (Nord)
  colors = {
    bg = "#2E3440";
    fg = "#D8DEE9";

    black = "#3B4252";
    red = "#BF616A";
    green = "#A3BE8C";
    yellow = "#EBCB8B";
    blue = "#81A1C1";
    magenta = "#B48EAD";
    cyan = "#88C0D0";
    white = "#E5E9F0";

    brightBlack = "#4C566A";
    brightRed = "#BF616A";
    brightGreen = "#A3BE8C";
    brightYellow = "#EBCB8B";
    brightBlue = "#81A1C1";
    brightMagenta = "#B48EAD";
    brightCyan = "#8FBCBB";
    brightWhite = "#ECEFF4";

    selectionBg = "#434C5E";
    selectionFg = "#D8DEE9";

    orange = "#D08770";
    salmon = "#BF616A";
  };
in {
  options.polybar.enable = lib.mkEnableOption "polybar";

  config = lib.mkIf cfg.enable {
    services.polybar = {
      enable = true;
      package = pkgs.polybarFull;
      script = ""; # startup command is in i3.nix
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
          label-focused-background = colors.bg;
          label-focused-underline = colors.brightGreen;
          label-focused-padding = 1;
          label-visible = "%name%";
          label-visible-foreground = colors.brightBlack;
          label-visible-padding = 1;
          label-unfocused = "%name%";
          label-unfocused-foreground = colors.brightBlack;
          label-unfocused-padding = 1;
          label-urgent = "%name%";
          label-urgent-foreground = colors.brightRed;
          label-urgent-padding = 1;
        };

        "module/date" = {
          type = "internal/date";
          interval = 1;
          date = "%{F${colors.brightGreen}}%a%{F-} %d%{F${colors.brightMagenta}}/%{F-}%m %H%{F${colors.brightMagenta}}:%{F-}%M%{F${colors.brightMagenta}}:%{F-}%S";
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
