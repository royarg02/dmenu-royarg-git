# Maintainer: Anurag Roy <anuragr9847@gmail.com>
_pkgname="dmenu"
pkgname="$_pkgname-royarg-git"
pkgver=5.2.r13.859b688
pkgrel=1
pkgdesc="A modified version of the dynamic menu for X, originally designed for dwm."
arch=('i686' 'x86_64')
url="https://github.com/RoyARG02/$_pkgname"
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
optdepends=('curl: to fetch and check updates for emoji through dmenu_emoji'
  'gtk3: for launching applications through dmenu_dex_run'
  'libnotify: to notify update check and fetch for dmenu_emoji'
  'systemd: to control login sessions through dmenu_power_opt'
  'xclip: to copy selected emoji to clipboard from dmenu_emoji'
  'xorg-xrdb: for loading X resources'
)
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
  make \
    X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
