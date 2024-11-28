{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Fonts
    meslo-lgs-nf
    ubuntu-sans-mono
    noto-fonts-cjk-sans
    nerd-fonts.terminess-ttf
  ];
}
