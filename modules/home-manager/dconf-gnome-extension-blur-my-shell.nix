{ ... }:

{
  dconf.settings."org/gnome/shell/extensions/blur-my-shell" = {
    appfolder-dialog-opacity = 0.12;
    blur-applications = false;
    blur-dash = true;
    blur-panel = false;
    brightness = 0.6;
    dash-opacity = 0.12;
    debug = false;
    hacks-level = 1;
    hidetopbar = false;
    sigma = 15;
  };

  dconfg.settings."org/gnome/shell/extensions/blur-my-shell/appfolder" = {
    brightness = 0.6;
    sigma = 15;
  };

  dconfg.settings."org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
    blur = true;
    brightness = 0.6;
    sigma = 15;
    static-blur = true;
    style-dash-to-dock = 0;
  };

  dconfg.settings."org/gnome/shell/extensions/blur-my-shell/panel" = {
    brightness = 0.6;
    sigma = 15;
  };

  dconfg.settings."org/gnome/shell/extensions/blur-my-shell/window-list" = {
    brightness = 0.6;
    sigma = 15;
  };
}
