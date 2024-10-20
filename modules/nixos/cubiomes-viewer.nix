{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cubiomes-viewer
  ];
}
