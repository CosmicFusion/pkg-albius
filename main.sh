#! /bin/bash

# Clone Upstream
git clone https://github.com/Vanilla-OS/Albius ./albius
cd ./albius
rm -rfv debian/changelog
touch debian/changelog
echo -e "albius (0.2.10-100pika) pikauwu; urgency=medium\n\n  * New Release\n\n -- Ward Nakchbandi <hotrod.master@hotmail.com> Sat, 01 Oct 2022 14:50:00 +0200" > debian/changelog


# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
