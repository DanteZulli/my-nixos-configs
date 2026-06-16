{den, ...}: {
  den.aspects.ly.nixos = {
    services.displayManager.ly = {
      enable = true;
      settings = {
        default_session = "sway";
      };
    };
  };
}
