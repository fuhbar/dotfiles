

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
