#!/bin/bash
set -euo pipefail

source "scripts/ui.sh"

info "Deploying firefox theme..."

FIREFOX_DIRS=(
    "$HOME/.mozilla/firefox"
    "$HOME/.config/mozilla/firefox"
)

if [ ! -d "${FIREFOX_DIRS[0]}" ] && [ ! -d "${FIREFOX_DIRS[1]}" ]; then
    substep "Initializing Firefox profile..."
    timeout 5s firefox --headless > /dev/null 2>&1 || true
fi

FOUND_PROFILE=false

for FIREFOX_DIR in "${FIREFOX_DIRS[@]}"; do
    [ -d "$FIREFOX_DIR" ] || continue

    for PROFILE in \
        "$FIREFOX_DIR"/*.default-release \
        "$FIREFOX_DIR"/*.default \
        "$FIREFOX_DIR"/*.profile-default; do

        [ -d "$PROFILE" ] || continue

        FOUND_PROFILE=true

        substep "Installing LittleFox theme to: $(basename "$PROFILE")"

        mkdir -p "$PROFILE/chrome"

        TEMP_THEME=$(mktemp -d)

        echo ""
        git clone --depth=1 https://github.com/biglavis/LittleFox "$TEMP_THEME"
        echo ""

        substep "Creating userChrome.css file"
        cp "$TEMP_THEME/userChrome.css" "$PROFILE/chrome/"

        substep "Creating user.js file"
        touch "$PROFILE/user.js"

        substep "Applying user.js configuration"
        if ! grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "$PROFILE/user.js"; then
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$PROFILE/user.js"
        fi

        if ! grep -q "widget.use-xdg-desktop-portal.file-picker" "$PROFILE/user.js"; then
            echo 'user_pref("widget.use-xdg-desktop-portal.file-picker", 1);' >> "$PROFILE/user.js"
        fi

        substep "Cleanup"
        rm -rf "$TEMP_THEME"
    done
done

if [ "$FOUND_PROFILE" = false ]; then
    info "No Firefox profiles found."
fi

success "Firefox theme installation complete!"
