# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:$PATH"
fi
	
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
	
find $HOME/.ssh -name id_\* | grep -v .pub$  | xargs ssh-add

export HISTSIZE=10000000

export DEBFULLNAME="Fabian Doerk"
export DEBEMAIL="fabian.doerk@de.clara.net"
export QUILT_PATCHES=debian/patches
export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"

export GOPATH="$HOME/go"
export PATH="$PATH:~/go/bin"

export LD_LIBRARY_PATH=${HOME}/local/lib/:${LD_LIBRARY_PATH}

export PERL_MB_OPT="--install_base \"$HOME/local/lib/perl5\""; export PERL_MB_OPT;
export PERL_MM_OPT="INSTALL_BASE=$HOME/local/lib/perl5"; export PERL_MM_OPT;
export PERL5LIB="$PERL5LIB:$HOME/local/lib/perl5/:$HOME/local/lib/perl5/x86_64-linux-gnu-thread-multi/auto/"

export POWERLINE_CONFIG_COMMAND="$HOME/local/bin/powerline-config"
export POWERLINE_COMMAND="$HOME/local/bin/powerline"
powerline-daemon -q

export TECHHUB_HOME=~/Repos/techhub/
if [ -e "$TECHHUB_HOME/de-platforms/home/shell-env/profile" ]; then 
    source $TECHHUB_HOME/de-platforms/home/shell-env/profile
fi

