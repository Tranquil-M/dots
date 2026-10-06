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

        substep "Creating Betterfox user.js file"
        echo ""
        rm -f "$PROFILE/user.js"
        curl -L -o "$PROFILE/user.js" "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"
        echo ""

        substep "Applying additional user.js configuration"

        if ! grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "$PROFILE/user.js"; then
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$PROFILE/user.js"
        fi

        if ! grep -q "widget.use-xdg-desktop-portal.file-picker" "$PROFILE/user.js"; then
            echo 'user_pref("widget.use-xdg-desktop-portal.file-picker", 1);' >> "$PROFILE/user.js"
        fi

        if ! grep -q "network.trr.mode" "$PROFILE/user.js"; then
            echo 'user_pref("network.trr.mode", 2);' >> "$PROFILE/user.js"
            echo 'user_pref("network.trr.max-fails", 5);' >> "$PROFILE/user.js"
        fi

        if ! grep -q "network.trr.uri" "$PROFILE/user.js"; then
            echo 'user_pref("network.trr.uri", "https://dns.dnswarden.com/00000000000000000000028");' >> "$PROFILE/user.js"
        fi

        if ! grep -q "browser.nova.enabled" "$PROFILE/user.js"; then
            echo 'user_pref("browser.nova.enabled", false);' >> "$PROFILE/user.js"
        fi

        substep "Cleanup"
        rm -rf "$TEMP_THEME"
    done
done

if [ "$FOUND_PROFILE" = false ]; then
    info "No Firefox profiles found."
fi

success "Firefox theme installation complete!"
