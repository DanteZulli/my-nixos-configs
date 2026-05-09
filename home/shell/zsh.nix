{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      krabby random 1 --no-variant
      fortune -n 100 -s
    '';
    shellAliases = {
      j = "just --justfile ~/.config/nixos/justfile --working-directory ~/.config/nixos";
    };
  };
}
