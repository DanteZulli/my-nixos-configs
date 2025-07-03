{
  ...
}:

{
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        layer = "top";
        position = "top";
        height = 0;
        margin = "0 0 0 0";
        modules-left = [
          "clock"
          "clock#date"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "cpu"
          "memory"
          "temperature"
          "disk"
          "network"
          "pulseaudio"
          "battery"
          "tray"
        ];
        "cpu" = {
          format = "{usage}%  ";
          interval = 5;
        };
        "memory" = {
          format = "{used} / {total}  ";
          interval = 5;
        };
        "temperature" = {
          format = "{temperature}  ";
          interval = 5;
        };
        "disk" = {
          format = "{used} / {total}  ";
          interval = 5;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = " ";
            default = " ";
          };
        };
        "tray" = {
          spacing = 5;
          tooltip = false;
        };
        "clock" = {
          timezone = "America/Argentina/Buenos_Aires";
          format = "󰥔  {:%H:%M}";
          tooltip = false;
          interval = 60;
        };
        "clock#date" = {
          format = "  {:%d/%m/%Y}";
          tooltip = false;
          interval = 60;
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "B: {capacity}%";
          format-charging = "B: {capacity}% Chr";
          format-plugged = "B: {capacity}% Conn";
          format-alt = "{time}";
        };
        "network" = {
          tooltip = true;
          rotate = 0;
          format-wifi = "󰖩   {bandwidthDownBytes}  {bandwidthUpBytes}";
          format-ethernet = "   {bandwidthDownBytes}  {bandwidthUpBytes}";
          format-disconnected = "  󰌙  ";
          tooltip-format = "󰩟 {ifname}: {gwaddr}";
          tooltip-format-disconnected = "  󰌙  ";
          interval = 5;
        };
        "pulseaudio" = {
          scroll-step = 1;
          max-volume = 130;
          format = "  {volume}%";
          format-bluetooth = " {volume}%";
          format-muted = "󰝟  muted";
          nospacing = 1;
          on-click = "pavucontrol";
          tooltip = false;
        };
      };
    };
    style = ''
      @define-color base            #191724;
      @define-color surface         #1f1d2e;
      @define-color overlay         #26233a;

      @define-color muted           #6e6a86;
      @define-color subtle          #908caa;
      @define-color text            #e0def4;

      @define-color love            #eb6f92;
      @define-color gold            #f6c177;
      @define-color rose            #ebbcba;
      @define-color pine            #31748f;
      @define-color foam            #9ccfd8;
      @define-color iris            #c4a7e7;

      @define-color highlightLow    #21202e;
      @define-color highlightMed    #403d52;
      @define-color highlightHigh   #524f67;
            

      * {
        border: none;
        border-radius: 0;
        margin: 0;
        padding: 2px;
        font-family: "UbuntuMono Nerd Font";
        font-size: 13px;
      }

      window#waybar {
        background: @surface;
      }

      #workspaces {
        background-color: @base;
        padding: 1px;
        border: 1px solid @overlay;
        border-radius: 8px;
        color: @muted;
      }

      #workspaces button {
        background-color: transparent;
        padding: 0;
        margin: 0;
        border: none;
        box-shadow: none;
        border-radius: 0;
        background-image: none;
        color: @muted;
      }

      #workspaces button:hover {
        color: @text;
      }

      #workspaces button.active {
        color: @text;
      }

      #workspaces button.urgent {
        background-color: @love;
      }

      #cpu,
      #memory,
      #temperature,
      #disk,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #tray {
        background-color: @base;
        padding: 4px 6px;
        border: 1px solid @overlay;
        border-radius: 8px;
        color: @text;
      }

      #clock {
        color: @gold;
      }

      #memory,
      #network {
        color: @foam;
      }

      #cpu,
      #pulseaudio {
        color: @iris;
      }

      #temperature {
        color: @rose;
      }

      #disk {
        color: @pine;
      }
    '';
  };
}
