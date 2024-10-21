# man configuration.nix
# nixos-help

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Nix stuff
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/authenticator.nix
    ../../modules/nixos/cubiomes-viewer.nix
    ../../modules/nixos/devenv.nix
    ../../modules/nixos/docker.nix
    ../../modules/nixos/handbrake.nix
    ../../modules/nixos/killall.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/mongodb-compass.nix
    ../../modules/nixos/nautilus.nix
    ../../modules/nixos/obs.nix
    ../../modules/nixos/osu-lazer-bin.nix
    ../../modules/nixos/otd.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/virtualbox.nix
    inputs.home-manager.nixosModules.default
  ];
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    trusted-users = root pomp
  ''; # allow pomp to manage nix store
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
      "https://cuda-maintainers.cachix.org"
      "https://devenv.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  home-manager = {
    users = {
      pomp = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    # Desktop
    gnomeExtensions.appindicator
    gnomeExtensions.gnome-40-ui-improvements
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.blur-my-shell
    gnomeExtensions.lock-keys
    gnomeExtensions.pop-shell
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.user-themes

    # Icons & Themes
    papirus-icon-theme
    pop-gtk-theme

    # Fonts
    meslo-lgs-nf
    ubuntu-sans-mono
    noto-fonts-cjk-sans
    terminus-nerdfont
    nerdfonts

    # Dev
    ## General GUI
    mongodb-compass
    kitty
    gitbutler
    vscodium
    zed-editor
    dbeaver-bin
    jetbrains-toolbox
    filezilla
    glade
    seabird
    ## General CLI / TUI
    wget
    just
    vim
    btop
    nvitop
    tree
    lazygit
    lazydocker
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
    gamemode
    steam
    lunar-client
    prismlauncher

    # Browsers
    brave
    tor-browser-bundle-bin
    mullvad-browser

    # Communication
    kiwitalk
    element-desktop
    slack
    discord
    vesktop

    # Design, Content Creation, and Media
    eog
    vlc
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

    # Configuration & Monitor
    dconf-editor
    seahorse
    bustle
    mission-center
    resources
    gnome-tweaks
    baobab
    gnome-disk-utility
    polychromatic
    gparted
    gpa
    menulibre
    gsmartcontrol
    cpu-x

    # Office
    onlyoffice-bin

    # Misc Application
    anytype
    gnome.seahorse
    rustdesk-flutter
    collision
    file-roller
    protonvpn-gui
    open-webui
    labplot
    pika-backup
    gnome-calculator
    gnome-characters
    qbittorrent
    metadata-cleaner

    # Misc System packages
    gnupg
    appimage-run
    file
  ];

  # User
  users.users.pomp = {
    isNormalUser = true;
    description = "pomp";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # System
  boot.loader.systemd-boot.enable = true;
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  services.printing.enable = false;
  hardware.openrazer.enable = true;
  security.rtkit.enable = true;
  environment.sessionVariables = {
    EDITOR = "vim";
  };

  # Desktop
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    xterm
  ];
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

  services.open-webui.enable = true;
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
