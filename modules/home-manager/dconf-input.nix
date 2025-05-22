{ lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      per-window = false;
      mru-sources = [
        (mkTuple [
          "ibus"
          "hangul"
        ])
        (mkTuple [
          "ibus"
          "anthy"
        ])
        (mkTuple [
          "ibus"
          "pinyin"
        ])
        (mkTuple [
          "ibus"
          "uniemoji"
        ])
      ];
      sources = [
        (mkTuple [
          "ibus"
          "hangul"
        ])
        (mkTuple [
          "ibus"
          "anthy"
        ])
        (mkTuple [
          "ibus"
          "pinyin"
        ])
        (mkTuple [
          "ibus"
          "uniemoji"
        ])
      ];
    };

    "org/freedesktop/ibus/engine/hangul" = {
      auto-reorder = false;
      hangul-keyboard = "2";
      hanja-keys = "Hangul_Hanja";
      initial-input-mode = "latin";
      switch-keys = "Multi_key,Alt_R";
      word-commit = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.5;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "fingers";
      disable-while-typing = false;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Shift><Control>q" ];
      show-desktop = [ "<Super>d" ];

      move-to-workspace-1 = [ ];
      move-to-workspace-2 = [ ];
      move-to-workspace-3 = [ ];
      move-to-workspace-4 = [ ];

      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];

      move-to-workspace-left = [ "<Alt><Super>Left" ];
      move-to-workspace-right = [ "<Alt><Super>Right" ];

      switch-to-workspace-last = [ ];
      switch-to-workspace-left = [ "<Super>Left" ];
      switch-to-workspace-right = [ "<Super>Right" ];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
      screensaver = [ "<Super>l" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "ghostty";
      name = "Terminal";
    };
  };
}
