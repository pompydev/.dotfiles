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

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Shift><Control>q" ];
      show-desktop = [ "<Super>d" ];
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
