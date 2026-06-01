{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.i3;
  wallpaper = ../../../assets/background-image.png;
in {
  options.i3.enable = lib.mkEnableOption "i3";

  config = lib.mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
        fonts = {
          names = ["System Sans"];
          size = 11.0;
        };
        gaps = {
          inner = 6;
          outer = 3;
        };
        colors = {
          focused = {
            border = "#98bb6c";
            background = "#1f1f28";
            text = "#dcd7ba";
            indicator = "#98bb6c";
            childBorder = "#98bb6c";
          };
          focusedInactive = {
            border = "#727169";
            background = "#1f1f28";
            text = "#727169";
            indicator = "#727169";
            childBorder = "#727169";
          };
          unfocused = {
            border = "#54546d";
            background = "#1f1f28";
            text = "#54546d";
            indicator = "#54546d";
            childBorder = "#54546d";
          };
          urgent = {
            border = "#e82424";
            background = "#e82424";
            text = "#dcd7ba";
            indicator = "#e82424";
            childBorder = "#e82424";
          };
          background = "#1f1f28";
        };
        bars = [
          {
            position = "top";
            fonts = {
              names = ["System Sans"];
              size = 11.0;
            };
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
            colors = {
              background = "#1f1f28";
              statusline = "#dcd7ba";
              separator = "#54546d";
              focusedWorkspace = {
                border = "#98bb6c";
                background = "#2a2a37";
                text = "#dcd7ba";
              };
              inactiveWorkspace = {
                border = "#54546d";
                background = "#1f1f28";
                text = "#54546d";
              };
              urgentWorkspace = {
                border = "#e82424";
                background = "#e82424";
                text = "#dcd7ba";
              };
            };
          }
        ];
      };
      extraConfig = ''
        default_border pixel 3

        exec_always --no-startup-id thunar --daemon

        # Volume keys (PipeWire)
        bindsym XF86AudioRaiseVolume exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        bindsym XF86AudioLowerVolume exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        bindsym XF86AudioMute exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

        # Screenshot keys
        bindsym --release Print exec --no-startup-id gnome-screenshot -ca
      '';
    };

    programs.i3status-rust = {
      enable = true;
      bars = {
        top = {
          blocks = [
            {
              block = "sound";
              device_kind = "sink";
            }
            {
              block = "time";
              interval = 60;
              format = "$timestamp.datetime(f:'%a %d/%m %k:%M %p')";
            }
          ];
          settings = {
            theme = {
              theme = "plain";
              overrides = {
                idle_bg = "#1f1f28";
                idle_fg = "#dcd7ba";
                good_bg = "#1f1f28";
                good_fg = "#98bb6c";
                warning_bg = "#1f1f28";
                warning_fg = "#ffa066";
                critical_bg = "#1f1f28";
                critical_fg = "#e82424";
                info_bg = "#1f1f28";
                info_fg = "#7e9cd8";
                separator_bg = "#1f1f28";
                separator_fg = "#54546d";
              };
            };
          };
        };
      };
    };

    home.file.".background-image".source = wallpaper;
  };
}
