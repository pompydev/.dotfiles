{ pkgs, ... }:

{
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ "pomp" ];
  users.users.pomp.extraGroups = [
    "openrazer"
    "plugdev"
  ];
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
}
