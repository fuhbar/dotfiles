

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

if [ -n "$(which kubectl  2>/dev/null)" ]; then
    source <(kubectl completion zsh)  # setup autocomplete in zsh
fi

unsetopt sharehistory

for file in common gcloud; do 
    [ -f $HOME/local/etc/$file.sh.inc ] && source $HOME/local/etc/$file.sh.inc 
done

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
ZSH_THEME="powerlevel9k/powerlevel9k"
