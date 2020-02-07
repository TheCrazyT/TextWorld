#!/usr/bin/env bash

# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license.

set -ex
echo "Running setup.sh...";

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
		machine=Linux
		platform=Linux
		;;
    Darwin*)
		machine=Mac
		platform=Mac
		;;
    CYGWIN*)
		machine=Cygwin
		platform=Win
		;;
    MINGW*)
		machine=MinGW
		platform=Win
		;;
	MSYS*)
		machine=MinGW
		platform=Win
		;;
    *)
		machine="UNKNOWN:${unameOut}"
esac

cd textworld/thirdparty/
echo "platform: ${platform}"
if [ "${platform}" == "Linux" ]
then
	# Install command line Inform 7
	if [ ! -e I7_6M62_Linux_all.tar.gz ]; then
		echo "Downloading Inform7 CLI"
		curl -LO http://inform7.com/download/content/6M62/I7_6M62_Linux_all.tar.gz
	fi
	if [ ! -d inform7-6M62 ]; then
		tar xf I7_6M62_Linux_all.tar.gz
	fi
	(
		echo "Installing Inform7 CLI"
		cd inform7-6M62/
		./install-inform7.sh --prefix $PWD
		cd ..
		rm -f inform7-6M62/share/inform7/Internal/I6T/Actions.i6t
		cp inform7/share/inform7/Internal/I6T/Actions.i6t inform7-6M62/share/inform7/Internal/I6T/Actions.i6t
	)
fi
if [ "${platform}" == "Win" ]; then
	if [ "${MSYS}" == "" ];
	then
		echo "Variable MSYS not set!"
		exit 1
	fi
	if [ ! -e I7_6M62_Windows.exe ]; then
		curl -LO http://inform7.com/apps/6M62/I7_6M62_Windows.exe
	fi
	echo "Installing Inform7 CLI"
	mkdir -p ./inform7-6M62/share/inform7
	7z x -y -o./inform7-6M62/share/inform7/ I7_6M62_Windows.exe
	rm -f inform7-6M62/share/inform7/Internal/I6T/Actions.i6t
	cp inform7/share/inform7/Internal/I6T/Actions.i6t inform7-6M62/share/inform7/Internal/I6T/Actions.i6t
	pacman --noconfirm -S ncurses-devel
	/usr/bin/python3.exe -m pip install tatsu networkx urwid more_itertools jericho hashids
fi
if [ "${platform}" == 'Mac' ] && [ ! -e I7-6M62-OSX.dmg ]; then
	echo "Downloading Inform7 for Mac"
	curl -LO http://inform7.com/download/content/6M62/I7-6M62-OSX.dmg
fi

# Mount DMG if we're using a Mac
if [ "${machine}" == 'Mac' ] && [ -e inform7-6M62 ]; then
    echo "Mounting Inform for Mac"
    hdiutil attach ./I7-6M62-OSX.dmg

    echo "Copying Mac compiled inform files"
    current_dir="$(pwd)"
    cd /Volumes/Inform/Inform.app/Contents/MacOS
    cp cBlorb inform6 Inform intest ni "$current_dir/inform7-6M62/share/inform7/Compilers/"
    cp ./git "$current_dir/inform7-6M62/share/inform7/Interpreters/dumb-git"
    cp ./glulxe "$current_dir/inform7-6M62/share/inform7/Interpreters/dumb-glulxe"

    cd "$current_dir"

    echo "Unmounting Inform for Mac"
    hdiutil detach /Volumes/Inform/
fi

# Install a modified fork of Frotz and build it specifically for interaction with the command line
if [ ! -d frotz ]; then
    echo "Installing frotz"
    git clone https://github.com/danielricks/frotz.git
fi
(
    cd frotz/
    make -B dumb
)

# Install modified fork of Glulx and build it - we have this one locally
(
    echo "Installing cheapglk"
    cd glulx/cheapglk
    make -B
)
(
    echo "Installing git-glulx-ml"
    cd glulx/Git-Glulx
    make -B
)
