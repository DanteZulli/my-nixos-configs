{
  config,
  lib,
  ...
}: let
  cfg = config.i3;
  wallpaper = ../../../assets/background-image.jpg;
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
        # Colors (Nord)
        colors = {
          focused = {
            border = "#A3BE8C";
            background = "#2E3440";
            text = "#D8DEE9";
            indicator = "#A3BE8C";
            childBorder = "#A3BE8C";
          };
          focusedInactive = {
            border = "#4C566A";
            background = "#2E3440";
            text = "#4C566A";
            indicator = "#4C566A";
            childBorder = "#4C566A";
          };
          unfocused = {
            border = "#3B4252";
            background = "#2E3440";
            text = "#3B4252";
            indicator = "#3B4252";
            childBorder = "#3B4252";
          };
          urgent = {
            border = "#BF616A";
            background = "#BF616A";
            text = "#ECEFF4";
            indicator = "#BF616A";
            childBorder = "#BF616A";
          };
          background = "#2E3440";
        };
        bars = [];
      };
      extraConfig = ''
        default_border pixel 3
        for_window [all] border pixel 3
        exec_always --no-startup-id bash -c "for id in \$(xinput list | grep pointer | cut -d '=' -f 2 | cut -f 1); do xinput --set-prop \$id 'libinput Accel Profile Enabled' 0, 1; done"
        exec_always --no-startup-id polybar main &

        # Volume keys (PipeWire)
        bindsym XF86AudioRaiseVolume exec --no-startup-id wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        bindsym XF86AudioLowerVolume exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        bindsym XF86AudioMute exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

        # Screenshot keys
        bindsym --release Print exec --no-startup-id flameshot gui
      '';
    };

    home.file.".background-image".source = wallpaper;
  };
}
