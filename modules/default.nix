{ ... }:

{
  imports = [
    # System modules
    ./system/packages.nix
    ./system/zram.nix
    ./system/keymap.nix
    ./system/nix.nix
    ./system/bootloader.nix
    ./system/networking.nix
    ./system/time-i18n.nix
    
    # Security modules
    ./security/polkit.nix
    
    # Desktop modules
    ./desktop/keyring.nix
    ./desktop/sway.nix
    ./desktop/sound.nix
    ./desktop/display/ly.nix
    
    # User modules
    ./users/dante.nix
  ];
}