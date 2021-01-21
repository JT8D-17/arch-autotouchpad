# Autotouchpad (for Arch-based distros)

Discontent with the lack of working means to automatically disable/enable the touchpad of my laptop when a USB mouse is plugged in made mewrite this small tool.    

Autotouchpad consists of a shell script that will change the touchpad's status when a USB mouse is plugged into (or is removed from) the laptop at runtime (via udev rule) or disable the touchpad when a USB mouse is detected as plugged in upon boot (viasystemd unit).

The shell script will scan for a mouse and touchpad via `xinput list` (search strings: `ouchpad` and `USB.*mouse`) and toggle the touchpad via _xinput enable/disable_. It will also (attempt to) send a notification about a status change via `notify-send`.

Usage on non-Arch-based distros is of course possible as well. The udev rule and systemd unit call the script from `/usr/share/autotouchpad`.

&nbsp;

## Requirements

- An Arch-based distro (for building a package via PKGBUILD)
- _xorg-xinput_, _systemd_, _libnotify_ (Arch packages)

&nbsp;

## Installation

Arch-based distros:    
`git clone https://github.com/JT8D-17/arch-autotouchpad.git`    
`cd arch-autotouchpad`    
`makepkg -sci`

Note:    
The `.install`script will enable the systemd unit automatically and reload and trigger udev rules. If you do not want this, comment out the `install=` line in PKGBUILD.

&nbsp;

## Uninstallation

Arch-based distros:    
`pacman -Rsn autotouchpad`

The sysemd unit will be disabled automatically pre-removal.

&nbsp;

## License

[GNU Free Document License (GFDL)](https://www.gnu.org/licenses/fdl-1.3.html)