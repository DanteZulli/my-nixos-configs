{
  ...
}:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      krabby random 1 --no-variant
      fortune -n 100 -s
    '';
    shellAliases = {
      nrs_lachata = "sudo nixos-rebuild switch --flake ~/.my-nixos-configs#lachata";
    };
  };
}
