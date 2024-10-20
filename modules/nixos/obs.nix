{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    plugins = [
      pkgs.obs-studio-plugins.input-overlay
      pkgs.obs-studio-plugins.obs-vkcapture
    ];
    enableVirtualCamera = true;
  };
}
