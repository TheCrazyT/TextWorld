echo executing build
Set DISTUTILS_DEBUG=1
set BASH=%CYGWIN_PATH%\bin\bash.exe --login -c '

echo %CD%
%BASH% PATH=/usr/bin/ uname -a'
%BASH% PATH=/usr/bin/ cd /cygdrive/c/projects/textworld/ ^&^& pwd ^&^& ls ^&^& PATH=/usr/bin/ %PYTHON_EXE% setup.py -v bdist_wheel 2^>^&1'

IF %ERRORLEVEL% NEQ 0 (
	exit 1
)
