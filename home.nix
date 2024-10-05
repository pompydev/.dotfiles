{ config, pkgs, ... }:

{
  home.username = "pomp";
  home.homeDirectory = "/home/pomp";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".profile".source = home/.profile;
    ".zshrc".source = home/.zshrc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pomp/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = true;
      power-button-action = "suspend";
      sleep-inactive-ac-type = "nothing";

    };

    "org/gnome/settings-daemon/plugins/xsettings" = {
      antialiasing = "grayscale";
      hinting = "full";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        pkgs.gnomeExtensions.appindicator.extensionUuid
        pkgs.gnomeExtensions.bluetooth-battery-meter.extensionUuid
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        pkgs.gnomeExtensions.lock-keys.extensionUuid
        pkgs.gnomeExtensions.pop-shell.extensionUuid
        pkgs.gnomeExtensions.tray-icons-reloaded.extensionUuid
        pkgs.gnomeExtensions.user-themes.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      appfolder-dialog-opacity = 0.12;
      blur-applications = false;
      blur-dash = true;
      blur-panel = false;
      brightness = 0.6;
      dash-opacity = 0.12;
      debug = false;
      hacks-level = 1;
      hidetopbar = false;
      sigma = 15;
    };

    "org/gnome/shell/extensions/lockkeys" = {
      notification-preferences = "off";
    };

    "org/gnome/shell/extensions/pop-shell" = {
      active-hint = true;
      active-hint-border-radius = 11;
      gap-inner = 3;
      gap-outer = 3;
      hint-color-rgba = "rgb(36,138,118)";
      mouse-cursor-focus-location = 0;
      pop-monitor-down = [ ];
      pop-monitor-left = [ ];
      pop-monitor-right = [ ];
      pop-monitor-up = [ ];
      pop-workspace-down = [ ];
      pop-workspace-up = [ ];
      show-skip-taskbar = false;
      show-title = true;
      smart-gaps = false;
      stacking-with-mouse = false;
      tile-by-default = true;
      toggle-stacking-global = [ ];
    };

    "org/gnome/shell/extensions/trayIconsReloaded" = {
      icon-margin-horizontal = 0;
      icon-padding-horizontal = 4;
      icon-size = 20;
      icons-limit = 8;
      tray-margin-left = 0;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Pop-dark";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
