{den, ...}: {
  den.aspects.dante = {
    includes = [
      den.batteries.host-aspects
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "bash")
      den.aspects.packages
      den.aspects.git
      den.aspects.gh
      den.aspects.direnv
      den.aspects.opencode
      den.aspects.firefox
      den.aspects.obs-studio
      den.aspects.gaming.steam
      den.aspects.gaming.gamemode
      den.aspects.gaming.gamescope
      den.aspects.gaming.mangohud
      den.aspects.thunar
      den.aspects.bash
      den.aspects.starship
    ];

    user = {
      description = "Dante Zulli";
      extraGroups = [
        "video"
        "input"
        "render"
        "gamemode"
        "docker"
      ];
    };
  };
}
