{ config, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    # https://github.com/rose-pine/rofi/blob/main/rose-pine.rasi
    theme =
      let
        # Color variables
        bg = "#191724";
        cur = "#1f1d2e";
        fgd = "#e0def4";
        cmt = "#6e6a86";
        cya = "#9ccfd8";
        grn = "#31748f";
        ora = "#ebbcba";
        pur = "#c4a7e7";
        red = "#eb6f92";
        yel = "#f6c177";
      in
      {
        "*" = {
          background-color = mkLiteral bg;
          foreground-color = mkLiteral fgd;
          active-background = mkLiteral grn;
          urgent-background = mkLiteral red;
          selected-background = mkLiteral grn;
          selected-urgent-background = mkLiteral red;
          selected-active-background = mkLiteral grn;
          separatorcolor = mkLiteral grn;
          bordercolor = mkLiteral ora;
          font = mkLiteral "\"Cartograph CF 12\"";
        };

        "#window" = {
          background-color = mkLiteral "@background";
          border = 3;
          border-radius = 6;
          border-color = mkLiteral "@bordercolor";
          padding = 5;
        };

        "#mainbox" = {
          border = 0;
          padding = 5;
        };

        "#message" = {
          border = mkLiteral "1px dash 0px 0px";
          border-color = mkLiteral "@separatorcolor";
          padding = mkLiteral "1px";
        };

        "#textbox" = {
          text-color = mkLiteral "@foreground";
        };

        "#listview" = {
          fixed-height = 0;
          border = mkLiteral "2px dash 0px 0px";
          border-color = mkLiteral "@bordercolor";
          spacing = mkLiteral "2px";
          scrollbar = false;
          padding = mkLiteral "2px 0px 0px";
        };

        "#element" = {
          border = 0;
          padding = mkLiteral "1px";
        };

        "#element.normal.normal" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
        };

        "#element.normal.urgent" = {
          background-color = mkLiteral "@urgent-background";
          text-color = mkLiteral "@foreground";
        };

        "#element.normal.active" = {
          background-color = mkLiteral "@active-background";
          text-color = mkLiteral "@background";
        };

        "#element.selected.normal" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@foreground";
        };

        "#element.selected.urgent" = {
          background-color = mkLiteral "@selected-urgent-background";
          text-color = mkLiteral "@foreground";
        };

        "#element.selected.active" = {
          background-color = mkLiteral "@selected-active-background";
          text-color = mkLiteral "@background";
        };

        "#element.alternate.normal" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
        };

        "#element.alternate.urgent" = {
          background-color = mkLiteral "@urgent-background";
          text-color = mkLiteral "@foreground";
        };

        "#element.alternate.active" = {
          background-color = mkLiteral "@active-background";
          text-color = mkLiteral "@foreground";
        };

        "#scrollbar" = {
          width = mkLiteral "2px";
          border = 0;
          handle-width = mkLiteral "8px";
          padding = 0;
        };

        "#sidebar" = {
          border = mkLiteral "2px dash 0px 0px";
          border-color = mkLiteral "@separatorcolor";
        };

        "#button.selected" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@foreground";
        };

        "#inputbar" = {
          spacing = 0;
          text-color = mkLiteral "@foreground";
          padding = mkLiteral "1px";
          children = map mkLiteral [
            "prompt"
            "textbox-prompt-colon"
            "entry"
            "case-indicator"
          ];
        };

        "#case-indicator" = {
          spacing = 0;
          text-color = mkLiteral "@foreground";
        };

        "#entry" = {
          spacing = 0;
          text-color = mkLiteral cya;
        };

        "#prompt" = {
          spacing = 0;
          text-color = mkLiteral grn;
        };

        "#textbox-prompt-colon" = {
          expand = false;
          str = ":";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral grn;
        };
      };
  };
}
