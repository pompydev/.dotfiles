#region omz
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  fzf
  git
  zsh-interactive-cd
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#endregion omz

#region aliases
alias c='clear'
alias e='eza --long --classify=always --color=always --icons=always --all --group-directories-first --binary --group --no-time --octal-permissions'
alias y='yazi'
#endregion aliases

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
