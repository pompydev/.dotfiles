#region pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
#endregion pnpm

#region atuin
# https://github.com/atuinsh/atuin
eval "$(atuin init zsh)"
#endregion atuin

#region fzf
# https://github.com/junegunn/fzf
eval "$(fzf --zsh)"
#endregion fzf

#region direnv
# https://direnv.net
eval "$(direnv hook zsh)"
#endregion direnv
