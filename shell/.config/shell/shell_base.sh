# "shell_base" is for setting up all user shells, login, non-login,
# interactive, or non-interactive. The only things that seem to apply to all
# to all of those regions are the PATH and the XDG Base Directory variables.

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# Add rust to the path
. "$HOME/.cargo/env"
# Add Vivado to the path
. /opt/Xilinx/Vivado/2023.2/settings64.sh
# Add pyenv to the path
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

export PATH


# Set the XDG Base Directory variables. (They'll get used for GUI and virt
# console.)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
