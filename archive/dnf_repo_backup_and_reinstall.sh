#!/bin/sh

cd /usr/src

#install dnf plugin extra features
dnf install dnf-plugins-core

#refresh repo and make cache
dnf makecache --refresh

# Step 1: List minimal packages
dnf groupinfo "Minimal Install" | awk '/Mandatory Packages:/,/^$/' | grep -v "Mandatory Packages:" | awk '{$1=$1};1' > minimal-packages.txt

# Step 2: List all available installable packages (binary only)
dnf repoquery --available --qf "%{name}" > all-packages.txt

# Step 3: Subtract minimal packages
grep -vFxf minimal-packages.txt all-packages.txt > non-minimal-packages.txt

# Step 4: Download non-minimal packages
#dnf download --resolve $(cat non-minimal-packages.txt)
#tell the script not to fail if one package is missing
while read pkg; do
    sudo dnf download --resolve "$pkg" || echo "Skipping $pkg"
done < non-minimal-packages.txt

