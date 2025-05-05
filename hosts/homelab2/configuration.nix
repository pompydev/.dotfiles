args@{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/ssh.nix
    ../../modules/nixos/devenv.nix
    (import ../../modules/nixos/docker.nix (args // { user = "homelab2"; }))
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/gnome-remote-desktop.nix
    ../../modules/nixos/locale.nix
    (import ../../modules/nixos/nix.nix (args // { user = "homelab2"; }))
    ../../modules/nixos/nixvim.nix
    (import ../../modules/nixos/shell.nix (args // { user = "homelab2"; }))
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    users = {
      homelab2 = import ./home.nix;
    };
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # dev
    vscode

    # GUI
    mission-center
    menulibre
    pika-backup
  ];

  # Programs
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # User
  users.users.homelab2 = {
    isNormalUser = true;
    description = "homelab2";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # System
  systemd.services.NetworkManager-wait-online.enable = false;
  services.tailscale.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "homelab2";
  networking.networkmanager.enable = true;
  services.xserver.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Desktop
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "kr";
  services.printing.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
