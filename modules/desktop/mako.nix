{den, ...}: let
  inherit (import ../../assets/colors.nix) primary normal;
in {
  den.aspects.desktop.mako.homeManager = {
    services.mako = {
      enable = true;
      settings = {
        background-color = primary.background;
        text-color = primary.foreground;
        border-color = normal.blue;
        border-radius = 6;
        default-timeout = 5000;
        width = 350;
        height = 150;
        margin = 12;
        padding = 12;
        anchor = "top-right";
        layer = "overlay";
        max-visible = 5;
        progress-color = normal.green;
      };
    };
  };
}
