IF "%MSYS%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing init
set BASH=%MSYS%\usr\bin\bash -c 'PATH=/usr/bin 
set PACMAN=%MSYS%\usr\bin\pacman.exe --noconfirm
set PIP=%MSYS%\usr\bin\python3.exe -m pip
REM %BASH% curl -sflL "https://raw.githubusercontent.com/appveyor/ci/master/scripts/enable-ssh.sh" | PATH=/usr/bin bash -e -'

Set PATHBCK=%PATH%

REM %BASH% pacman --noconfirm -R $\(PATH=/usr/bin pacman -Sl|PATH=/usr/bin grep mingw\)'
%PACMAN% -Syuu
%PACMAN% -Syuu
%PACMAN% -S rebase tree wget python3 python3-setuptools msys/gcc p7zip ncurses-devel python libffi-devel libffi make msys2-runtime python3-pip automake gcc-libs libcrypt libcrypt-devel zlib zlib-devel gcc-fortran mingw-w64-x86_64-graphviz
%BASH% python3.exe -m pip install --upgrade pip'
%BASH% python3.exe -m pip install --upgrade --force-reinstall numpy'
%BASH% python3.exe -m pip install pillow --global-option=build_ext --global-option=--disable-jpeg'
%BASH% wget -nc -q https://github.com/scipy/scipy/releases/download/v1.2.1/scipy-1.2.1-cp37-cp37m-win_amd64.whl'
%BASH% cp scipy-1.2.1-cp37-cp37m-win_amd64.whl /tmp/scipy-1.2.1-cp37-cp37m-msys_2_11_2_x86_64.whl'
%BASH% python3.exe -m pip install -v /tmp/scipy-1.2.1-cp37-cp37m-msys_2_11_2_x86_64.whl'
%BASH% ls /tmp'
%PIP% install nose wheel

Set PATH=%PATHBCK%