{den, ...}: {
  den.aspects.wofi.homeManager = {
    programs.wofi = {
      enable = true;
      settings = {
        show = "drun";
        matching = "multi-contains";
        no_actions = true;
        insensitive = true;
      };
    };
  };
}
