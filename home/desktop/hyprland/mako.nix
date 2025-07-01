{ ... }:

{
  # https://github.com/rose-pine/mako/blob/main/theme/rose-pine.theme
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      border-radius = 6;
      border-size = 2;
      default-timeout = 5000;
      height = 100;
      width = 300;
      icons = true;
      ignore-timeout = false;
      layer = "top";
      margin = 10;
      markup = true;
      font = "UbuntuMono Nerd Font 12";
      background-color = "#26233a";
      text-color = "#e0def4";
      border-color = "#524f67";
      progress-color = "over #31748f";
    };
  };
}
