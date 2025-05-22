{ lib, pkgs, ... }:

{
  catppuccin.zsh-syntax-highlighting.enable = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      c = "clear";
      d = "dua interactive";
      e = "eza --long --classify=always --color=always --icons=always --all --group-directories-first --binary --group --no-time --octal-permissions";
      ld = "lazydocker";
      x = "xh --follow";
    };
    sessionVariables = {
      # https://nodejs.org/docs/latest/api/cli.html#node_compile_cachedir
      NODE_COMPILE_CACHE = "$HOME/.node-compile-cache";
    };
  };

  home.packages = with pkgs; [
    xh
    dua
  ];

  catppuccin.atuin.enable = true;
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  catppuccin.fzf.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  catppuccin.tmux.enable = true;
  programs.tmux.enable = true;

  catppuccin.starship.enable = true;
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # https://starship.rs/config
      format = lib.concatStrings [
        "$directory"
        "$character"
      ];
      right_format = lib.concatStrings [
        "$all"
      ];

      aws.disabled = true;
      bun.format = "[$symbol($version )]($style)";
      cmake.format = "[$symbol($version )]($style)";
      conda.format = "[$symbol$environment]($style) ";
      deno.format = "[$symbol($version )]($style)";
      docker_context.format = "[$symbol$context]($style) ";
      dotnet.format = "[$symbol($version )(🎯 $tfm )]($style)";
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
      };
      golang.format = "[$symbol($version )]($style)";
      nix_shell.format = "[$symbol$state( \($name\))]($style) ";
      nodejs.format = "[$symbol($version )]($style)";
      package.format = "[$symbol$version]($style) ";
      python.format = "[$symbol$pyenv_prefix($version )(\($virtualenv\) )]($style)";
      rust.format = "[$symbol($version )]($style)";
      zig.format = "[$symbol($version )]($style)";
    };
  };
}
