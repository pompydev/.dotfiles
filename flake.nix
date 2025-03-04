{
  description = "pomp's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { ... }@inputs:

    let
      nixpkgs = inputs.nixpkgs.legacyPackages."x86_64-linux".applyPatches {
        name = "nixpkgs-patched";
        src = inputs.nixpkgs;
        patches = [
          ./patches/387134.patch
        ];
      };
      nixosSystem = import (nixpkgs + "/nixos/lib/eval-config.nix");
    in
    {
      nixosConfigurations = {
        desktop = nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/desktop/configuration.nix
          ];
        };

        laptop = nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/laptop/configuration.nix
          ];
        };

        homelab2 = nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/homelab2/configuration.nix
          ];
        };
      };
    };
}
