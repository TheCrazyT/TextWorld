echo executing test

set CYGWIN_PATH=c:\cygwin
set BASH=%CYGWIN_PATH%\bin\bash.exe --login -c '

%BASH% apt-cyg install tree graphviz'
%BASH% rebaseall -p'
%BASH% wget -O /tmp/chromedriver_win32.zip https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_win32.zip'
%BASH% 7z x -y -o/tmp/ /tmp/chromedriver_win32.zip'
%BASH% cp /tmp/chromedriver.exe /usr/bin/'
%BASH% cd dist && PATH_SEPARATOR=: PATH=/usr/bin/ %PYTHON_EXE% -m pip install *.whl'
%BASH% PATH=/usr/bin/ tree /usr/lib/python3.7'
%BASH% PATH=/usr/bin/ %PYTHON_EXE% -m nose -sv --with-xunit --with-coverage --cover-xml --cover-html --cover-package textworld'
