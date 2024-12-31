{
  pkgs,
  user ? "pomp",
  ...
}:

{
  environment.systemPackages = with pkgs; [ gnome-boxes ];

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ user ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
