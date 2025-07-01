{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Rose Pine";
      package = pkgs.rose-pine-cursor;
    };
    theme = {
      name = "Rose Pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "Rose Pine";
      package = pkgs.rose-pine-icon-theme;
    };
  };
}
