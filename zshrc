##############################################
# zplug
#
[[ -f ~/.zplug/init.zsh ]] || return

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "mollifier/cd-gitroot"
zplug "plugins/git",   from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  zplug install
fi

zplug load

##############################################
# environment
#
export EDITOR=vim

##############################################
# completions
#
if [ -d ~/.zsh/comp ]; then
  fpath=(~/.zsh/comp $fpath)
  autoload -U ~/.zsh/comp/*(:t)
fi

zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes

zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list \
  '' \
  'm:{a-z}={A-Z}' \
  'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
  _approximate _list _history

autoload -U compinit
if [ ! -f ~/.zcompdump -o ~/.zshrc -nt ~/.zcompdump ]; then
  compinit -d ~/.zcompdump
fi
zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"

##############################################
# colors
#
if [ $TERM = "dumb" ]; then
  # Disable colors in GVim
  alias ls="ls -F --show-control-chars"
  alias la='ls -aF --show-control-chars'
  alias ll='ls -lF --show-control-chars'
  alias l.='ls -dF .[a-zA-Z]*'
else
  # Color settings for zsh complete candidates
  alias ls='ls -F --show-control-chars --color=always'
  alias la='ls -aF --show-control-chars --color=always'
  alias ll='ls -lF --show-control-chars --color=always'
  alias l.='ls -dF .[a-zA-Z]* --color=always'
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
fi

# use prompt colors feature
autoload -U colors
colors

PROMPT='[%n@%m]%# '
RPROMPT='[%~]'

##############################################
# others
#
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=50000

##############################################
# load local config
#
[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
