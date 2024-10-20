{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mongodb-compass
  ];
}
