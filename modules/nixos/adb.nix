{ pkgs, ... }:

{
  programs.adb.enable = true;
  users.users.pomp.extraGroups = [ "adbusers" ];
  services.udev.packages = [ pkgs.android-udev-rules ];
}
