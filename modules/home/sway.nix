{
  config,
  lib,
  ...
}: let
  cfg = config.sway;
  colors = import ../../assets/colors.nix;
  wallpaper = ../../assets/background-image.jpg;
in {
  options.sway.enable = lib.mkEnableOption "sway";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      checkConfig = false;
      config = {
        modifier = "Mod4";
        terminal = "foot";
        menu = "wofi --show drun";
        gaps = {
          inner = 6;
          outer = 3;
        };
        colors = {
          focused = {
            border = colors.normal.green;
            background = colors.primary.background;
            text = colors.primary.foreground;
            indicator = colors.normal.green;
            childBorder = colors.normal.green;
          };
          focusedInactive = {
            border = colors.bright.black;
            background = colors.primary.background;
            text = colors.bright.black;
            indicator = colors.bright.black;
            childBorder = colors.bright.black;
          };
          unfocused = {
            border = colors.normal.black;
            background = colors.primary.background;
            text = colors.normal.black;
            indicator = colors.normal.black;
            childBorder = colors.normal.black;
          };
          urgent = {
            border = colors.normal.red;
            background = colors.normal.red;
            text = colors.bright.white;
            indicator = colors.normal.red;
            childBorder = colors.normal.red;
          };
          background = colors.primary.background;
        };
        window = {
          border = 3;
          titlebar = false;
        };
        focus = {
          followMouse = "yes";
          wrapping = "no";
        };
        output = {
          "*" = {
            bg = "${wallpaper} fill";
          };
        };
        input = {
          "*" = {
            accel_profile = "flat";
            xkb_layout = "us";
            xkb_variant = "intl";
          };
        };
        bars = [];
        startup = [
          {command = "waybar";}
          {command = "mako";}
        ];
        keybindings = let
          mod = "Mod4";
        in {
          # Launcher
          "${mod}+Return" = "exec foot";
          "${mod}+d" = "exec wofi --show drun";
          "${mod}+Shift+q" = "kill";

          # Focus
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";
          "${mod}+a" = "focus parent";

          # Move
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          # Workspaces
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          # Move to workspace
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          # Layout
          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          # Reload / exit
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+e" = "exec swaynag -t warning -m 'Exit sway?' -b 'Exit' 'exec sway exit'";

          # Media keys
          "XF86AudioRaiseVolume" = "exec wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

          # Screenshot
          "Print" = "exec grim -g \"$(slurp)\" - | wl-copy";
        };
      };
    };

    home.file.".background-image" = {
      source = wallpaper;
    };
  };
}
