{
  ...
}:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      krabby random 1
    '';
    shellAliases = {
      nrs_lachata = "sudo nixos-rebuild switch --flake ~/.my-nixos-configs#lachata";
    };
  };
}
