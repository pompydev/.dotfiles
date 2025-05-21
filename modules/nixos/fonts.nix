{ pkgs, ... }:

let
  # https://github.com/Soft/nix-google-fonts-overlay
  fontsOverlay = import (
    builtins.fetchTarball {
      url = "https://github.com/pompydev/nix-google-fonts-overlay/archive/fc0690302d895d6813a51bcd918442f7dc9db49a.tar.gz";
      sha256 = "sha256:1mvhxl20vbccwzcr55ghlxnr8fnanbzh3jy7l4k2mzin4vmz4qan";
    }
  );
in
{
  nixpkgs.overlays = [
    fontsOverlay
  ];

  fonts.fontconfig = {
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ]; # default
      monospace = [ "MesloLGS NF" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };

    antialias = true; # default
    hinting.style = "slight"; # default
    subpixel.lcdfilter = "default"; # default
    subpixel.rgba = "rgb";
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    # General fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-extra
    google-fonts-audiowide

    # Windows Fonts
    corefonts
    vistafonts
    liberation_ttf

    # Monospaced
    meslo-lgs-nf
    ubuntu-sans-mono
    # https://github.com/NixOS/nixpkgs/tree/master/pkgs/data/fonts/nerd-fonts
    nerd-fonts.terminess-ttf

    # Emoji
    unicode-emoji
    noto-fonts-emoji
    noto-fonts-color-emoji # default for fonts.fontconfig.defaultFonts.emoji

    # Korean
    nanum
    baekmuk-ttf
  ];
}
