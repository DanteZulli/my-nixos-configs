{ ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "rose_pine";
    settings = {
      window.opacity = 0.95;
      window.dynamic_padding = true;
      window.padding = {
        x = 5;
        y = 5;
      };
      scrolling.history = 10000;
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      font = {
        size = 12;
        normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "UbuntuMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "UbuntuMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "UbuntuMono Nerd Font";
          style = "Bold Italic";
        };
      };
    };
  };
}
