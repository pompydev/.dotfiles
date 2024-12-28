{ pkgs, ... }:

{
  xdg.mime.defaultApplications = {
    "x-scheme-handler/anytype" = "anytype.desktop";
  };

  environment.systemPackages = with pkgs; [
    anytype
  ];
}
