{ pkgs, ... }:

{
  packages = with pkgs; [
    just

    nixd
    nixfmt-rfc-style
  ];
}
