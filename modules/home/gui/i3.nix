{
  config,
  lib,
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
        bars = [];
      };
      extraConfig = ''
        default_border pixel 3
        for_window [all] border pixel 3

        exec_always --no-startup-id thunar --daemon
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
