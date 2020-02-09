# Exports
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=/usr/local/bin/nvim

# Aliases
alias be='bundle exec'
alias reload='source ~/.zshrc'
alias vim="nvim"
alias vimdiff="nvim -d"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

. $(brew --prefix)/etc/profile.d/z.sh

ZSH=$HOME/.oh-my-zsh
plugins=(
  git
  kubectl
  vi-mode
  )
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh-theme

eval "$(direnv hook zsh)"
eval "$(rbenv init -)"

#vi-mode
bindkey -v
export KEYTIMEOUT=1
