# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Initializing applications
eval "$(zoxide init bash)"

# Aliases

# ls
alias ls='eza -l'
alias l="eza -l"

# grep colors
alias grep='grep --color=auto'

# cd cmds
alias cd='z'
alias c="z"

# nvim aliases
alias vim="nvim"
alias n="nvim"
alias v="nvim"

# file browser alises
alias y="yazi"
alias f="yazi"

# arch specific aliases; not technically needed as dotfiles only applicable for archlinux
# nice to have anyway
if command -v pacman >/dev/null 2>&1; then
  alias rmorphans='sudo pacman -Rns $(pacman -Qdtq)'
  alias update="yay -Syyu; flatpak update; rmorphans"

  # fzf search cmds
  alias pacfind="pacman -Slq | fzf --preview-window=down:25% --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
  alias yayfind="yay -Slq | fzf --preview-window=down:25% --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
  alias pacrm="pacman -Qq | fzf --preview-window=down:25% --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
fi

# This line is here to mimic the windows powershell startup; uncomment it if you want that
# echo "Arch Linux $(uname -r); echo User $USER of Static Hostname $(cat /etc/hostname)"

# Customizing user prompt
PS1='\W > '
