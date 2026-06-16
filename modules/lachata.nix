{den, ...}: {
  den.aspects.lachata = {
    includes = [
      den.batteries.hostname
      den.aspects.boot
      den.aspects.fonts
      den.aspects.nix
      den.aspects.timezone
      den.aspects.networking
      den.aspects.keyboard
      den.aspects.ly
      den.aspects.graphics
      den.aspects.services
      den.aspects.gaming
      den.aspects.thunar
    ];

    nixos.imports = [../hosts/lachata/hardware-configuration.nix];
  };
}
