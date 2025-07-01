{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "rose-pine-cursor";
      package = pkgs.rose-pine-cursor;
    };
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "oomox-rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
  };
}
