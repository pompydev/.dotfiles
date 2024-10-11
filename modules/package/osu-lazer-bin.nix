{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    master.osu-lazer-bin
  ];
}
