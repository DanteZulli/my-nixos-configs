{
  description = "My NixOS Flake";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'sudo nixos-rebuild switch --flake .#hostname'
    nixosConfigurations = {
      lachata = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
	system = "x86_64-linux";
        modules = [
	  ./nixos/configuration.nix
	  
	  # Home Manager (As a module of NixOs)
	  # so that home-manager configuration will be deployed automatically
	  home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dante = import ./home.nix;
          }
	];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    #homeConfigurations = {
    #  "dante@lachata" = home-manager.lib.homeManagerConfiguration {
    #    pkgs = nixpkgs.legacyPackages.x86_64-linux; 
    #    extraSpecialArgs = {inherit inputs outputs;};
    #    modules = [./home-manager/home.nix];
    #  };
    #};
  };
}
