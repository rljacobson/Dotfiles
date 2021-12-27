## Aliases ##

alias jl='jupyter lab'
alias jn='jupyter notebook'
alias bf='brew info'
alias bi='brew install'
alias bu='brew uninstall'
alias bs='brew search'


## Settings for ZSH itself ##
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel9k"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# Add a space in the first prompt
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
DISABLE_LS_COLORS="false"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git brew macos extract z sudo python pip virtualenvwrapper zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vimr'
else
  export EDITOR='nvim'
fi


## PATH ##

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH

# Rust
export PATH="$HOME/.cargo/bin:$PATH"


## App-Specific Settings

export HOMEBREW_CASK_OPTS="--fontdir=$HOME/Fonts"

# Brew Autocompletion
if type brew &>/dev/null; then
  fpath+=\$(brew --prefix)/share/zsh/site-functions
fi

# Zsh Autocompletion
# Note: must run after Brew Autocompletion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
#fpath=(/usr/local/share/zsh-completions \$fpath)


# SML New Jersey
export PATH=/usr/local/smlnj/bin:$PATH

# Do not Use icecream:
# export PATH=/usr/local/opt/icecream/libexec/icecc/bin:$PATH
# Deskbert is icecream scheduler
# export USE_SCHEDULER=192.168.1.229

# Buck/Buckaroo spying
export BUCKAROO_TELEMETRY_OPT_OUT=1

# opam configuration
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


## Python ##

export $PYENV_ROOT=$HOME/.virtualenvs

# Do not Use Homebrew's python
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Virtual Environments and virtualenvwrapper.
export WORKON_HOME=$HOME/.virtualenvs
# Do not Use Homebrew's python
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python3/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Something is clobbering the alias for ll, so we put it at the end.


# And God said, "Let there be light.
# If exa is installed
if type "exa" > /dev/null
then
	# Use `exa`

	alias ll='exa -lah --sort=type --group-directories-first --git --color=automatic'
	alias ls='exa --sort=type --group-directories-first --color=automatic'

# If GNU CoreUtils is installed
elif type "gls" > /dev/null
then
	# Use CoreUtils `ls`
  # a: All files except . and ..,
	# k: kibibytes,
	# X: sort by extension,
	# q: hide control characters with ?,
	# G: hide group on long lists,
	# h: human readable sizes, color if in terminal, group dirs first.
	alias ll='gls -lAkXqGh --color=auto --group-directories-first'
	alias ls='gls'
else
	# GNU CoreUtils is not installed, so use macOS version of ls
	# a: Include directory entries whose names begin with a dot
	# o: List in long format, but omit the group id
	# h: use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte
	# q: hide control characters with ?,
	# G: Enable colorized output.
	alias ls='ls -aohqG'

fi

