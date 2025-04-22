# https://github.com/atuinsh/atuin
eval "$(atuin init zsh)"

# https://github.com/junegunn/fzf
eval "$(fzf --zsh)"

# https://direnv.net
eval "$(direnv hook zsh)"

# https://nodejs.org/docs/latest/api/cli.html#node_compile_cachedir
NODE_COMPILE_CACHE=~/.node-compile-cache
