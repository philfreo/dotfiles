export EDITOR=vim

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="wedisagree-phil"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx python)

source $ZSH/oh-my-zsh.sh

# Faster git completion
__git_files () {
    _wanted files expl 'local files' _files
}

# navigational shortcuts
alias cdsites="cd ~/Sites";
# cd up to the root of a git project
alias cdg='cd $(git rev-parse --show-cdup)'

# git shortcuts that git aliases can't easily do
alias st="clear; git status";
alias g='git'
alias gitspp='git stash; git pull --rebase; git stash pop'
alias gitprp='git pull --rebase && git push'

# Python pip/virtualenv helpers
alias venv="source ./venv/bin/activate"

alias pipru="pip install -U --exists-action=s -r requirements.txt"
alias pipr="pip install --no-deps --exists-action=s -r requirements.txt"

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/Users/philfreo/.local/bin:$PATH

export PATH=/Users/philfreo/Library/Python/2.7/bin:$PATH

export PATH=$PATH:/opt/local/bin

export PYTHONPATH=.

# so pip can install postgres stuff
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Make yarn's globally installed bins accessible
export PATH="$PATH:`yarn global bin`"

# rbenv (via homebrew) for ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv (via homebrew) for python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


source ~/.secrets.env

export NVM_DIR="/Users/philfreo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
