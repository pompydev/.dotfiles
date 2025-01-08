{ pkgs, user, ... }:

{
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ user ];
  users.users.pomp.extraGroups = [
    "openrazer"
    "plugdev"
  ];
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
}
