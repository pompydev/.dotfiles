{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator.extensionUuid
        bluetooth-battery-meter.extensionUuid
        blur-my-shell.extensionUuid
        lock-keys.extensionUuid
        pop-shell.extensionUuid
        tray-icons-reloaded.extensionUuid
        gnome-40-ui-improvements.extensionUuid
        user-themes.extensionUuid
      ];
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
}
