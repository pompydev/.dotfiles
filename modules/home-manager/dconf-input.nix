{ lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings."org/gnome/desktop/input-sources" = {
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
    xkb-options = [
      "terminate:ctrl_alt_bksp"
      "compose:ralt"
      "lv3:switch"
    ];
  };

  dconf.settings."org/freedesktop/ibus/engine/hangul" = {
    auto-reorder = false;
    hangul-keyboard = "2";
    hanja-keys = "Hangul_Hanja";
    initial-input-mode = "latin";
    switch-keys = "Alt_R";
    word-commit = false;
  };
}
