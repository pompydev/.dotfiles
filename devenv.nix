{ pkgs, ... }:

{
  packages = with pkgs; [
    just
    nixfmt-rfc-style
  ];

  # https://github.com/cachix/devenv/blob/main/src/modules/languages/nix.nix
  # https://devenv.sh/supported-languages/nix
  languages.nix = {
    enable = true;
    lsp.package = pkgs.nixd;
  };
}
