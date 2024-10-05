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
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
      "https://cuda-maintainers.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
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
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.appindicator
    gnomeExtensions.pop-shell
    nautilus-open-any-terminal

    # Icons & Themes
    papirus-icon-theme
    pop-gtk-theme

    # Fonts
    meslo-lgs-nf
    ubuntu-sans-mono
    noto-fonts-cjk-sans
    terminus-nerdfont
    nerdfonts

    # Shell
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    fzf-zsh
    fzf
    eza
    atuin

    # Dev
    bustle
    dotnet-sdk
    jdk
    yasm
    wget
    python3
    btop
    nvitop
    just
    bun
    nodejs_latest
    deno
    git
    pnpm
    go
    go-tools
    rustup
    yarn
    yarn-berry
    zig
    zls
    tree
    nixd
    nixfmt-rfc-style
    vim
    kitty
    vscodium
    zed-editor
    jetbrains-toolbox
    filezilla
    pgadmin4
    pgadmin4-desktopmode
    unityhub

    # Gaming
    gamemode
    osu-lazer-bin
    steam
    lunar-client
    prismlauncher

    # Browsers
    brave
    mullvad-browser

    # Communication
    kiwitalk
    element-desktop
    slack
    discord
    vesktop

    # Design, Content Creation, and Media
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        input-overlay
        obs-vkcapture
      ];
    })
    eog
    vlc
    gcolor3
    contrast
    gimp
    kdePackages.kdenlive
    font-manager
    blender
    zrythm

    # Configuration & Monitor
    dconf-editor
    mission-center
    resources
    gnome-tweaks
    baobab
    gnome-disk-utility
    polychromatic
    gparted
    gpa
    menulibre
    opentabletdriver

    # Office
    onlyoffice-bin

    # Misc Application
    anytype
    rustdesk
    collision
    file-roller
    protonvpn-gui
    nautilus
    open-webui

    # Misc System packages
    gnupg
  ];

  # User & Shell
  programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };
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
  i18n = {
    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        hangul # Korean
        anthy # Japanese
        pinyin # Chinese
        uniemoji # Emoji
      ];
    };

    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };
  boot.loader.systemd-boot.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.printing.enable = false;
  hardware.opentabletdriver.enable = true;
  hardware.openrazer.enable = true;
  security.rtkit.enable = true;
  environment.sessionVariables = {
    CUDA_PATH = "${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
    EXTRA_CCFLAGS = "-I/usr/include";
  };

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

  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

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
