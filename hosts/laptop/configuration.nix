{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/graphics.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/devenv.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/gamemode.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/nautilus.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/virtualbox.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    users = {
      pomp = import ./home.nix;
    };
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
    "dotnet-sdk-wrapped-6.0.428"
  ];
  environment.systemPackages = with pkgs; [
    vim
    rustdesk-flutter

    # Office
    onlyoffice-bin

    # Configuration & Monitor
    mission-center
    resources

    # Misc Application
    anytype
    collision
    menulibre
    snoop
    hashes
    inspector
    baobab
    protonvpn-gui
    cheese
    qbittorrent
    vlc
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
  # systemd.services.NetworkManager-wait-online.enable = false;
  environment.sessionVariables = {
    EDITOR = "vim";
  };
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-72250b57-488c-4850-a000-766508a1ceb7".device = "/dev/disk/by-uuid/72250b57-488c-4850-a000-766508a1ceb7";
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  security.rtkit.enable = true;

  # Services
  services.xserver.enable = true;
  services.tailscale.enable = true;
  services.printing.enable = false; # enable only when needed

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
