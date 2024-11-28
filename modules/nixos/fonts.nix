{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Fonts
    meslo-lgs-nf
    ubuntu-sans-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-emoji
    noto-fonts-extra
    nerd-fonts.terminess-ttf
  ];
}
