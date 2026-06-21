{den, ...}: {
  den.aspects.gaming.gamescope.nixos = {
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
