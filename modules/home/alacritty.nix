{
  config,
  lib,
  ...
}: let
  cfg = config.alacritty;
  colors = import ../../assets/colors.nix;
in {
  options.alacritty.enable = lib.mkEnableOption "alacritty";

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 0.95;
          dynamic_padding = true;
          padding = {
            x = 5;
            y = 5;
          };
        };
        scrolling = {
          history = 10000;
          multiplier = 5;
        };
        selection.save_to_clipboard = true;
        colors = {
          primary = {
            background = colors.primary.background;
            foreground = colors.primary.foreground;
          };
          normal = {
            inherit (colors.normal) black red green yellow blue magenta cyan white;
          };
          bright = {
            inherit (colors.bright) black red green yellow blue magenta cyan white;
          };
        };
      };
    };
  };
}
