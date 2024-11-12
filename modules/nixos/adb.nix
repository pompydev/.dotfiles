# https://nixos.wiki/wiki/Android
{ pkgs, ... }:

{
  programs.adb.enable = true;
  users.users.pomp.extraGroups = [
    "adbusers"
    "kvm"
  ];
  services.udev.packages = [ pkgs.android-udev-rules ];
}
