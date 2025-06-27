{
  ...
}:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      fortune
    '';
    shellAliases = {
      nswitch = "sudo nixos-rebuild switch --flake ~/.my-nixos-configs#lachata";
    };
  };
}
