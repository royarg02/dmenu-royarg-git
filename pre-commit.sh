#!/usr/bin/sh

# Pre-commit script
# - Generate the checksums in the PKGBUILD file and add it to the commit if
# needed
# - Generate the .SRCINFO file and add it to the commit if needed

# Cleanup function
cleanup() {
  # Remove directories and files created/downloaded by makepkg
  rm --force --recursive pkg src *.part *.pkg.tar.zst *.tar.gz *.desktop *.1 LICENSE
}

trap cleanup SIGINT EXIT

# Generate the checksums in the PKGBUILD file
updpkgsums

# Remove files downloaded by updpkgsums
rm *.tar.gz *.desktop *.1 LICENSE

# Check if the checksums in the PKGBUILD file changed
if [ -n "$(git diff PKGBUILD | grep '^+md5sums')" ]; then
  printf "Updated the checksums in the PKGBUILD file\n"
  git add PKGBUILD
  printf "Added the PKGBUILD file to the commit\n"
fi

# Generate the .SRCINFO file based on the PKGBUILD file
makepkg --printsrcinfo > .SRCINFO

# Check if the .SRCINFO file was created/changed
if [ -n "$(git status --short | grep ' .SRCINFO$')" ]; then
  printf "Updated the .SRCINFO file\n"
  git add .SRCINFO
  printf "Added the .SRCINFO file to the commit\n"
fi

printf "All done!\n"
