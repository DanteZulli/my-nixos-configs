{ hostname, ... }:

{

  imports = [
    ./core.nix
    ./programs
    ./shell
    (import ./hypr { inherit hostname; })
  ];

}
