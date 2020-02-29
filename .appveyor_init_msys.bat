IF "%MSYS_PATH%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing init
set BASH=%MSYS_PATH%\usr\bin\bash -c 'PATH_SEPARATOR=: PATH=/usr/bin 
set PACMAN=%MSYS_PATH%\usr\bin\pacman.exe --noconfirm
set PIP=%MSYS_PATH%\usr\bin\%PYTHON_EXE% -m pip

IF "%ENABLE_RDESKTOP%"=="1" (
	echo enable rdesktop server
	%BASH% curl -sflL "https://raw.githubusercontent.com/appveyor/ci/master/scripts/enable-rdp.ps1"^>/c/enable-rdp.ps1'
	PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'c:/enable-rdp.ps1'"
	pause
)

Set PATHBCK=%PATH%

echo chromedriver:
%BASH% which chromedriver'

echo chromium-driver:
%BASH% which chromium-driver'

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
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

echo SCIPYURL: %SCIPYURL%
%BASH% wget -nc -nv %SCIPYURL%'
%BASH% ls -lah %SCIPYNAME%'

%BASH% %PYTHON_EXE% -c "import wheel.pep425tags as w;print(w.get_supported(\"\")[0][2])" ^> /tmp/suffix && ls -la /tmp/suffix'
FOR /F "tokens=* usebackq delims=^" %%F IN (%MSYS_PATH%\tmp\suffix) DO SET SUFFIX=%%F
echo SUFFIX: %SUFFIX%
%BASH% echo %SCIPYNAME%^|/usr/bin/sed s/win_amd64/%SUFFIX%/ ^> /tmp/scipyname2'
FOR /F "tokens=* usebackq delims=^" %%F IN (%MSYS_PATH%\tmp\scipyname2) DO SET SCIPYNAME2=%%F
echo SCIPYNAME2: %SCIPYNAME2%

%BASH% cp %SCIPYNAME% /tmp/%SCIPYNAME2%'
%BASH% ls -lah /tmp'
%BASH% %PYTHON_EXE% -c "import wheel.pep425tags as w;print(\"supported wheels:\"); print(w.get_supported(\"\"))"'

%BASH% %PYTHON_EXE% -m pip install --force-reinstall -v /tmp/%SCIPYNAME2% gevent==1.3.5 jericho==1.1.8 numpy==1.16.2 gym==0.12.1 cffi nose coverage'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% %PYTHON_EXE% -m pip install --force-reinstall -v pillow --install-option=build_ext --install-option=--disable-jpeg'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% %PYTHON_EXE% -m pip install --force-reinstall -v greenlet==0.4.14'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

echo pip installed versions:
%PIP% list

Set PATH=%PATHBCK%
