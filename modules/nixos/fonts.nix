{ pkgs, ... }:

let
  # https://github.com/Soft/nix-google-fonts-overlay
  fontsOverlay = import (
    builtins.fetchTarball {
      url = "https://github.com/pompydev/nix-google-fonts-overlay/archive/dfb84823efeb84314f8186cb2014edf05136b527.tar.gz";
      sha256 = "sha256:01cpfyzd4xl3a462jyn2xn22hn6i1my1svyag7926r3r2vmck24y";
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
