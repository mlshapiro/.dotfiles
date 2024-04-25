source ~/.zshsecrets

case "$(uname -s)" in
   Darwin*)  source ~/.zshmacos;;
   Linux*)   source ~/.zshlinux;;
esac

# paths
export PATH="$HOME/nvim/bin:$HOME/.scripts:$HOME/.local/bin:$PATH"

# aliases
alias lg="lazygit"
alias cac="conda activate contrails"
alias nvo='fd --type f --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias howmany='find . ! -name . -prune -print | grep -c /'
alias copy='pbcopy'
alias ls='ls -G --color=auto'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

elapsed=0

preexec() {
    # start timing running command
    cmd_start="$SECONDS"
    cmd_running=true
}

precmd() {
    # finish timing running command
    local exit_code=$?
    vcs_info
    if [[ $cmd_running == true ]]; then
        local cmd_end="$SECONDS"
        elapsed=$((cmd_end-cmd_start))
        if [[ $exit_code != 0 ]]; then
            print -P '%F{red}exit ${exit_code}%f'
        fi
    fi
    cmd_running=false

    # set conda environment string
    if [[ -n $CONDA_DEFAULT_ENV ]]; then
        newline=$'\n'
        conda_env="%F{#555555}conda:$CONDA_DEFAULT_ENV$newline"
    else
        conda_env=""
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}+%f"
zstyle ':vcs_info:*' unstagedstr "%F{red}+%f"
zstyle ':vcs_info:git*' formats "%F{green}%b%f%c%u"
zstyle ':vcs_info:git*' actionformats "%a %F{green}%f%c%u"

setopt prompt_subst
export PROMPT='${conda_env}%F{#555555}${elapsed}s %F{blue}%1~%f %(?.%F{green}→.%F{red}→)%f '
export RPROMPT='${vcs_info_msg_0_}'
