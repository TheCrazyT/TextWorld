IF "%MSYS%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing test
set BASH=%MSYS%\usr\bin\bash -c 'PATH=/usr/bin 

%BASH% rebaseall -p'
%BASH% wget -O /tmp/chromedriver_win32.zip https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_win32.zip'
%BASH% 7z x -y -o/tmp/ chromedriver_win32.zip'
%BASH% cp /tmp/chromedriver.exe /usr/bin/'
%BASH% cd dist && PATH_SEPARATOR=: PATH=/usr/bin/ python3.exe -m pip install *.whl'
%BASH% PATH=/usr/bin/ tree /usr/lib/python3.7'
%BASH% PATH=/usr/bin/ python3.exe -m nose -sv --with-xunit --with-coverage --cover-xml --cover-html --cover-package textworld'
