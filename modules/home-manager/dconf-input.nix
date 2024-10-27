{ lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
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

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Shift><Control>q" ];
    };

    "org/freedesktop/ibus/engine/hangul" = {
      auto-reorder = false;
      hangul-keyboard = "2";
      hanja-keys = "Hangul_Hanja";
      initial-input-mode = "latin";
      switch-keys = "Multi_key,Alt_R";
      word-commit = false;
    };
  };
}
