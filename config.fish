if status is-interactive
    # Commands to run in interactive sessions can go here
end

export EDITOR=/usr/bin/vim
export FZF_DEFAULT_OPTS='
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
# fish color settings
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


alias zshconfig="vim ~/.zshrc"
alias fishconfig="vim ~/.config/fish/config.fish"
alias bashconfig='vim ~/.bashrc'
alias alaconfig="vim ~/.config/alacritty/alacritty.yml"
alias tmuxconf='v ~/.tmux.conf'
alias v="vim"
alias vi="vim"
alias ls="lsd"
alias cat="bat"
alias :q="exit"
alias :Q="exit"
alias q="exit"
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
alias fe="ranger"



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


#shenanigans
alias ttyc="tty-clock -c"

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

#colorscript -e (shuf -n 1 ~/.config/shclrscrpt/mycolors.txt)
