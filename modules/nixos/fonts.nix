{ pkgs, ... }:

let
  # https://github.com/Soft/nix-google-fonts-overlay
  fontsOverlay = import (
    builtins.fetchTarball {
      url = "https://github.com/Soft/nix-google-fonts-overlay/archive/e089b8ef1c5ec95cd0a246311756d83f9f11b489.tar.gz";
      sha256 = "sha256:067ws05gk60al1ihiwwan2vbfjlm61d6m50qk9smb89fkmfi4z4n";
    }
  );
in
{
  nixpkgs.overlays = [
    fontsOverlay
  ];

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
    noto-fonts-color-emoji

    # Korean
    nanum
    baekmuk-ttf
  ];
}
