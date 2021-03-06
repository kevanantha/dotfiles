# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kevin/.oh-my-zsh"

# ZSH_DISABLE_COMPFIX="true"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"
# ZSH_THEME="zeit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting yarn wd bundler npm nvm rbenv redis-cli ruby tmux docker docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimrc="nvim ~/.vimrc"
alias v="nvim"
alias c='clear'
alias gacp='echo "What is the commit message mate?" && read MSG && git add . && git commit -m "$MSG" && ggp'
# alias gac='echo "What is the commit message mate?" && read MSG && git add . && git commit -m "$MSG"'
alias gac='gaa && gc'
alias gaca='gaa && gc --amend'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias b='bundle'
alias be='bundle exec'
alias rs='rails s'
alias rc='rails c'
alias rr='rails routes'
alias rdm='rails db:migrate'
alias rdr='rails db:rollback'
alias rgm='rails g migration'
alias rg='rails g'
alias d='docker'
alias dc='docker-compose'
alias ls='exa -l -h -F --git --color=always'
alias cat='bat --theme=Dracula'
alias find='fd'
# alias gd='git diff --color | delta | cat'
alias supl='echo "Gimme the link mate!" && read MSG && open $MSG -a "Google Chrome"'
alias f='fuck'
alias bsl='brew services list'
alias bs='brew services'
alias killport='echo "What port?" && read PORT && kill -9 $(lsof -ti tcp:$PORT) && echo "DONE"'
alias tx='tmuxinator'

# Deno
export DENO_INSTALL="/Users/kevin/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

export EDITOR='nvim'

# spaceship
SPACESHIP_CHAR_SYMBOL="▲ "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# Ruby
# eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# For compilers to find libffi you may need to set:
export LDFLAGS="-L/usr/local/opt/libffi/lib"

# For pkg-config to find libffi you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# openSSL
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# python3.8
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# elasticsearch
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"

# mysql 5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# For compilers to find mysql@5.7 you may need to set:
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

# For pkg-config to find mysql@5.7 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

# DBngin exports
# export PATH=/Users/Shared/DBngin/mysql/8.0.12/bin:$PATH
# export PATH=/Users/Shared/DBngin/mysql/5.7.23/bin:$PATH

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
