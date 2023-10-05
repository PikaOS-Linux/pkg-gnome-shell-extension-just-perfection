DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone -b 27.0 https://gitlab.gnome.org/jrahmatzadeh/just-perfection ./gnome-shell-extension-just-perfection
cp -rvf ./debian ./gnome-shell-extension-just-perfection/
cd ./gnome-shell-extension-just-perfection

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -pv ./output
mv -v ./*.deb ./output/
