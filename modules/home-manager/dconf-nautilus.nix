{ ... }:

{
  dconf.settings = {
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
      search-view = "list-view";
      show-create-link = true;
      show-hidden-files = true;
    };

    "org/gnome/nautilus/compression" = {
      default-compression-format = "zip";
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small";
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "larger";
    };
  };
}
