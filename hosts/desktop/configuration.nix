args@{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/adb.nix
    ../../modules/nixos/anytype.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/authenticator.nix
    ../../modules/nixos/cubiomes-viewer.nix
    ../../modules/nixos/devenv.nix
    ../../modules/nixos/docker.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/gamemode.nix
    (import ../../modules/nixos/gnome-boxes.nix (args // { user = "pomp"; }))
    ../../modules/nixos/gnome-remote-desktop.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/handbrake.nix
    ../../modules/nixos/killall.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/lunar-client.nix
    ../../modules/nixos/monero.nix
    ../../modules/nixos/mongodb-compass.nix
    ../../modules/nixos/nautilus.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/obs.nix
    ../../modules/nixos/otd.nix
    ../../modules/nixos/razer.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/vlc.nix
    ../../modules/nixos/wol.nix
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
    # Dev
    ## General GUI
    mongodb-compass
    # gitbutler
    dbeaver-bin
    jetbrains-toolbox
    filezilla
    glade
    seabird
    ## General CLI / TUI
    wget
    vim
    btop
    nvitop
    tree
    usbutils
    lazygit
    hotspot
    desktop-file-utils
    ## Game dev
    unityhub
    godot3-mono
    godot3-mono-export-templates
    godot_4
    godot_4-export-templates
    ## Profiling
    sysprof

    # Hacking
    metasploit
    imhex

    # Gaming
    steam
    prismlauncher

    # Browsers
    tor-browser-bundle-bin
    mullvad-browser

    # Communication
    element-desktop
    slack
    discord
    irssi

    # Design, Content Creation, and Media
    gcolor3
    contrast
    gimp
    inkscape
    kdePackages.kdenlive
    gmetronome
    font-manager
    blender
    zrythm
    tenacity
    parabolic
    cheese

    # Configuration & Monitor
    dconf-editor
    seahorse
    bustle
    mission-center
    resources
    gparted
    gpa
    menulibre
    gsmartcontrol
    cpu-x

    # Office
    onlyoffice-bin

    # Misc Application
    rustdesk-flutter
    collision
    file-roller
    protonvpn-gui
    open-webui
    labplot
    pika-backup
    qbittorrent
    metadata-cleaner
    snoop
    hashes
    inspector

    # Misc System packages
    gnupg
    appimage-run
    file
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
  environment.sessionVariables = {
    EDITOR = "vim";
  };
  boot.loader.systemd-boot.enable = true;
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  services.printing.enable = false;
  hardware.openrazer.enable = true;
  security.rtkit.enable = true;

  # Desktop
  services.xserver.enable = true;
  services.xserver.xkb.layout = "kr";

  # Graphics
  nixpkgs.config.cudaSupport = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.nvidia = {
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # use open source driver?
    open = false;

    # use nvidia-settings?
    nvidiaSettings = true;

    # what driver version?
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  # Services
  services.tailscale.enable = true;
  services.open-webui.enable = true;
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
