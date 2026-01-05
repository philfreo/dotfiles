# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git macos python docker redis-cli yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim' # mvim
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# cd up to the root of a git project
alias cdg='cd $(git rev-parse --show-cdup)'

# git shortcuts that git aliases can't easily do
alias st="clear; git status"
alias g='git'
alias gitspp='git stash; git pull --rebase; git stash pop'
alias gitprp='git pull --rebase && git push'
alias dc='docker compose'

alias pbpaste-rtf='osascript -e '\''the clipboard as "HTML"'\''|perl -ne '\''print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))'\'

# rbenv (via homebrew) for ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv (via homebrew) for python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export PATH="/usr/local/sbin:$PATH"

# Use 'dotfiles' like 'git' to manage dotfiles
# https://github.com/philfreo/dotfiles
alias dotfiles='/usr/bin/git --git-dir=/Users/philfreo/.dotfiles/ --work-tree=/Users/philfreo'

# Bat Theme - https://github.com/sharkdp/bat#customization
export BAT_THEME="GitHub"

# convertmov input.mov to create a .webm and .mp4
function convertmov() {
  if [ -z "$1" ]; then
    echo "Please specify a .mov file"
    return 1
  fi
  
  input_file="$1"
  output_file="${input_file%.*}"
  
  ffmpeg -i "$input_file" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis -an "$output_file.webm"
  ffmpeg -i "$input_file" -c:v libx264 -pix_fmt yuv420p -crf 28 -preset veryslow -an "$output_file.mp4"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# make codex play nicely even when inside an nvm project folder with an older version of node
codex() {
  env codex "$@"
}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/philfreo/.cache/lm-studio/bin"
# End of LM Studio CLI section

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Source private/work-specific config if it exists
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

# support Claude code etc
export PATH="$HOME/.local/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/philfreo/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
