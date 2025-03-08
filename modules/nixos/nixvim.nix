{ ... }:

{
  # https://github.com/nix-community/nixvim
  programs.nixvim = {
    enable = true;
    colorschemes.onedark.enable = true;

    keymaps = [ ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          nixd.enable = true;
        };
      };
      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
          fzf-native.enable = true;
        };
      };
      treesitter.enable = true;
      bufferline.enable = true;
      web-devicons.enable = true;
    };
  };
}
