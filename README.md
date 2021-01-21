# Autotouchpad

Autotouchpad consists of a shell script that will toggle the touchpad status when a USB mouse is plugged into (or is removed from) the laptop at runtime (via udev rule) or disable the touchpad when a USB mouse is detected as plugged in upon boot (viasystemd unit).

The shell script will scan for a mouse and touchpad via `xinput list` (search strings: `ouchpad` and `USB.*mouse`) and toggle the touchpad via _xinput enable/disable_. It will also (attempt to) send a notification about a status change via `notify-send`.

&nbsp;

## Requirements

- An Arch-based distro (for building a package via PKGBUILD)
- _xorg-xinput_, _systemd_, _libnotify_

&nbsp;

## Installation

Arch-based distros:
`git clone https://github.com/JT8D-17/arch-autotouchpad
cd arch-autotouchpad
makepkg -sci`

Caution:
- The systemd unit will be enabled automatically post-install (and disabled automatically pre-removal)!
- Udev rules will be automatically reloaded and triggered post-install.

&nbsp;

## Uninstallation

Arch-based distros:
`pacman -Rsn`
