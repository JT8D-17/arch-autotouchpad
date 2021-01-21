# Maintainer: [Provided upon publishing to AUR] <youremail@domain.com>
#
#
pkgname=autotouchpad
pkgver=1.0
pkgrel=1
pkgdesc="Auto-toggles the touchpad status via shell script, systemd unit and udev rule"
arch=("any")
license=("FDL")
depends=("xorg-xinput" "systemd" "libnotify")
_systemdunit="$pkgname.service"
_udevrule="99-$pkgname.rules"
_script="$pkgname.sh"
install="$pkgname.install"
source=($_systemdunit
        $_udevrule
        $_script)
md5sums=('a8fac476d7576f731cb75588aae9f5ae'
         '3266303cff0633b9a5794ed16a6a3622'
         'f32351482757b8c4a75fc284c657afca')
# Update md5sums wih 'updpkgsums'
package() {
	install -Dpm 0644 $_systemdunit "$pkgdir/usr/lib/systemd/system/$_systemdunit"
	install -Dpm 0744 $_udevrule "$pkgdir/etc/udev/rules.d/$_udevrule"
	install -Dpm 0744 $_script "$pkgdir/usr/share/$pkgname/$_script"
} 
