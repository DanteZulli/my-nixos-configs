{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-sans
      nerd-fonts.ubuntu-mono
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      defaultFonts = {
        sansSerif = [ "UbuntuSans Nerd Font" ];
        serif = [ "Ubuntu Nerd Font" ];
        monospace = [ "UbuntuMono Nerd Font" ];
      };
    };
  };
}
