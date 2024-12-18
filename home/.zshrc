export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# https://github.com/atuinsh/atuin
eval "$(atuin init zsh)"

# https://github.com/junegunn/fzf
eval "$(fzf --zsh)"

# https://direnv.net
eval "$(direnv hook zsh)"
