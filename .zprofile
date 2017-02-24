# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:/usr/local/sbin:$PATH"
fi

# fix the unknown locales on macos
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
	
if [[ -n "$(echo $DISPLAY)" || "$(uname -s)" = "Darwin" ]]; then
    alias l='gls -F --color'
    alias l='gls -aF --color'
    alias ll='gls -lF --color'
    alias lla='gls -lFa --color'
    alias dircolors='gdircolors'

    export TERM=xterm-256color
    alias ssh='TERM=xterm ssh '
    eval `dircolors $HOME/local/src/dircolors-solarized/dircolors.ansi-light`
fi

if [[ -n "$(which nvim)" ]]; then
    alias vim=nvim
    alias vi=nvim
fi
	
find $HOME/.ssh -name id_\* | grep -v .pub$  | xargs ssh-add >/dev/null 2>&1

export HISTSIZE=10000000

export DEBFULLNAME="Fabian Doerk"
export DEBEMAIL="fabian.doerk@de.clara.net"
export QUILT_PATCHES=debian/patches
export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"

export GOPATH="$HOME/go"
export PATH="$PATH:~/go/bin"

export LD_LIBRARY_PATH=${HOME}/local/lib/:${LD_LIBRARY_PATH}

export PATH="$PATH:~/Library/Python/2.7/bin/"

export PERL_MB_OPT="--install_base \"$HOME/local/\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/local/"
export PERL5LIB="$PERL5LIB:$HOME/local/lib/perl5/"

export POWERLINE_DIR="$HOME/Library/Python/2.7"
export POWERLINE_CONFIG_COMMAND="$POWERLINE_DIR/bin/powerline-config"
export POWERLINE_COMMAND="$POWERLINE_DIR/bin/powerline"
export POWERLINE_DAEMON_COMMAND="$POWERLINE_DIR/bin/powerline-daemon"
$POWERLINE_DAEMON_COMMAND -q

export TECHHUB_HOME=~/Repos/techhub/
if [ -e "$TECHHUB_HOME/de-platforms/home/shell-env/profile" ]; then 
    source $TECHHUB_HOME/de-platforms/home/shell-env/profile
fi

export HOMEBREW_NO_GITHUB_API=1
