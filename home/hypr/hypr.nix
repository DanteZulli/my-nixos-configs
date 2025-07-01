{ hostname, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {

      # Monitors
      monitor =
        if hostname == "lachata" then
          [
            "DP-1,1920x1080@60,1920x0,1"
            "DP-2,1920x1080@60,0x0,1, transform, 1"
          ]
        else
          [
            "preferred,auto,auto"
          ];

      # Programs
      "$terminal" = "alacritty";
      "$menu" = "rofi -show drun";
      "$fileManager" = "dolphin";

      # Autostart
      "exec-once" = [
        "waybar &"
      ];

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE,24"
      ];

      # General
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "$rose $pine $love $iris 90deg";
        "col.inactive_border" = "$muted";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration
      decoration = {
        rounding = 6;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # Animations
      animations = {
        enabled = "yes, please :)";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # Dwindle
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master
      master = {
        new_status = "master";
      };

      # Misc
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      # Input
      input = {
        kb_layout =
          if hostname == "lachata" then
            "us"
          else if hostname == "negrita" then
            "es"
          else if hostname == "vivobook" then
            "latam"
          else
            "us";
        kb_variant = if hostname == "lachata" then "intl" else "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = false;
        };
      };

      # Gestures
      gestures = {
        workspace_swipe = false;
      };

      # Keybindings
      "$mainMod" = "SUPER";

      # Variables
      # name: Rosé Pine
      # author: jishnurajendran
      # upstream: https://github.com/jishnurajendran/hyprland-rosepine/blob/main/rose-pine.conf
      # All natural pine, faux fur and a bit of soho vibes for the classy minimalist
      "$base" = "0xff191724";
      "$surface" = "0xff1f1d2e";
      "$overlay" = "0xff26233a";
      "$muted" = "0xff6e6a86";
      "$subtle" = "0xff908caa";
      "$text" = "0xffe0def4";
      "$love" = "0xffeb6f92";
      "$gold" = "0xfff6c177";
      "$rose" = "0xffebbcba";
      "$pine" = "0xff31748f";
      "$foam" = "0xff9ccfd8";
      "$iris" = "0xffc4a7e7";
      "$highlightLow" = "0xff21202e";
      "$highlightMed" = "0xff403d52";
      "$highlightHigh" = "0xff524f67";

      # Workspaces - only defined for lachata
      workspace =
        if hostname == "lachata" then
          [
            "1, monitor:DP-1, default:true"
            "2, monitor:DP-1"
            "3, monitor:DP-1"
            "4, monitor:DP-1"
            "5, monitor:DP-1"
            "6, monitor:DP-1"
            "7, monitor:DP-1"
            "8, monitor:DP-1"
            "9, monitor:DP-2, default:true"
            "10, monitor:DP-2"
          ]
        else
          null;

      # Bindings
      bind = [
        # Terminal
        "$mainMod, Return, exec, $terminal"
        # Kill window
        "$mainMod SHIFT, Q, killactive"
        # Launcher
        "$mainMod, D, exec, $menu"
        # Exit session
        "$mainMod SHIFT, E, exit"
        # Focus movement (arrow keys)
        "$mainMod, left, movefocus, l"
        "$mainMod, down, movefocus, d"
        "$mainMod, up, movefocus, u"
        "$mainMod, right, movefocus, r"
        # Move window (arrow keys)
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, right, movewindow, r"
        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Move to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Fullscreen
        "$mainMod, F, fullscreen"
        # Screenshot
        ", Print, exec, grim -l 0 -g \"$(slurp)\" - | wl-copy"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Multimedia keys
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Player controls
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Window rules
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
