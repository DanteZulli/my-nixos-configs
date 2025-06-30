{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.caskaydia-cove
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      defaultFonts = {
        sansSerif = [ "CaskaydiaCove Nerd Font Mono" ];
        serif = [ "CaskaydiaCove Nerd Font Mono" ];
        monospace = [ "CaskaydiaCove Nerd Font Mono" ];
      };
    };
  };
}
