{
  config,
  lib,
  ...
}: let
  cfg = config.waybar;
  colors = import ../../assets/colors.nix;
in {
  options.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 24;
          spacing = 4;
          modules-left = ["sway/workspaces"];
          modules-center = ["clock"];
          modules-right = ["pulseaudio" "memory" "cpu" "network" "tray"];

          "sway/workspaces" = {
            all-outputs = true;
          };

          "clock" = {
            interval = 1;
            format = "{:%a %d/%m %H:%M:%S}";
            timezone = "America/Argentina/Buenos_Aires";
          };

          "pulseaudio" = {
            format = "{volume}%";
            format-muted = "muted";
          };

          "memory" = {
            format = "ram {}%";
          };

          "cpu" = {
            format = "cpu {usage}%";
          };

          "network" = {
            format-wifi = "{essid} {ipaddr}";
            format-ethernet = "{ifname} {ipaddr}";
            format-disconnected = "disconnected";
          };

          "tray" = {
            spacing = 5;
          };
        };
      };
      style = ''
        * {
          font-family: "Source Code Pro";
          min-height: 0;
        }

        window#waybar {
          background: ${colors.primary.background};
          color: ${colors.primary.foreground};
          border-bottom: 0px;
        }

        #workspaces button {
          background: ${colors.primary.background};
          color: ${colors.normal.black};
          padding: 0 4px;
        }

        #workspaces button.focused {
          background: ${colors.primary.background};
          color: ${colors.primary.foreground};
          border-bottom: 2px solid ${colors.normal.green};
        }

        #workspaces button.urgent {
          color: ${colors.normal.red};
        }

        #clock, #pulseaudio, #memory, #cpu, #network, #tray {
          padding: 0 6px;
          color: ${colors.primary.foreground};
        }
      '';
    };
  };
}
