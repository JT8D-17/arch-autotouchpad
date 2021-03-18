# Maintainer: [Provided upon publishing to AUR] <youremail@domain.com>
#
#
pkgname=autotouchpad
pkgver=1.1
pkgrel=1
pkgdesc="Auto-toggles the touchpad status via shell script, systemd unit/timer and udev rule"
arch=("any")
license=("FDL")
depends=("xorg-xinput" "systemd" "libnotify")
_systemdunit="$pkgname.service"
_systemdtimer="$pkgname.timer"
_udevrule="99-$pkgname.rules"
_script="$pkgname.sh"
install="$pkgname.install"
source=($_systemdunit
        $_systemdtimer
        $_udevrule
        $_script)
md5sums=('708cc5afd1f06d31f7e0d5628916a8e1'
         '52576bbc83ef4d6dee9c6451f9257b74'
         '3266303cff0633b9a5794ed16a6a3622'
         'f32351482757b8c4a75fc284c657afca')
# Update md5sums wih 'updpkgsums'
package() {
	install -Dpm 0644 $_systemdunit "$pkgdir/usr/lib/systemd/system/$_systemdunit"
	install -Dpm 0644 $_systemdtimer "$pkgdir/usr/lib/systemd/system/$_systemdtimer"
	install -Dpm 0644 $_udevrule "$pkgdir/etc/udev/rules.d/$_udevrule"
	install -Dpm 0744 $_script "$pkgdir/usr/share/$pkgname/$_script"
} 
