{ hostname, ... }:

{
  imports = [
    ./core.nix
    ./packages.nix
    ./programs
    ./shell
    (import ./desktop { inherit hostname; })
  ];
}
