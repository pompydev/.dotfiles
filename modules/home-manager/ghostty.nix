{ pkgs, ... }:

{
  home.packages = with pkgs; [
    meslo-lgs-nf
  ];

  catppuccin.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    # https://ghostty.org/docs/config/reference
    settings = {
      font-size = 11;
      font-family = "MesloLGS NF";
      background-opacity = 0.75;
    };
  };
}
