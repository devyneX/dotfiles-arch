# dotfiles management
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# ls 
alias ls='ls -F --color=auto'
alias la='ls -FA --color=auto'
alias ll='ls -FlAh --color=auto'

# cd
alias ..='cd ..'
alias ...='cd ../..'

# config
alias conf='cd $XDG_CONFIG_HOME && nvim .'
alias nvconf='cd $XDG_CONFIG_HOME/nvim && nvim .'
alias zrc='cd $ZDOTDIR && nvim .zshrc'
alias kittyconf='nvim $XDG_CONFIG_HOME/kitty/kitty.conf'
alias hyprconf='cd $XDG_CONFIG_HOME/hypr && nvim .' 
alias barconf='cd $XDG_CONFIG_HOME/waybar && nvim .'
alias runconf='cd $XDG_CONFIG_HOME/rofi/ && nvim .'
alias fetchconf='cd $XDG_CONFIG_HOME/fastfetch/ && nvim config.jsonc'
alias ewwconf='cd $XDG_CONFIG_HOME/eww/ && nvim .'

# fetch
alias neofetch=fastfetch

# ollama
alias ollama-start='systemctl start ollama'
alias ollama-status='systemctl status ollama'
alias ollama-stop='systemctl stop ollama'

# nvim
alias nv=nvim
alias nv.=nvim .

# python
alias uvjupyter='uv tool run jupyter lab'

# other
alias src='source $ZDOTDIR/.zshrc'

