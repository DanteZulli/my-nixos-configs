{
  description = "Dante's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      # NixOs configuration entrypoint
      # Available through 'sudo nixos-rebuild switch --flake .#hostname'
      nixosConfigurations = {
        "lachata" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            # System Configuration
            ./hosts/lachata
            # Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users."dante" = import ./home/home.nix {
                  hostname = "lachata";
                };
              };
            }
          ];
        };
      };
    };
}
