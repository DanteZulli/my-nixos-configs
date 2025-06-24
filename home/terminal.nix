{
  pkgs,
  ...
}:

# terminal.nix - Shell, Shell-Prompts, Terminal Emulators and related configurations.
{
  # Starship - Customizable Prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # Alacritty - Terminal Emulator
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
  
  # Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      fortune
    '';
    shellAliases = {
      nswitch= "sudo nixos-rebuild switch --flake ~/.my-nixos-configs#lachata";
    };
  };
}
