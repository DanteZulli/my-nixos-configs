{ ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./locale.nix
    ./audio.nix
    ./memory.nix
    ./graphics.nix
    ./fonts.nix
    ./bluetooth.nix
    ./docker.nix
  ];
}
