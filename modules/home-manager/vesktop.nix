{ pkgs, ... }:

{
  home.packages = [
    pkgs.vesktop
  ];

  home.file = {
    ".config/vesktop/settings/settings.json".source = ../../home/.config/vesktop/settings/settings.json;
    ".config/vesktop/themes/catppuccin-frappe.theme.css".source =
      ../../home/.config/vesktop/themes/catppuccin-frappe.theme.css;
    ".config/vesktop/settings.json".source = ../../home/.config/vesktop/settings.json;
  };
}
