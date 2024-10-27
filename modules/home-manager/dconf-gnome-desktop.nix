{ ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Pop-dark";
      cursor-theme = "Breeze";
      icon-theme = "Papirus-Dark";

      font-antialiasing = "grayscale";
      font-hinting = "full";

      clock-format = "24h";
      clock-show-seconds = true;
      clock-show-weekday = true;

      color-scheme = "prefer-dark";
      enable-animations = true;
      enable-hot-corners = false;
      gtk-enable-primary-paste = false;
      locate-pointer = false;
      show-battery-percentage = true;
    };
  };
}
