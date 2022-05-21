# Maintainer: Anurag Roy <anuragr9847@gmail.com>
_pkgname="dmenu"
pkgname="$_pkgname-royarg-git"
pkgver=5.1.r2.bd73af3
pkgrel=2
pkgdesc="A modified version of the dynamic menu for X, originally designed for dwm."
arch=('i686' 'x86_64')
url="https://github.com/RoyARG02/$_pkgname"
license=('MIT')
depends=('sh' 'libxinerama' 'libxft-bgra')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
