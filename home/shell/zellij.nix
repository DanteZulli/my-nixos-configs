{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;

    settings = {
      theme = "default";
    };

    extraConfig = ''
      keybinds clear-defaults=true {
          normal {
              bind "Alt n" { NewPane; }
              bind "Alt t" { NewTab; }
              bind "Alt w" { CloseFocus; }
              bind "Alt h" "Alt Left" { MoveFocus "Left"; }
              bind "Alt j" "Alt Down" { MoveFocus "Down"; }
              bind "Alt k" "Alt Up" { MoveFocus "Up"; }
              bind "Alt l" "Alt Right" { MoveFocus "Right"; }
              bind "Alt 1" { GoToTab 1; }
              bind "Alt 2" { GoToTab 2; }
              bind "Alt 3" { GoToTab 3; }
              bind "Alt 4" { GoToTab 4; }
              bind "Alt 5" { GoToTab 5; }
              bind "Alt 6" { GoToTab 6; }
              bind "Alt 7" { GoToTab 7; }
              bind "Alt 8" { GoToTab 8; }
              bind "Alt 9" { GoToTab 9; }
              bind "Alt s" { SwitchToMode "scroll"; }
              bind "Alt f" { ToggleFloatingPanes; }
              bind "Alt q" { Quit; }
          }
          pane {
              bind "h" "Left" { MoveFocus "Left"; }
              bind "j" "Down" { MoveFocus "Down"; }
              bind "k" "Up" { MoveFocus "Up"; }
              bind "l" "Right" { MoveFocus "Right"; }
              bind "p" { SwitchFocus; }
              bind "n" { NewPane; }
              bind "w" { CloseFocus; }
              bind "f" { ToggleFloatingPanes; }
              bind "t" { SwitchToMode "tab"; }
              bind "s" { SwitchToMode "scroll"; }
          }
          tab {
              bind "h" "Left" { GoToPreviousTab; }
              bind "l" "Right" { GoToNextTab; }
              bind "j" "Down" { MoveTab "Right"; }
              bind "k" "Up" { MoveTab "Left"; }
              bind "n" { NewTab; }
              bind "w" { CloseFocus; }
              bind "1" { GoToTab 1; }
              bind "2" { GoToTab 2; }
              bind "3" { GoToTab 3; }
              bind "4" { GoToTab 4; }
              bind "5" { GoToTab 5; }
              bind "6" { GoToTab 6; }
              bind "7" { GoToTab 7; }
              bind "8" { GoToTab 8; }
              bind "9" { GoToTab 9; }
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
