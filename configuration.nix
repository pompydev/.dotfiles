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
    inputs.home-manager.nixosModules.default
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  home-manager = {
    users = {
      pomp = import ./home.nix;
    };
  };

  # User & Shell
  programs.zsh.enable = true;
  users.users.pomp = {
    isNormalUser = true;
    description = "pomp";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  # System
  time.timeZone = "Asia/Seoul";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  boot.loader.systemd-boot.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.printing.enable = false;
  hardware.opentabletdriver.enable = true;
  security.rtkit.enable = true;

  # Audio
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
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
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Graphics
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

  environment.systemPackages = with pkgs; [
    # System / Component
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.appindicator
    gnomeExtensions.pop-shell
    ibus-engines.hangul
    ibus-engines.anthy
    ibus-engines.uniemoji
    nautilus-open-any-terminal
    papirus-icon-theme
    pop-gtk-theme
    file-roller
    gnupg
    pinentry

    # fonts
    meslo-lgs-nf
    ubuntu-sans-mono
    noto-fonts-cjk-sans
    terminus-nerdfont
    nerdfonts

    # shell
    fzf-zsh
    fzf
    eza
    btop
    atuin
    zsh

    # System / GUI Util
    font-manager
    gnome-tweaks
    dconf-editor
    mission-center
    resources
    gparted
    menulibre
    gpa

    # CLI / Dev
    just
    bun
    deno
    git
    pnpm
    go
    rustup
    yarn
    yarn-berry
    zig
    tree
    nixd
    nixfmt-rfc-style

    # Applications / Browser
    brave
    mullvad-browser

    # Applications / Communication
    kiwitalk
    slack
    discord
    vesktop

    # Applications / Media
    obs-studio
    vlc
    gimp
    kdePackages.kdenlive
    blender

    # Applications / Dev
    vim
    kitty
    vscodium
    zed-editor
    virtualbox
    jetbrains-toolbox
    pgadmin4
    pgadmin4-desktopmode

    # Applications / Misc
    nautilus
    opentabletdriver
    appimage-run
    anytype
    rustdesk
    polychromatic
    collision
    baobab
    open-webui

    # Gaming
    gamemode
    osu-lazer-bin
    steam
  ];

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
