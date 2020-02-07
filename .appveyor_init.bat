IF "%MSYS%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing init
set BASH=%MSYS%\usr\bin\bash -c 'PATH=/usr/bin 
set PACMAN=%MSYS%\usr\bin\pacman.exe --noconfirm
set PIP=%MSYS%\usr\bin\%PYTHON_EXE% -m pip
REM %BASH% curl -sflL "https://raw.githubusercontent.com/appveyor/ci/master/scripts/enable-ssh.sh" | PATH=/usr/bin bash -e -'

Set PATHBCK=%PATH%

REM %BASH% pacman --noconfirm -R $\(PATH=/usr/bin pacman -Sl|PATH=/usr/bin grep mingw\)'
%PACMAN% -Sy msys2-runtime
%PACMAN% -Syuu
REN %PACMAN% -Syuu
%PACMAN% -S rebase tree wget python3 python3-setuptools msys/gcc p7zip ncurses-devel python libffi-devel libffi make msys2-runtime python3-pip automake gcc-libs libcrypt libcrypt-devel zlib zlib-devel gcc-fortran mingw-w64-x86_64-ca-certificates
echo SCIPYURL: %SCIPYURL%

%BASH% wget -nc -nv %SCIPYURL%'
%BASH% %PYTHON_EXE% -m pip install --upgrade pip'
%BASH% %PYTHON_EXE% -m pip install cffi'
%BASH% %PYTHON_EXE% -m pip install --upgrade --force-reinstall numpy'
%BASH% %PYTHON_EXE% -m pip install pillow --global-option=build_ext --global-option=--disable-jpeg'

%BASH% cp %SCIPYNAME% /tmp/%SCIPYNAME%'
%BASH% %PYTHON_EXE% -m pip install -v /tmp/%SCIPYNAME%'
%BASH% ls /tmp'
%PIP% install nose wheel

Set PATH=%PATHBCK%
