{
  description = "Dante's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgsUnstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/${hostname}
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "bak";
            home-manager.extraSpecialArgs = {inherit inputs pkgsUnstable;};
          }
        ];
      };
  in {
    nixosConfigurations.lachata = mkHost "lachata";
  };
}
