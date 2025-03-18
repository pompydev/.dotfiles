{ ... }:

{
  # https://nix-community.github.io/nixvim/
  programs.nixvim = {
    enable = true;
    colorschemes.onedark.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    keymaps = [
      {
        key = "<C-P>";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        key = "<leader>lg";
        action = "<cmd>LazyGit<cr>";
      }
      {
        key = "<leader>p";
        action = "<cmd>Gitsigns preview_hunk<cr>";
      }
      {
        key = "<C-T>";
        action = "<cmd>NvimTreeToggle<cr>";
      }
      {
        key = "<C-S>";
        action = "<cmd>w<cr>";
      }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          gopls.enable = true;
          nixd.enable = true;
        };
      };
      lsp-format = {
        enable = true;
      };
      lsp-lines.enable = true;

      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
          fzf-native.enable = true;
        };
      };

      floaterm = {
        enable = true;
        settings = {
          keymap_kill = "<Leader>fx";
          keymap_new = "<Leader>ft";
          keymap_next = "<Leader>fn";
          keymap_prev = "<Leader>fp";
          keymap_toggle = "<Leader>t";
        };
      };

      nvim-tree = {
        enable = true;
        hijackCursor = true;
        hijackDirectories.enable = true;
      };

      dashboard = {
        enable = true;
        settings = {
          config = {
            shortcut = [ ];
            header = [
              "   ██████╗  ██████╗ ███╗   ███╗██████╗ "
              "   ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗"
              "   ██████╔╝██║   ██║██╔████╔██║██████╔╝"
              "   ██╔═══╝ ██║   ██║██║╚██╔╝██║██╔═══╝ "
              "   ██║     ╚██████╔╝██║ ╚═╝ ██║██║     "
              "   ╚═╝      ╚═════╝ ╚═╝     ╚═╝╚═╝     "
            ];
            footer = [ "" ];
          };
        };
      };

      indent-blankline = {
        enable = true;
        settings = {
          exclude = {
            filetypes = [
              "dashboard"
            ];
          };
        };
      };

      trouble.enable = true;
      lazygit.enable = true;
      gitsigns.enable = true;
      airline.enable = true;
      bufferline.enable = true;
      dropbar.enable = true;
      markview.enable = true;
      scrollview.enable = true;
      neoscroll.enable = true;
      treesitter.enable = true;
      web-devicons.enable = true;
    };
  };
}
