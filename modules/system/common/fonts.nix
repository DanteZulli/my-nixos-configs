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
        sansSerif = [ "CaskaydiaCove Nerd Font" ];
        serif = [ "CaskaydiaCove Nerd Font" ];
        monospace = [ "CaskaydiaCove Nerd Font Mono" ];
      };
    };
  };
}
