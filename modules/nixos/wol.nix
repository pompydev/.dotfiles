{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ethtool
  ];
  powerManagement.enable = true;
  networking.interfaces.enp7s0.wakeOnLan.enable = true;
}
