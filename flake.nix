{
  description = "Dante's NixOS Flake";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home Manager
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
    {
      # NixOS configuration entrypoint
      # Available through 'sudo nixos-rebuild switch --flake .#hostname'
      nixosConfigurations = {
        "lachata" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix

            # Home Manager (As a module of NixOs)
            # so that home-manager configuration will be deployed automatically
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."dante" = import ./home/home.nix;
            }
          ];
        };
      };
    };
}
