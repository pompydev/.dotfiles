{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "developomp";
    userEmail = "developomp@protonmail.com";
    signing = {
      signByDefault = true;
      key = "2B516173EDD492EB";
    };
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };

      init = {
        defaultBranch = "master";
      };
    };
  };
}
