{den, ...}: {
  den.aspects.bash.homeManager = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        krabby random 1 --no-variant
        fortune -n 100 -s
      '';
      shellAliases = {
        j = "just --justfile ~/.nixos/justfile --working-directory ~/.nixos";
      };
    };
  };
}
