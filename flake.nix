{
  description = "pomp's NixOS flake";

  inputs = {
    nixpkgs.url = "github:pompydev/nixpkgs/master";
    catppuccin.url = "github:catppuccin/nix";
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
    { nixvim, catppuccin, ... }@inputs:

    let
      nixpkgs = inputs.nixpkgs.legacyPackages."x86_64-linux".applyPatches {
        name = "nixpkgs-patched";
        src = inputs.nixpkgs;
        patches = [
          ./patches/fix-psycopg.patch
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
            nixvim.nixosModules.nixvim
            catppuccin.nixosModules.catppuccin
            {
              home-manager.users.pomp = {
                imports = [ catppuccin.homeModules.catppuccin ];
              };
            }
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
            catppuccin.nixosModules.catppuccin
            {
              home-manager.users.pomp = {
                imports = [ catppuccin.homeModules.catppuccin ];
              };
            }
          ];
        };

        homelab2 = nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/homelab2/configuration.nix
            catppuccin.nixosModules.catppuccin
            {
              home-manager.users.homelab2 = {
                imports = [ catppuccin.homeModules.catppuccin ];
              };
            }
          ];
        };
      };
    };
}
