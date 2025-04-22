{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Image
    gcolor3
    contrast
    gimp
    inkscape
    krita
    cheese
    sly

    # Video
    kdePackages.kdenlive
    parabolic

    # Music
    gmetronome
    tenacity
    zrythm

    # Font
    font-manager
  ];
}
