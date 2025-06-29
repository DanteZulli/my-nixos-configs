{ ... }:

{
  programs.alacritty = {
    enable = true;
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
        size = 11;
      };
    };
  };
}
