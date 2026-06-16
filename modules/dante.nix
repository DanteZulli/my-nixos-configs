{den, ...}: {
  den.aspects.dante = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "bash")
      den.aspects.packages
      den.aspects.git
      den.aspects.gh
      den.aspects.direnv
      den.aspects.opencode
      den.aspects.firefox
      den.aspects.mangohud
      den.aspects.obs-studio
      den.aspects.sway
      den.aspects.waybar
      den.aspects.wlsunset
      den.aspects.bash
      den.aspects.mako
      den.aspects.starship
      den.aspects.foot
      den.aspects.wofi
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
