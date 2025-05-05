{
  pkgs,
  user ? "pomp",
  ...
}:

{
  users.users.${user}.shell = pkgs.zsh;
  programs.zsh.enable = true;
}
