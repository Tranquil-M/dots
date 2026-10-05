Welcome to...

# Tranquil's Hyprland Dot Files

## Table of Contents

| Category | Description |
|----------|------------|
| [How does it look?](#looks) | Images of the actual rice |
| [Installation](#install) | Directions to clone and use this repository |
| [How does the install script work?](#walkthrough) | Explanation of the install script |
| [Features](#feat) | Included features |
| [Bindings](#binds) | Keybindings list |
| [Used Packages](#pkgs) | All packages used |

<a name="looks"></a>
## How does it look?

| Desktop | Launcher |
| :---: | :---: |
| ![Desktop](Sample/Window.png) | ![Launcher](Sample/Launcher.png) |

|  Wallpaper Selector | Notification Manager |
| :---: | :---: |
| ![Wallpaper Selector](Sample/Wallpaper%20Selector.png) | ![Notification Manager](Sample/Notification%20Center.png) |

| Lock Manager | Settings |
| :---: | :---: |
| ![Lock Manager](Sample/Lock%20Manager.png) | ![Settings](Sample/Settings.png) |

## Color Examples

| Minecraft Purple | Hometown Pink | Cat Club Green |
| :---: | :---: | :---: |
| ![Purple](Sample/Purple.png) | ![Pink](Sample/Pink.png) | ![Green](Sample/Green.png) |

> [!NOTE]
> All wallpaper colors are completely adaptive! It changes everything, all just depends on what wallpaper you are using.

<a name="install"></a>
## Installation

1. Execute the curl entrypoint with curl:
    ```bash
    bash <(curl -sL https://raw.githubusercontent.com/Tranquil-M/dots/refs/heads/master/scripts/curl-entrypoint.sh)
    ```

> [!IMPORTANT]
> The install script is currently only compatible with Arch Linux.

<a name="walkthrough"></a>
## How does the install script work?

**Curl Entrypoint**
1. Verifies dependencies and operating system.
2. Installs git if not present.
3. Asks user if they want to clone using HTTPS or SSH
4. Executes the dotfiles installer

**Dotfiles installer**
1. Verifies dependencies, operation system, and internet connection.
2. Installs all the neccessary packages from `packages.txt` in the project root.
3. Sets up `noctalia`'s integrated greetd theme.
5. Sets default file manager, browser, etc.
6. Overwrites the current configuration in place with the new one, synced with GNU stow.

>[!NOTE]
>The curl entry point is completely optional, and serves as a wrapper for ease of use.

<a name="feat"></a>
## Features

These dotfiles are meant to be simple and practical for daily use, with some additional features:

- Screenshot utility using Grimblast and Satty  
  Saves to: `~/Pictures/Screenshots`
- Noctalia
    - Wallpaper switcher
    - Application Launcher
    - Lockscreen
    - Logout Menu
    - Clipboard History
    - Tab switcher
    - Control Panel
    - On-screen display
- Custom Discord theme using Equibop (Discord Client)
- Kickstart Nvim configuration
- Exa
- Zoxide
- Firefox theme using pywal-fox and custom css  

<a name="binds"></a>
## Keybindings

### Core actions
- Super + Space → Open launcher
- Super + C → Open control center
- Super + S → Open settings
- Super + N → Open notification history
- Super + B → Open battery panel
- Super + Backspace → Lock manager

### System
- Super + A → Toggle Bar Visibility
- Close laptop lid → lock and suspend

### Applications
- Super + Enter → Open terminal
- Super + E → Toggle wallpaper
- Super + X → Toggle emoji picker
- Super + V → Toggle clipboard
- Super + M → Toggle media
- Super + D → Toggle calendar
- ALT + Tab → Window switcher
 
### Media controls
- Volume up key → Increase volume
- Volume down key → Decrease volume
- Mute key → Mute audio
- Brightness up key → Increase brightness
- Brightness down key → Decrease brightness
- Next track → Next song
- Play/Pause → Play or pause media
- Previous track → Previous song

### Screenshots
- Super + Z → Capture selected area
- Super + Shift + Z → Capture full screen

### Window Management
* Super + H → Focus window left
* Super + L → Focus window right
* Super + J → Focus window up
* Super + K → Focus window down
* Super + Left Arrow → Focus window left
* Super + Right Arrow → Focus window right
* Super + Up Arrow → Focus window up
* Super + Down Arrow → Focus window down

* Super + Shift + H → Move window left
* Super + Shift + L → Move window right
* Super + Shift + K → Move window up
* Super + Shift + J → Move window down
* Super + Shift + Left Arrow → Move window left
* Super + Shift + Right Arrow → Move window right
* Super + Shift + Up Arrow → Move window up
* Super + Shift + Down Arrow → Move window down

* Super + Left Click → Drag/move window
* Super + Right Click → Resize window

* Super + W → Close active window
* Super + Shift + W → Force-close active window
* Super + T → Toggle floating mode, center window, and resize floating windows
* Super + F → Toggle maximized mode
* Super + Alt + F → Toggle fullscreen mode

### Workspaces
- Super + 1–0 → Switch to workspace 1–10
- Super + Shift + 1–0 → Move window to workspace 1–10

### Mouse actions
- Super + Left click drag → Move window
- Super + Right click drag → Resize window

> [!NOTE]
> Temporary workspaces are supported, but a minimum of 3 persistent workspaces are assigned per-monitor on startup.

<a name="pkgs">

## Packages

* [`Btop`](https://github.com/aristocratos/btop)
* [`GNU Stow`](https://www.gnu.org/software/stow/)
* [`Equibop`](https://equicord.org/)
* [`Exa`](https://github.com/ogham/exa)
* [`Grimblast`](https://github.com/hyprwm/contrib/tree/main/grimblast)
* [`Kitty`](https://sw.kovidgoyal.net/kitty/)
* [`Little Fox`](https://github.com/biglavis/LittleFox)
* [`Matugen Templates`](https://github.com/InioX/matugen-themes)
* [`Pywal-Fox`](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
* [`Satty`](https://github.com/Satty-org/Satty)
* [`Zoxide`](https://github.com/ajeetdsouza/zoxide)
* [`Noctalia`](https://noctalia.dev/)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/I2I61Z3QJH)
