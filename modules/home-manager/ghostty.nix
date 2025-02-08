{ pkgs, ... }:

{
  home.packages = with pkgs; [
    meslo-lgs-nf
  ];

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    # https://ghostty.org/docs/config/reference
    settings = {
      theme = "OneHalfDark";
      font-size = 11;
      font-family = "MesloLGS NF";
      background-opacity = 0.75;
    };
  };
}
