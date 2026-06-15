{ den, ... }:
{
  den.aspects.fonts.nixos = { pkgs, ... }: {
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
      nerd-fonts.caskaydia-mono
      nerd-fonts.caskaydia-cove
    ];

    fonts.fontconfig = {
      defaultFonts = {
        serif = [ "CaskaydiaCove Nerd Font Light" "CaskaydiaMono Nerd Font Light" ];
        sansSerif = [ "CaskaydiaCove Nerd Font Light" "CaskaydiaMono Nerd Font Light" ];
        monospace = [ "CaskaydiaMono Nerd Font Mono Light" ];
      };
    };
  };
}
