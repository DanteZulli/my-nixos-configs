{
  config,
  lib,
  ...
}: let
  cfg = config.waybar;
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
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-muted = "muted";
            format-icons = {
              default = [""];
            };
          };

          "memory" = {
            format = "ram {}%";
          };

          "cpu" = {
            format = "cpu {}%";
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
          font-family: "Source Code Pro", "System Sans";
          font-size: 11px;
          min-height: 0;
        }

        window#waybar {
          background: #2E3440;
          color: #D8DEE9;
          border-bottom: 0px;
        }

        #workspaces button {
          background: #2E3440;
          color: #3B4252;
          padding: 0 4px;
        }

        #workspaces button.focused {
          background: #2E3440;
          color: #D8DEE9;
          border-bottom: 2px solid #A3BE8C;
        }

        #workspaces button.urgent {
          color: #BF616A;
        }

        #clock, #pulseaudio, #memory, #cpu, #network, #tray {
          padding: 0 6px;
          color: #D8DEE9;
        }

        #clock { color: #B48EAD; }
        #pulseaudio { color: #A3BE8C; }
        #memory { color: #EBCB8B; }
        #cpu { color: #81A1C1; }
        #network { color: #88C0D0; }
      '';
    };
  };
}
