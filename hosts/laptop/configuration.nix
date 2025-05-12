args@{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/graphics.nix
    ../../modules/nixos/anytype.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/devenv.nix
    ../../modules/nixos/fonts.nix
    (import ../../modules/nixos/gamemode.nix (args // { user = "pomp"; }))
    ../../modules/nixos/gnome-remote-desktop.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/halloy.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/media.nix
    ../../modules/nixos/nautilus.nix
    (import ../../modules/nixos/nix.nix (args // { user = "pomp"; }))
    ../../modules/nixos/nixvim.nix
    (import ../../modules/nixos/shell.nix (args // { user = "pomp"; }))
    ../../modules/nixos/steam.nix
    (import ../../modules/nixos/virtualbox.nix (args // { user = "pomp"; }))
    ../../modules/nixos/vlc.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    users = {
      pomp = import ./home.nix;
    };
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Dev
    hotspot
    jetbrains-toolbox

    # Office
    onlyoffice-bin

    # Configuration & Monitor
    mission-center
    resources

    # Misc Application
    collision
    menulibre
    snoop
    hashes
    inspector
    baobab
    protonvpn-gui
    cheese
    qbittorrent
    pika-backup
  ];

  # Programs
  programs.nix-ld.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # User
  users.users.pomp = {
    isNormalUser = true;
    description = "pomp";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # System
  systemd.services.NetworkManager-wait-online.enable = false;
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-72250b57-488c-4850-a000-766508a1ceb7".device =
    "/dev/disk/by-uuid/72250b57-488c-4850-a000-766508a1ceb7";
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  security.rtkit.enable = true;

  # Services
  services.xserver.enable = true;
  services.tailscale.enable = true;
  services.open-webui.enable = true;
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
  services.printing.enable = false; # enable only when needed

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
