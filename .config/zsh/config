################
# Autocomplete #
################

autoload -U compinit
compinit

################
# Key bindings #
################

# Enable Vim bindings.
bindkey -v
export KEYTIMEOUT=1

# Lookup history by pressing up.
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

##########
# Prompt #
##########

# Needed to be able to show variables such as ${vcs_info_msg_0_} in the prompt
setopt prompt_subst

# Show active Vim mode in PROMPT.
function zle-line-init zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then

        # Normal mode
        vim_char="|"

    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then

        # Insert mode
        vim_char=">" 

    fi
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select 


# Define the right prompt to consist of current dir and Vim mode character
# (either '|' or '>').
PROMPT=$'%F{white}%1~ %B%F{blue}${vim_char}%f%b '

################
# Right prompt #
################

# Show git information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

# Needed for showing staged and unstaged changes
zstyle ':vcs_info:*' check-for-changes true

# Format the git info to consist of the current branch, red '+' char if there
# are any uncommitted changes, and green '+' char if there are staged changes.
zstyle ':vcs_info:*' unstagedstr '%F{red}+'
zstyle ':vcs_info:*' stagedstr '%F{green}+'
zstyle ':vcs_info:git:*' formats '%F{153}%b%u%c'

# This function gets run on every command
precmd() {
    vcs_info
}

RPROMPT='${vcs_info_msg_0_}'

###############
# Zsh plugins #
###############

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#######################
# Application configs #
#######################

# FZF
source <(fzf --zsh)
# Skip Mac folders to avoid permission prompts
export FZF_DEFAULT_OPTS="--walker-skip .git,node_modules,target,build"

