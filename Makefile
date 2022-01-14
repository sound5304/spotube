
USR_SHARE=deb-struct/usr/share
BUNDLE_DIR=build/linux/x64/release/bundle
deb: 
		mkdir -p spotube\
		&& mkdir -p $(USR_SHARE)/applications\
		&& mkdir -p $(USR_SHARE)/icons/spotube\
		&& cp -r $(BUNDLE_DIR)/* $(USR_SHARE)/spotube\
		&& cp linux/spotube.desktop $(USR_SHARE)/applications/\
		&& cp assets/spotube-logo.png $(USR_SHARE)/icons/spotube\
		&& dpkg-deb -b deb-struct/ build/Spotube-linux-x86_64.deb

TEMP_DIR=/tmp/spotube-tar
tar:
		mkdir -p $(TEMP_DIR)\
		&& cp -r $(BUNDLE_DIR)/* $(TEMP_DIR)\
		&& cp linux/spotube.desktop $(TEMP_DIR)\
		&& cp assets/spotube-logo.png $(TEMP_DIR)\
		&& tar -cJf build/Spotube-linux-x86_64.tar.xz -C $(TEMP_DIR) .\
		&& rm -rf $(TEMP_DIR)

appimage:
				 appimage-builder --recipe AppImageBuilder.yml\
				 && mv Spotube-*-x86_64.AppImage build