# .bashrc
EMSDK_QUIET=1EMSDK_QUIET=1
set -o vi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/christiangrothe/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/christiangrothe/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/christiangrothe/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/christiangrothe/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Aliases
alias connect_hetz="ssh krischo@49.12.247.10"
alias c="clear"
alias vim="nvim"
. "$HOME/.cargo/env"

export PATH=$PATH:/usr/local/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#PATHS JUCE
export PATH="/home/christiangrothe/Music/JUCE/extras/Projucer/Builds/LinuxMakefile/build:$PATH"
export PATH="/home/christiangrothe/Music/JUCE/extras/AudioPluginHost/Builds/LinuxMakefile/build:$PATH"
#PATH emscripten
export PATH="/home/christiangrothe/emsdk/upstream/emscripten:$PATH"
export EDITOR=nvim

# Define colors
C_INDIANRED1="\033[38;5;204m"
NO_COLOR="\[\033[0m\]"

# Set PS1 to style the prompt
export PS1="${C_INDIANRED1}\w${NO_COLOR}$ "

