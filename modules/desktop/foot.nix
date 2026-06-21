{
  den,
  lib,
  ...
}: let
  inherit (import ../../assets/colors.nix) primary normal bright;
  strip = s: lib.removePrefix "#" s;
in {
  den.aspects.desktop.foot.homeManager = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "monospace:size=12";
        };
        scrollback = {
          lines = 100000;
        };
        colors-dark = {
          alpha = 0.8;

          foreground = strip primary.foreground;
          background = strip primary.background;

          regular0 = strip normal.black;
          regular1 = strip normal.red;
          regular2 = strip normal.green;
          regular3 = strip normal.yellow;
          regular4 = strip normal.blue;
          regular5 = strip normal.magenta;
          regular6 = strip normal.cyan;
          regular7 = strip normal.white;

          bright0 = strip bright.black;
          bright1 = strip bright.red;
          bright2 = strip bright.green;
          bright3 = strip bright.yellow;
          bright4 = strip bright.blue;
          bright5 = strip bright.magenta;
          bright6 = strip bright.cyan;
          bright7 = strip bright.white;
        };
      };
    };
  };
}
