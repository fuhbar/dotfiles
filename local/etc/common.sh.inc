#--------------------------------------------------------------------------
# SSH AGENT Setup 

SSH_ENV="$HOME/.ssh/environment"
function start_agent {
    tty -s 
    TTY=$?
    [ $TTY -eq 0 ] && echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    [ $TTY -ne 0 ] && /usr/bin/ssh-add > /dev/null 2>&1
    [ $TTY -eq 0 ] && /usr/bin/ssh-add 
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
#--------------------------------------------------------------------------
# 'pip install --save' like 'npm install --save'
function pip-install-save {
    package_name=$1
    requirements_file=$2
    if [[ -z $requirements_file ]]
    then
        requirements_file='./requirements.txt'
    fi
    pip install $package_name && pip freeze | grep -i $package_name >> $requirements_file
}
