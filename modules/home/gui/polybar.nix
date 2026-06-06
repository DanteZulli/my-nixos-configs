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
          padding-left = 2;
          padding-right = 2;
          module-margin-left = 2;
          module-margin-right = 2;
          font = [
            "System Sans:size=11;2"
          ];
          modules-left = "i3";
          modules-right = "date";
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
        };
        "module/i3" = {
          type = "internal/i3";
          format = "<label-state> <label-mode>";
          label-focused = "%name%";
          label-focused-background = "#2a2a37";
          label-focused-foreground = "#dcd7ba";
          label-focused-border = "#98bb6c";
          label-focused-padding = 1;
          label-unfocused = "%name%";
          label-unfocused-foreground = "#54546d";
          label-unfocused-padding = 1;
          label-visible = "%name%";
          label-visible-background = "#2a2a37";
          label-visible-foreground = "#727169";
          label-visible-padding = 1;
          label-urgent = "%name%";
          label-urgent-background = "#1f1f28";
          label-urgent-foreground = "#e82424";
          label-urgent-padding = 1;
        };
        "module/date" = {
          type = "internal/date";
          interval = 60;
          date = "%a %d/%m %H:%M";
          label = "%date%";
        };
      };
    };
  };
}
