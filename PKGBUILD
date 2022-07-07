# Maintainer: Anurag Roy <anuragr9847@gmail.com>
_pkgname="dmenu"
pkgname="$_pkgname-royarg-git"
pkgver=5.1.r6.cdce3a7
pkgrel=1
pkgdesc="A modified version of the dynamic menu for X, originally designed for dwm."
arch=('i686' 'x86_64')
url="https://github.com/RoyARG02/$_pkgname"
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
install="$pkgname.install"
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make \
    X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
