{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    monero-gui
    p2pool
  ];
}
