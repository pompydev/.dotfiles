{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
  ];

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
      push = {
        autoSetupRemote = true;
      };

      pull = {
        rebase = true;
      };

      init = {
        defaultBranch = "master";
      };
    };
  };
}
