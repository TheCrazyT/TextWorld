set CYGWIN_PATH=c:\cygwin

set BASH=%CYGWIN_PATH%\bin\bash.exe --login -c '
%BASH% wget https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg -O /usr/bin/apt-cyg 
%BASH% chmod +x /usr/bin/apt-cyg'
%BASH% ls -la /usr/bin/apt-cyg'
%BASH% apt-cyg install subversion'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% apt-cyg install %PYTHON_PACKAGE% %PYTHON_PACKAGE%-setuptools %PYTHON_PACKAGE%-devel %PYTHON_PACKAGE%-numpy'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% apt-cyg install automake zlib zlib-devel gcc-fortran'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% easy_install-%PYTHON_VERS% pip'

%BASH% %PYTHON_EXE% -m pip install wheel'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% %PYTHON_EXE% -m pip install cython'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% %PYTHON_EXE% -m pip install --global-option=build_ext --global-option=-lssp -v gevent==1.3.5'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% %PYTHON_EXE% -m pip install -v jericho==1.1.8 numpy==1.16.2 gym==0.12.1 scipy==1.2.1 cffi nose'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)

%BASH% %PYTHON_EXE% -m pip install --force-reinstall -v pillow --install-option=build_ext --install-option=--disable-jpeg'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)
