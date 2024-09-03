zstyle :compinstall filename '/home/christian/.config/shell/zsh/.zshrc'

# Configure basic auto/tab complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#_comp_options+=(globdots)               # Include hidden files


# Set up the shared history file
HISTFILE=$XDG_CACHE_HOME/zsh_history
HISTSIZE=10000
SAVEHIST=50000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Use "Ctrl R" to do history search
bindkey "^R" history-incremental-search-backward

# Allow colors
autoload -U colors && colors
# Set up git info
autoload -Uz vcs_info


# Vi keybindings on command line
bindkey -v
# Set delay after the Escape key to 0.1 seconds
export KEYTIMEOUT=5

# # Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# No annoying beeps
unsetopt beep
# Give [nyae] correction suggestions for commands and arguments
unsetopt CORRECT CORRECTALL


# Include functions to aid configuration
[ -f "$ZDOTDIR/zsh_functions.zsh" ] && . "$ZDOTDIR/zsh_functions.zsh"

# Include my shell aliases
[ -f "$HOME/.config/shell/aliases.sh" ] && . "$HOME/.config/shell/aliases.sh"

# Include all shell-agnostic interactive settings
[ -f "$XDG_CONFIG_HOME/shell/shell_interactive.sh" ] \
    && . "$XDG_CONFIG_HOME/shell/shell_interactive.sh"

# Include the prettified prompt
[ -f "$ZDOTDIR/prompt.zsh" ] && . "$ZDOTDIR/prompt.zsh"

# The "zsh-syntax-highlighting" documentation says that it must be sourced in
# .zshrc last
[ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] \
    && . "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 
