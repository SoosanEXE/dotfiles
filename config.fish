if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fish color settings
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


alias zshconfig="vim ~/.zshrc"
alias fishconfig="vim ~/.config/fish/config.fish"
alias spotify="flatpak run com.spotify.Client"
alias bashconfig='vim ~/.bashrc'
alias v="vim"
alias ls="lsd"
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
alias sofish="source ~/.config/fish/config.fish"
alias gitpat='cat ~/dev/PAT/git.txt'
alias dev='cd ~/dev/; v'
alias devjava='cd ~/dev/java/; v'
alias finddev='cd ~/dev/; vim (fzf -m)'
alias tmuxconf='v ~/.tmux.conf'


# Pacman aliases
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
