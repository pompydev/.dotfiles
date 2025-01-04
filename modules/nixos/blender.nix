{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = self: {
    blender = self.blender.override { cudaSupport = true; };
  };

  environment.systemPackages = with pkgs; [
    blender
  ];
}
