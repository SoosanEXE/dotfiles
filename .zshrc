# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


alias zshconfig="vim ~/.zshrc"
alias spotify="flatpak run com.spotify.Client"
alias v="vim"
alias ls="lsd"
alias bashconfig='vim ~/.bashrc'
alias cat="bat"
alias :q="exit"
alias v="vim"
alias vi="vim"
alias c="clear"
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias mkdir='mkdir -pv'
alias sozsh='source ~/.zshrc'
alias gitpat='cat ~/dev/PAT/git.txt'
alias dev='cd ~/dev/; v'
alias devjava='cd ~/dev/java/; v'
alias finddev='cd ~/dev/; vim $(fzf -m)'
alias tmuxconf='v ~/.tmux.conf'
