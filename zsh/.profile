# use zsh if available
[[ -f $(which zsh) ]] && exec $(which zsh)
. "$HOME/.cargo/env"
