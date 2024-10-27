{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "MesloLGS Nerd Fonr Mono";
      package = pkgs.meslo-lgs-nf;
    };

    settings = {
      linux_display_server = "X11"; # makes title bar look nice
      background_opacity = 0.75;
    };
  };
}
