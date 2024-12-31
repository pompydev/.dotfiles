{ pkgs, ... }:

{
  xdg.mime.defaultApplications = {
    "image/png" = "org.gnome.eog.desktop";
    "image/gif" = "org.gnome.eog.desktop";
    "image/jpeg" = "org.gnome.eog.desktop";
    "image/webp" = "org.gnome.eog.desktop";
    "image/svg+xml" = "org.gnome.eog.desktop";
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

    baobab
    eog
    gnome-calculator
    gnome-characters
    gnome-clocks
    gnome-connections
    gnome-disk-utility
    gnome-logs
    gnome-boxes
    gnome-tweaks
  ];

  services.gnome.gnome-remote-desktop.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    xterm
  ];
}
