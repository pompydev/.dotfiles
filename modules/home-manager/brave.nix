{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
  ];

  home.file.".local/share/applications/brave.desktop".text = ''
    [Desktop Entry]
    Name=Brave Web Browser
    Exec=${pkgs.brave}/bin/brave %U
    Actions=new-window;new-incognito-window;new-private-window-with-tor;new-gaming-window
    Categories=Network;WebBrowser
    Comment=Access the Internet
    GenericName=Web Browser
    Icon=brave-browser
    MimeType=application/pdf;application/rdf+xml;application/rss+xml;application/xhtml+xml;application/xhtml_xml;application/xml;text/html;text/xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ipfs;x-scheme-handler/ipns
    StartupNotify=true
    Terminal=false
    Type=Application
    Version=1.4

    [Desktop Action new-window]
    Name=New Window
    Exec=${pkgs.brave}/bin/brave --new-window %U

    [Desktop Action new-incognito-window]
    Name=New Incognito Window
    Exec=${pkgs.brave}/bin/brave --new-window --incognito %U

    [Desktop Action new-private-window-with-tor]
    Name=New Private Window with Tor
    Exec=${pkgs.brave}/bin/brave --new-window --tor %U

    [Desktop Action new-gaming-window]
    Name=New Gaming Window
    Exec=gamemoderun ${pkgs.brave}/bin/brave --new-window --disable-frame-rate-limit --disable-gpu-vsync %U
  '';
}
