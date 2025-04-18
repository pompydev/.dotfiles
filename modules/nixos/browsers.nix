{ pkgs, inputs, ... }:

let
  pkgs-browsers = with pkgs; [
    tor-browser-bundle-bin
    mullvad-browser
  ];

  preview-browsers = with inputs.browser-previews.packages.${pkgs.system}; [
    # google-chrome # Stable Release
    # google-chrome-beta # Beta Release
    google-chrome-dev # Dev Release
  ];
in
{
  environment.systemPackages = preview-browsers ++ pkgs-browsers;
}
