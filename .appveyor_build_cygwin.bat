echo executing build
Set DISTUTILS_DEBUG=1
set CYGWIN_PATH=c:\cygwin
set BASH=%CYGWIN_PATH%\bin\bash.exe --login -c '

echo %CD%
%BASH% PATH=/usr/bin/ uname -a'
%BASH% PATH=/usr/bin/ %PYTHON_EXE% /cygdrive/c/projects/textworld/setup.py -v bdist_wheel 2>&1'
