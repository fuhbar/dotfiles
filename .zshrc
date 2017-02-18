

[ -f $HOME/.oh-my-zshrc ] && source $HOME/.oh-my-zshrc

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/local/share/google-cloud-sdk/path.zsh.inc ]; then
  source "$HOME/local/share/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME/local/share/google-cloud-sdk/completion.zsh.inc ]; then
  source "$HOME/local/share/google-cloud-sdk/completion.zsh.inc"
fi

if [ -n "$(which kubectl 2>&1 >/dev/null)" ]; then
    source <(kubectl completion zsh)  # setup autocomplete in zsh
fi

unsetopt sharehistory

for file in common gcloud; do 
    [ -f $HOME/local/etc/$file.sh.inc ] && source $HOME/local/etc/$file.sh.inc 
done
