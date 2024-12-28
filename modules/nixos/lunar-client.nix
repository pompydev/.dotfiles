{ pkgs, ... }:

{
  xdg.mime.defaultApplications = {
    "x-scheme-handler/lunarclient" = "lunarclient.desktop";
  };

  environment.systemPackages = with pkgs; [
    lunar-client
  ];
}
