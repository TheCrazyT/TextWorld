echo executing build
Set DISTUTILS_DEBUG=1
set CYGWIN_PATH=c:\cygwin
set BASH=%CYGWIN_PATH%\bin\bash.exe --login -c '

%BASH% PATH=/usr/bin/ uname -a'
%BASH% PATH=/usr/bin/ %PYTHON_EXE% setup.py -v bdist_wheel 2>&1'
