echo executing test

set BASH=%CYGWIN_PATH%\bin\bash.exe --login -c '

%BASH% apt-cyg install tree graphviz'
%BASH% rebaseall -p'
%BASH% wget -O /tmp/chromedriver_win32.zip https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_win32.zip'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)
%BASH% 7z x -y -o/tmp/ /tmp/chromedriver_win32.zip'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)
%BASH% cp /tmp/chromedriver.exe /usr/bin/'
%BASH% ls -lah /cygdrive/c/projects/textworld/dist'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)
%BASH% cd /cygdrive/c/projects/textworld/dist ^&^& PATH_SEPARATOR=: PATH=/usr/bin/ %PYTHON_EXE% -m pip install *.whl'
IF %ERRORLEVEL% NEQ 0 (
	exit 1
)
%BASH% PATH=/usr/bin/ tree /usr/lib/python3.7'
%BASH% cd /cygdrive/c/projects/textworld ^&^& %PYTHON_EXE% -m nose -sv --with-xunit --with-coverage --cover-xml --cover-html --cover-package textworld ^&^& %PYTHON_EXE% -m nose tests/test*'
