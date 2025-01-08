{ pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    virtualbox
  ];

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ user ];
}
