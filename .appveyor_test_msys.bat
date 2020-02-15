IF "%MSYS%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing test
set BASH=%MSYS%\usr\bin\bash -c "PATH=/usr/bin 
set PACMAN=%MSYS%\usr\bin\pacman.exe --noconfirm

%PACMAN% -S mingw-w64-x86_64-graphviz
%BASH% rebaseall -p"
%BASH% wget -O /tmp/chromedriver_win32.zip https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_win32.zip"
%BASH% 7z x -y -o/tmp/ /tmp/chromedriver_win32.zip"
%BASH% cp /tmp/chromedriver.exe /usr/bin/"
%BASH% cd dist && PATH_SEPARATOR=: PATH=/usr/bin/ python3.exe -m pip install *.whl"
%BASH% PATH=/usr/bin/ tree /usr/lib/python3.7"
%BASH% PATH=/usr/bin/:/mingw64/bin python3.exe -m nose -sv --with-xunit --with-coverage --cover-xml --cover-html --cover-package textworld"