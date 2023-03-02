# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mekari/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting yarn wd bundler npm rbenv redis-cli ruby tmux docker docker-compose kubectl web-search)

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias hm="home-manager"
alias pn="pnpm"
alias ld="lazydocker"
alias tks="tmux kill-session"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimrc="nvim ~/.vimrc"
alias vimconfig="cd ~/.config/nvim && nvim ~/.config/nvim"
alias v="nvim"
alias c='clear'
alias gacp='echo "What is the commit message mate?" && read MSG && git add . && git commit -m "$MSG" && ggp'
alias bitpr='echo "What branch?" && read MSG && open "https://bitbucket.org/mid-kelola-indonesia/talenta-core/pull-requests/new?source=$MSG&t=1" -a "Arc"'
alias pobsi='wd obsi && git add . && git commit -m "docs: update" && ggp'
# alias gac='echo "What is the commit message mate?" && read MSG && git add . && git commit -m "$MSG"'
alias gac='gaa && gc'
alias gglm='git pull origin master --rebase=false'
alias gglmr='git pull origin master --rebase'
# alias gwip='gaa && gc --no-verify'
alias gaca='gaa && gc --amend'
alias gwip='echo "What is the commit message mate?" && read MSG && git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "$MSG [skip ci]"'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias berof='bundle exec rspec --only-failures'
alias b='bundle'
alias be='bundle exec'
alias rs='rails s'
alias rc='rails c'
alias rr='rails routes'
alias rdm='rails db:migrate'
alias rdms='rails db:migrate:status'
alias rdmt='rails db:migrate RAILS_ENV=test'
alias rdr='rails db:rollback'
# alias rgm='rails g migration'
# alias rg='rails g'
alias d='docker'
# alias k='kubectl'
alias dc='docker-compose'
alias ls='exa -l -h -F --git --color=always'
alias cat='bat --theme=Dracula'
# alias find='fd'
alias top='ytop'
# alias gd='git diff --color | delta | cat'
# alias gm='open "https://meet.google.com/landing?authuser=1" -a "Google Chrome"'
alias gmeet='open "https://meet.google.com/landing?authuser=1" -a "Arc"'
alias sup='open "https://meet.google.com/tzr-broj-sjg?authuser=1&pli=1" -a "Arc"'
alias supl='echo "Gimme the link mate!" && read MSG && open $MSG -a "Arc"'
alias bsl='brew services list'
alias bs='brew services'
alias killport='echo "What port?" && read PORT && kill -9 $(lsof -ti tcp:$PORT) && echo "DONE BRO!"'
alias tx='tmuxinator'
alias sl='pmset sleepnow'
alias ws='webstorm'

export EDITOR='nvim'
# export EDITOR='nvim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Application Support/neovim/bin:$PATH"

eval "$(starship init zsh)"
fpath+=${ZDOTDIR:-~}/.zsh_functions

export PNPM_HOME="/Users/mekari/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/Users/mekari/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# 1Password
eval "$(op completion zsh)"; compdef _op op

# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"

# fnm
export PATH=/Users/mekari/.fnm:$PATH
eval "`fnm env`"
# fnm shell setup
# https://github.com/Schniz/fnm#shell-setup
eval "$(fnm env --use-on-cd)"

# turbolift
# export PATH=/Users/mekari/turbolift/turbolift:$PATH
export PATH=/Users/mekari/turbolift:$PATH

# Nix
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

eval "$(direnv hook zsh)"

export DENO_INSTALL="/Users/mekari/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
