SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
INSTALLERS="$SCRIPT_DIR/scripts"
cd "$SCRIPT_DIR" || exit

source "scripts/ui.sh"

header() {
    clear
    echo -e "${C_MAIN}${C_BOLD}"
    echo " ╭──────────────────────────────────────────╮"
    echo " │             Tranquil-M's dots!           │"
    echo " ╰──────────────────────────────────────────╯"
    echo -e "${C_RESET}"
}

clear
header

info "Checking OS type..."

if ! command -v pacman &> /dev/null; then
	error "Sorry, this script is only available on Arch Linux Distributions."
	exit 1
fi

if ! sudo -n true 2>/dev/null; then
	substep "${C_YELLOW}Note: sudo may prompt for your password during installaion${C_RESET}"
    substep "${C_RED}This script will ${C_BOLD}OVERWRITE${C_RESET}${C_RED} any current configurations that you have. I STRONGLY recommend backing up your current configs before running this installer; unless that's what you want to happen."
fi

success "We're on Arch!"

info "Checking for internet connection..."

if ! ping -c 1 -W 1 8.8.8.8 &> /dev/null; then
	error "A stable internet connection is required for this installation."
    info "Script location"
    substep "This script is located int $SCRIPT_DIR. Go fix your internet connection and re-run this script"
    error "No connection"
	exit 1
fi

success "Internet connection found!"

sh "$INSTALLERS/install_packages.sh"

sh "$INSTALLERS/install_greetd_theme.sh"

sh "$INSTALLERS/set_defaults.sh"

sh "$INSTALLERS/create_symlinks.sh"

sh "$INSTALLERS/install_firefox_theme.sh"

info "Would you like to reboot your computer?"
substep "This may be required for some features to be properly set."
echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}1 ${C_DIM}❯ ${C_RESET}Yes please!"
echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}2 ${C_DIM}❯ ${C_RESET}Nah, just let me in already."
echo -ne "${C_MAIN}${C_BOLD} ╰─ ${C_YELLOW}Choice [1/2]: ${C_RESET}"
read -rp "" CONSENT

if [ "$CONSENT" == "1" ]; then
    echo "OK BYE COME AGAIN"
    sudo reboot now
    exit 0
fi

echo ""

info "Thanks!"
substep "Thank you so much for using my dotfiles!"
substep "${C_YELLOW}Please consider starring this repository and sharing this with your friends!${C_RESET}"
success "Come again soon!"

finish

exit 0
