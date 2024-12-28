{ pkgs, ... }:

{
  xdg.mime.defaultApplications = {
    "video/x-matroska" = "vlc.desktop";
    "video/mp4" = "vlc.desktop";
  };

  environment.systemPackages = with pkgs; [
    vlc
  ];
}
