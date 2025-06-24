{
  pkgs,
  lib,
  ...
}: let
  mod = "Mod4";
in {

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    config = rec {
      modifier = mod;
      terminal = "foot";
      bars = [];
      floating.titlebar = false;
      window.titlebar = false;
    };
    wrapperFeatures.gtk = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    #style = pkgs.lib.readFile ./waybar.css;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "sway";
  };  

  services.cliphist.enable = true;
  
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-fancy}/bin/swaylock-fancy -fF";
      }
      {
        event = "lock";
        command = "lock";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.sway}/bin/swaymsg \"output * power off\"";
        resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * power on\"";
      }
    ];
  };


  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako # notifications
  ];

  xdg = {
    portal = {
      enable = pkgs.stdenv.isLinux;
      config = {
        sway = {
          default = ["gtk"];
          "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
          "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      xdgOpenUsePortal = true;
    };
  };
}
