IF "%MSYS%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing init
set BASH=%MSYS%\usr\bin\bash -c 'PATH_SEPARATOR=: PATH=/usr/bin 
set PACMAN=%MSYS%\usr\bin\pacman.exe --noconfirm
set PIP=%MSYS%\usr\bin\%PYTHON_EXE% -m pip
REM %BASH% curl -sflL "https://raw.githubusercontent.com/appveyor/ci/master/scripts/enable-ssh.sh" | PATH=/usr/bin bash -e -'

Set PATHBCK=%PATH%

REM %BASH% pacman --noconfirm -R $\(PATH=/usr/bin pacman -Sl|PATH=/usr/bin grep mingw\)'
%PACMAN% -Sy msys2-runtime
%PACMAN% -Syuu
REN %PACMAN% -Syuu
%BASH% echo installing: rebase tree wget %PYTHON_PACKAGE% %PYTHON_PACKAGE%-setuptools msys/gcc p7zip ncurses-devel python libffi-devel libffi make msys2-runtime python3-pip automake gcc-libs libcrypt libcrypt-devel zlib zlib-devel gcc-fortran mingw-w64-x86_64-ca-certificates'

echo PYTHON VERSION:
%BASH% %PYTHON_EXE% --version

%PACMAN% -S rebase tree wget %PYTHON_PACKAGE% %PYTHON_PACKAGE%-setuptools msys/gcc p7zip ncurses-devel python libffi-devel libffi make msys2-runtime python3-pip automake gcc-libs libcrypt libcrypt-devel zlib zlib-devel gcc-fortran mingw-w64-x86_64-ca-certificates

echo pacman versions:
%PACMAN% -Q

%BASH% %PYTHON_EXE% -m pip install --upgrade pip'
%BASH% %PYTHON_EXE% -m pip install wheel'

echo SCIPYURL: %SCIPYURL%
%BASH% wget -nc -nv %SCIPYURL%'
%BASH% ls -lah %SCIPYNAME%'

%BASH% %PYTHON_EXE% -c "import wheel.pep425tags as w;print(w.get_supported(\"\")[0][2])" ^> /tmp/suffix && ls -la /tmp/suffix'
FOR /F "tokens=* usebackq delims=^" %%F IN (%MSYS%\tmp\suffix) DO SET SUFFIX=%%F
echo SUFFIX: %SUFFIX%
%BASH% echo %SCIPYNAME%^|/usr/bin/sed s/win_amd64/%SUFFIX%/ ^> /tmp/scipyname2'
FOR /F "tokens=* usebackq delims=^" %%F IN (%MSYS%\tmp\scipyname2) DO SET SCIPYNAME2=%%F
echo SCIPYNAME2: %SCIPYNAME2%

%BASH% cp %SCIPYNAME% /tmp/%SCIPYNAME2%'
%BASH% ls -lah /tmp'
%BASH% %PYTHON_EXE% -c "import wheel.pep425tags as w;print(\"supported wheels:\"); print(w.get_supported(\"\"))"'
%BASH% %PYTHON_EXE% -m pip install --force-reinstall -v /tmp/%SCIPYNAME2% https://files.pythonhosted.org/packages/e6/0a/fc345c6e6161f84484870dbcaa58e427c10bd9bdcd08a69bed3d6b398bf1/gevent-1.3.5.tar.gz jericho==1.1.8 numpy==1.16.2 gym==0.12.1 cffi pillow --global-option=build_ext --global-option=--disable-jpeg nose'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

echo pip installed versions:
%PIP% list







Set PATH=%PATHBCK%
