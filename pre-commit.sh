#!/usr/bin/sh

# Pre-commit script
# - Generate the checksums in the PKGBUILD file and add it to the commit if
# needed
# - Generate the .SRCINFO file and add it to the commit if needed

# Cleanup function
cleanup() {
  # Remove directories and files created/downloaded by makepkg
  rm --force --recursive pkg src dmenu *.pkg.tar.zst
}

trap cleanup SIGINT EXIT

# Build the package, potentially fetching a newer version
makepkg

# Check if the PKGBUILD file changed
if [ -n "$(git status --short | grep ' PKGBUILD$')" ]; then
  printf "Updated the PKGBUILD file\n"
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
