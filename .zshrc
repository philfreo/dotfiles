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
plugins=(git osx terminalapp python)

source $ZSH/oh-my-zsh.sh

# Faster git completion
__git_files () {
    _wanted files expl 'local files' _files
}

# navigational shortcuts
alias cdsites="cd ~/Sites";
# cd up to the root of a git project
alias cdg='cd $(git rev-parse --show-cdup)'

# hidden files shortcutes
alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder";
alias hidehiddenfiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder";

# git shortcuts that git aliases can't easily do
alias st="clear; git status";
alias g='git'
alias gitspp='git stash; git pull --rebase; git stash pop'
alias gitprp='git pull --rebase && git push'

# Shortcuts for starting/stopping various services 
alias db='mysql -u root -A'
alias dbstart="sudo /opt/local/share/mysql55/support-files/mysql.server start";
alias dbstop="sudo /opt/local/share/mysql55/support-files/mysql.server stop";
alias apachestart="sudo /opt/local/apache2/bin/apachectl start";
alias apachestop="sudo /opt/local/apache2/bin/apachectl stop";
alias apacherestart="sudo /opt/local/apache2/bin/apachectl graceful";
alias memcachestart="memcached -m 24 -p 11211 -d -l 127.0.0.1";
alias memcachestop="killall memcached";

# Python pip/virtualenv helpers
alias venv="source ./venv/bin/activate"

# Python Stuff
export PYTHONPATH=".:./lib";
alias pipr="pip install -U --exists-action=s -r requirements.txt"

# Ruby RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH

# Allow built-in compiler to access header files installed by MacPorts
# (Fixes pip install gevent, etc.)
#export CFLAGS="-I/opt/local/include $CFLAGS"
#export LDFLAGS="-L/opt/local/lib $LDFLAGS"
export CFLAGS=-I/opt/local/include
export LDFLAGS=-L/opt/local/lib
export PYTHONPATH=.:lib
export PATH=$PATH:/opt/local/bin

# so pip can install postgres stuff
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# rbenv (via homebrew) for ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="/Users/philfreo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
