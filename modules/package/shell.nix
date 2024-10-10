{ pkgs, ... }:

{
  users.users.pomp.shell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    fzf-zsh
    fzf
    eza
    atuin
    yazi
  ];
}
