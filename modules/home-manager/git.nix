{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "pompydev";
    userEmail = "pompydev@proton.me";
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
