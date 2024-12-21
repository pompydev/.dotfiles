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
    { nixpkgs, ... }@inputs:

    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/desktop/configuration.nix
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/laptop/configuration.nix
          ];
        };

        homelab2 = nixpkgs.lib.nixosSystem {
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
