{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "MesloLGS NF";
      package = pkgs.meslo-lgs-nf;
    };

    settings = {
      linux_display_server = "X11"; # makes title bar look nice
      background_opacity = 0.75;
    };
  };
}
