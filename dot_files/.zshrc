#==============================================================
#
# C O N F I G U R A T I O N F O R Z S H
#
# Fix colors
# -- For some reason, my extended colors in rxvt-unicode 256-color are
# completely screwed. So I'm running a custom script using colorcoke
# in the background to set the right colors. This is REALLY dirty,
# but it works for now.
if [[ "$TERM" = "rxvt-256color" ]]; then
  (~/bin/color-default &)
fi

#=-=-=-=-=-=-=
# load stuffs
#=-=-=-=-=-=-=

autoload -U colors
autoload -U compinit
autoload -U vcs_info

zmodload zsh/complist
zmodload zsh/terminfo

# setopt
setopt autocd extendedglob
setopt prompt_subst
setopt inc_append_history

# start stuffs
colors
compinit
vcs_info


#=-=-=-=-
# zstyle
#=-=-=-=-

# vcs_info
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true

# completion

# ignore completion to commands we don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# format autocompletion style
zstyle ':completion:*:descriptions' format "%{$fg[green]%}%d%{$reset_color%}"
zstyle ':completion:*:corrections' format "%{$fg[yellow]%}%d%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$fg[red]%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format "%{$fg[red]%}%d%{$reset_color%}"

# zstyle show completion menu if 2 or more items to select
zstyle ':completion:*' menu select=2

# zstyle kill menu
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.config/zsh.d/history

bindkey -v

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Import seperate config files
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

. ~/.config/zsh.d/prompt
. ~/.config/zsh.d/aliases
. ~/.config/zsh.d/functions
. ~/.config/zsh.d/fixkeys
. ~/.config/zsh.d/envars

