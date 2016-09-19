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
# environmental
#
export EDITOR=vim
export PATH=$HOME/local/bin:$PATH
export GOROOT=$HOME/local/src/go
export PATH=$GOROOT/bin:$PATH

export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH

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
# alias
#
alias emacs='vim'

##############################################
# others
#
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=50000

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
