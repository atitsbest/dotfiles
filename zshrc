# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

# history settings
setopt histignoredups
HISTFILE=~/.history
SAVEHIST=4096
HISTSIZE=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Try to correct command line spelling
setopt correct correctall

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# look for ey config in project dirs
export EYRC=./.eyrc

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

export PATH="$PATH:$HOME/dotfiles/bin"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
export PATH="$PATH:~/dotfiles/bin"

# Prompt
source ~/.zsh/git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '
ZSH_THEME_GIT_PROMPT_NOCACHE=1 # Damit der Status immer aktualisiert wird.

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
