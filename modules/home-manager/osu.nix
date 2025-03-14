{ pkgs, ... }:

{
  home.packages = with pkgs; [
    osu-lazer-bin
  ];

  home.file.".local/share/applications/osu.desktop".text = ''
    [Desktop Entry]
    Name=osu!
    # https://download.nvidia.com/XFree86/Linux-x86_64/525.78.01/README/openglenvvariables.html
    # https://github.com/PipeWire/pipewire?tab=readme-ov-file#usage
    # osu! uses a sample rate of 44.1kHz instead of the usual 48kHz.
    # Setting PIPEWIRE_LATENCY=16/48000 does not force the game to use 48kHz sample rate.
    # values below 8 causes issue
    Exec=env PIPEWIRE_LATENCY=16/48000 __GL_MaxFramesAllowed=1 __GL_SYNC_TO_VBLANK=0 gamemoderun osu! %U
    Categories=Game
    Comment=A free-to-win rhythm game. Rhythm is just a *click* away!
    SingleMainWindow=true
    Icon=osu
    StartupWMClass=osu!
    MimeType=application/x-osu-beatmap-archive;application/x-osu-skin-archive;application/x-osu-beatmap;application/x-osu-storyboard;application/x-osu-replay;x-scheme-handler/osu;
    StartupNotify=true
    Terminal=false
    Type=Application
    Version=1.5
  '';
}
