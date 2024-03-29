## Aliases ##

alias jl='jupyter lab'
alias jn='jupyter notebook'
alias bf='brew info'
alias bi='brew install'
alias bu='brew uninstall'
alias bs='brew search'

# And God said, "Let there be light.
# If exa is installed
if ! type "exa" > /dev/null
then
	# Use `exa`

	alias ll='exa -lah --sort=type --group-directories-first --git --color=automatic'
	alias ls='exa --sort=type --group-directories-first --color=automatic'

# If GNU CoreUtils is installed
elif ! type "gls" > /dev/null
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


## No ZSH includes for bash.


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi


## PATH ##

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Rust
export PATH="$HOME/.cargo/bin:$PATH"


## App-Specific Settings

# SML New Jersey
export PATH=/usr/local/smlnj/bin:$PATH

# (Don't) Use icecream:
# export PATH=/usr/local/opt/icecream/libexec/icecc/bin:$PATH
# Deskbert is icecream scheduler
# export USE_SCHEDULER=192.168.1.229

# Buck/Buckaroo spying
export BUCKAROO_TELEMETRY_OPT_OUT=1

# opam configuration
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


## Python ##

# (Don't) Use Homebrew's python
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Virtual Environments and virtualenvwrapper.
export WORKON_HOME=$HOME/.virtualenvs
# (Don't) Use Homebrew's python
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
