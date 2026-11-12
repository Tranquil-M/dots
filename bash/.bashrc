# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export path vars
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

# Initializing applications
eval "$(zoxide init bash)"
eval "$(starship init bash)"

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

# lazygit aliase
alias lg="lazygit"

# file browser aliases and wrappers
function y() {
	local tmp
	tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd" || return
	fi
	rm -f -- "$tmp"
}

alias yazi="y"
alias f="y"

# arch specific aliases; not technically needed as dotfiles only applicable for archlinux
# nice to have anyway
if command -v pacman >/dev/null 2>&1; then
	alias rmorphans='sudo pacman -Rns $(pacman -Qdtq)'
	alias update="yay -Syyu; flatpak update; rmorphans"

	function chupd() {
		# wait until wifi connected via pinging cloudflare servers
		until ping -c 1 8.8.8.8 >/dev/null; do
			sleep 2
		done

		local upd=()

		# grab all updates from official, aur, and flatpak then toss them into an array
		mapfile -t official_upd < <(
			checkupdates
		)

		mapfile -t aur_upd < <(
			yay -Qua
		)

		mapfile -t flatpak_upd < <(
			flatpak remote-ls --updates
		)

		printf "%s\n" \
			"-- TOTAL UPDATES: $((${#official_upd[@]} + ${#aur_upd[@]} + ${#flatpak_upd[@]}))  --" \
			"" \
			"-- Official [${#official_upd[@]}] --" \
			"${official_upd[@]}" \
			"" \
			"-- AUR [${#aur_upd[@]}] --" \
			"${aur_upd[@]}" \
			"" \
			"-- Flatpak [${#flatpak_upd[@]}] --" \
			"${flatpak_upd[@]}" |
			less

	}

	# fzf search cmds
	alias pacfind="pacman -Slq | fzf --preview-window=down:25% --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
	alias yayfind="yay -Slq | fzf --preview-window=down:25% --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
	alias pacrm="pacman -Qq | fzf --preview-window=down:25% --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
fi

# This line is here to mimic the windows powershell startup; uncomment it if you want that
# echo "Arch Linux $(uname -r); echo User $USER of Static Hostname $(cat /etc/hostname)"

# This line is here to display fastfetch aswell as the current user pfp; path is configurable but is designed to work with noctalia
fastfetch

# Customizing user prompt
PS1='\W > '
