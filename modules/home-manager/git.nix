{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gitbutler
    lazygit
    gitoxide
  ];

  programs.zsh.shellAliases = {
    lg = "lazygit";
    g = "gix";
  };

  catppuccin.lazygit.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "pompydev";
    userEmail = "pompydev@proton.me";
    signing = {
      signByDefault = true;
      key = "D3932F82A0667A3B";
    };
    extraConfig = {
      # https://blog.gitbutler.com/how-git-core-devs-configure-git/
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      init.defaultBranch = "master";
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      push = {
        autoSetupRemote = true;
        followTags = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      help.autocorrect = "prompt";
      merge.conflictstyle = "zdiff3";
      pull.rebase = true;
    };
  };
}
