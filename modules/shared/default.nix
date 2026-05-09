{...}: {
  imports = [
    ./boot.nix
    ./nix.nix
    ./timezone.nix
    ./networking.nix
    ./desktop.nix
    ./hardware.nix
    ./services.nix
    ./gaming.nix
    ./shell.nix
    ./users.nix
  ];
}
