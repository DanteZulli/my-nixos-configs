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
          modules-right = ["tray" "custom/separator" "pulseaudio" "custom/separator" "memory" "custom/separator" "cpu" "custom/separator" "network"];

          "sway/workspaces" = {
            all-outputs = true;
          };

          "clock" = {
            interval = 1;
            format = "{:%a %d/%m %H:%M:%S}";
            timezone = "America/Argentina/Buenos_Aires";
          };

          "pulseaudio" = {
            format = "<span color='${colors.normal.green}'>vol</span> {volume}%";
            format-muted = "<span color='${colors.bright.black}'>muted</span>";
          };

          "memory" = {
            format = "<span color='${colors.normal.green}'>ram</span> {}%";
          };

          "cpu" = {
            format = "<span color='${colors.normal.green}'>cpu</span> {usage}%";
          };

          "network" = {
            format-wifi = "{essid} {ipaddr}";
            format-ethernet = "<span color='${colors.normal.green}'>{ifname}</span> {ipaddr}";
            format-disconnected = "disconnected";
          };

          "tray" = {
            spacing = 5;
          };

          "custom/separator" = {
            format = "<span color='${colors.normal.magenta}'>/</span>";
            interval = "once";
            tooltip = false;
          };
        };
      };
      style = ''
        * {
          font-family: "SauceCodePro Nerd Font Mono";
          min-height: 0;
        }

        window#waybar {
          background: ${colors.primary.background};
          color: ${colors.primary.foreground};
          border-bottom: 0px;
        }

        #workspaces button {
          background: ${colors.primary.background};
          color: ${colors.bright.black};
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
