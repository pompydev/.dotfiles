{
  description = "pomp's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, nixpkgs-master, ... }@inputs:

    let
      system = "x86_64-linux";
      overlay-nixpkgs = final: prev: {
        master = import nixpkgs-master {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            (
              { ... }:
              {
                nixpkgs.overlays = [ overlay-nixpkgs ];
              }
            )
            ./hosts/desktop/configuration.nix
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            (
              { ... }:
              {
                nixpkgs.overlays = [ overlay-nixpkgs ];
              }
            )
            ./hosts/laptop/configuration.nix
          ];
        };
      };
    };
}
