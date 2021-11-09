# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"


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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Actual aliases
alias sicstus='rlwrap ~/$DOCS/MIEIC/3ano/1semestre/PLOG/sicstus4.5.1/bin/sicstus-4.5.1'

# Configs
alias zshconfig='$EDITOR ~/.zshrc'
alias alconfig='(cd ~/.config/alacritty; $EDITOR ~/.config/alacritty/alacritty.yml)'
alias wmconfig='(cd ~/.config/awesome; $EDITOR ~/.config/awesome/rc.lua)'
alias nvconfig='(cd ~/.config/nvim; $EDITOR ~/.config/nvim/init.vim)'

# Dotfile management
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias css='config status -s'
alias caa='config add -A'
alias ccm='config commit -m'
alias cpush='config push'

# Courses
export DOCS=/home/lmoura/Docs/Documents

alias esof='cd $DOCS/MIEIC/3ano/1semestre/ESOF'
alias laig='cd $DOCS/MIEIC/3ano/1semestre/LAIG'
alias ltw='cd $DOCS/MIEIC/3ano/1semestre/LTW'
alias plog='cd $DOCS/MIEIC/3ano/1semestre/PLOG'
alias rcom='cd $DOCS/MIEIC/3ano/1semestre/RCOM'

alias sdis='cd $DOCS/MIEIC/3ano/2semestre/SDIS'
alias lbaw='cd $DOCS/MIEIC/3ano/2semestre/LBAW'
alias iart='cd $DOCS/MIEIC/3ano/2semestre/IART'
alias ppin='cd $DOCS/MIEIC/3ano/2semestre/PPIN'
alias comp='cd $DOCS/MIEIC/3ano/2semestre/COMP'

alias ldso='cd $DOCS/MIEIC/4ano/1semestre/LDSO'
alias aiad='cd $DOCS/MIEIC/4ano/1semestre/AIAD'
alias sinf='cd $DOCS/MIEIC/4ano/1semestre/SINF'
alias gemp='cd $DOCS/MIEIC/4ano/1semestre/GEMP'
alias mfes='cd $DOCS/MIEIC/4ano/1semestre/MFES'

alias ssin='cd $DOCS/MIEIC/4ano/2semestre/SSIN'
alias mark='cd $DOCS/MIEIC/4ano/2semestre/MARK'
alias asso='cd $DOCS/MIEIC/4ano/2semestre/ASSO'
alias iope='cd $DOCS/MIEIC/4ano/2semestre/IOPE'
alias lgp='cd $DOCS/MIEIC/4ano/2semestre/LGP'

alias aapp='cd $DOCS/MIEIC/5ano/1semestre/AAPP'
alias aos='cd $DOCS/MIEIC/5ano/1semestre/AOS'
alias odc='cd $DOCS/MIEIC/5ano/1semestre/ODC'
alias pea='cd $DOCS/MIEIC/5ano/1semestre/PEA'
alias mtds='cd $DOCS/MIEIC/5ano/1semestre/MTDS'

# Utilities
alias cl='clear'
alias jcall='javac *.java'
alias jclean='rm *.class'
alias ssha='eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa'
alias pgadmin='docker run -p 5050:5050 -e "PGADMIN_DEFAULT_EMAIL=admin@admin.com" -e "PGADMIN_DEFAULT_PASSWORD=password" -e "PGADMIN_LISTEN_PORT=5050" --rm --name pgadmin  dpage/pgadmin4'
alias nemo='nemo . &'
alias ranger='ranger .'
alias ra='ranger'
alias nv='nvim'

# add to path
export PATH=$PATH:~/.local/bin:~/.local/share/gem/ruby/3.0.0/bin
