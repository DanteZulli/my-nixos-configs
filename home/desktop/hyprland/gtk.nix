{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "BreezeX-RoséPine"; # Really? This is a joke right?
      package = pkgs.rose-pine-cursor;
    };
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
  };
}
