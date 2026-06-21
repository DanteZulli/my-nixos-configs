{den, ...}: {
  den.hosts.x86_64-linux.lachata.users.dante = {};

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
      den.aspects.desktop.sway
      den.aspects.desktop.waybar
      den.aspects.desktop.foot
      den.aspects.desktop.wofi
      den.aspects.desktop.mako
      den.aspects.desktop.wlsunset
    ];

    nixos = {
      hardware.facter = {
        enable = true;
        reportPath = ./facter.json;
      };

      # nixos-facter no configura filesystems (asume disko).
      fileSystems."/" = {
        device = "/dev/disk/by-uuid/0f914d0d-5899-44bb-b9d3-aca810fa7957";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/F1F6-AF4D";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077"];
      };
    };
  };
}
