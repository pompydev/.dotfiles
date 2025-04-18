{
  description = "pomp's NixOS flake";

  inputs = {
    nixpkgs.url = "github:pompydev/nixpkgs/master";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    browser-previews = {
      url = "github:nix-community/browser-previews";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixvim, ... }@inputs:

    let
      nixpkgs = inputs.nixpkgs.legacyPackages."x86_64-linux".applyPatches {
        name = "nixpkgs-patched";
        src = inputs.nixpkgs;
        patches = [ ];
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
            nixvim.nixosModules.nixvim
          ];
        };

        laptop = nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/laptop/configuration.nix
            nixvim.nixosModules.nixvim
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
