
autoload -U colors && colors
setopt PROMPT_SUBST

# $(((HISTCMD%2))&& echo "☆" || echo "★")
PROMPT='
%{$fg[red]%}%n%{$fg[magenta]%}$(echo ${$(shuf -e $(((HISTCMD%2))&& echo "★ ♠ ♦" || echo "☆ ♤ ♧ ♡ ♢")):0:1})%{$fg[white]%}%m%{$fg[blue]%}[%{$fg[cyan]%}%~%{$fg[blue]%}]%{$fg[black]%}» %{$reset_color%}'
RPROMPT="%{$fg[yellow]%}%*%{$reset_color%}"
TMOUT=1
TRAPALRM() { zle reset-prompt }

setopt histignorealldups sharehistory
setopt RM_STAR_WAIT

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias grep='grep -inC5 --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias rm='rm -v --one-file-system'
alias ls='ls --color=auto -CFt --group-directories-first'
alias ll='ls -alh'
alias df='df -h'
alias du='du -h'
alias find-ps='ps -e | grep '
alias ..='cd ..'

function mkcd() { mkdir -p $1 && cd $1 }
function mvcd() { mv $1 && cd $1 }
function cls() { cd $1 && ls }
function cll() { cd $1 && ll }

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# intel compiler path setup
[ -f /opt/intel/bin/compilervars.sh ] && \
	source /opt/intel/bin/compilervars.sh intel64 &> /dev/null

[ -f /usr/local/bin/vimpager ] && \
	export PAGER=/usr/local/bin/vimpager

