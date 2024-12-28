{ ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Pop-dark";
      cursor-theme = "Adwaita";
      icon-theme = "Papirus-Dark";

      font-antialiasing = "grayscale";
      font-hinting = "full";

      clock-format = "24h";
      clock-show-seconds = true;
      clock-show-weekday = true;

      color-scheme = "prefer-dark";
      enable-animations = true;
      enable-hot-corners = false;
      gtk-enable-primary-paste = false;
      locate-pointer = false;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

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

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = false;
      experimental-features = [
        "kms-modifiers"
        "variable-refresh-rate"
      ];
      workspaces-only-on-primary = false;
    };
  };
}
