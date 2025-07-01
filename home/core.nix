{ pkgs, ... }:

{

  home = {
    username = "dante";
    homeDirectory = "/home/dante";
    stateVersion = "25.05";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "rose-pine-icon-theme";
      package = pkgs.rose-pine-icon-theme;
    };
    theme = {
      name = "rose-pine-gtk-theme";
      package = pkgs.rose-pine-gtk-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  programs.home-manager.enable = true;
}
