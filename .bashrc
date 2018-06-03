#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias dpm='sudo nvim /sys/class/drm/card0/device/power_dpm_force_performance_level'
alias feh='feh --sort mtime --menu-font yudit/12 --scale-down'
alias ls='ls --color=auto'
alias vim='nvim'

# colors
export LS_COLORS="di=1;31:ln=31:so=32:pi=33:ex=37:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# parenthesis around directories
export PS1="\[$(tput setaf 0)\]\u\[$(tput bold)\]\[$(tput setaf 0)\]\h \[$(tput sgr0)\]\[$(tput setaf 0)\](\[$(tput bold)\]\[$(tput setaf 7)\]\w\[$(tput sgr0)\]\[$(tput setaf 0)\]) \\$ \[$(tput sgr0)\]"

# programs
export EDITOR=nvim
export VISUAL=subl3

# use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --ignore-case --no-messages --follow --no-ignore --hidden --color auto --glob "!.git/*"'

