{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;

    settings = {
      show_startup_tips_timer_in_milliseconds = 0;
    };

    extraConfig = ''
      keybinds clear-defaults=true {
          normal {
              bind "Alt h" "Alt Left" { MoveFocus "Left"; }
              bind "Alt j" "Alt Down" { MoveFocus "Down"; }
              bind "Alt k" "Alt Up" { MoveFocus "Up"; }
              bind "Alt l" "Alt Right" { MoveFocus "Right"; }
              bind "Alt n" { NewPane; }
              bind "Alt w" { CloseFocus; }
              bind "Alt f" { ToggleFloatingPanes; }
              bind "Alt p" { SwitchToMode "pane"; }
              bind "Alt t" { SwitchToMode "tab"; }
              bind "Alt r" { SwitchToMode "resize"; }
              bind "Alt s" { SwitchToMode "scroll"; }
          }
          pane {
              bind "h" "Left" { MoveFocus "Left"; }
              bind "j" "Down" { MoveFocus "Down"; }
              bind "k" "Up" { MoveFocus "Up"; }
              bind "l" "Right" { MoveFocus "Right"; }
              bind "n" { NewPane; }
              bind "w" { CloseFocus; }
              bind "f" { ToggleFloatingPanes; }
              bind "p" { SwitchFocus; }
          }
          tab {
              bind "h" "Left" { GoToPreviousTab; }
              bind "l" "Right" { GoToNextTab; }
              bind "n" { NewTab; }
              bind "w" { CloseFocus; }
          }
          resize {
              bind "h" "Left" { Resize "Left"; }
              bind "j" "Down" { Resize "Down"; }
              bind "k" "Up" { Resize "Up"; }
              bind "l" "Right" { Resize "Right"; }
          }
          scroll {
              bind "j" "Down" { ScrollDown; }
              bind "k" "Up" { ScrollUp; }
              bind "h" "PageUp" { PageScrollUp; }
              bind "l" "PageDown" { PageScrollDown; }
              bind "s" { SwitchToMode "normal"; }
          }
          session {
              bind "q" { Quit; }
          }
      };
    '';
  };
}
