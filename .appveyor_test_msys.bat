IF "%MSYS_PATH%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing test
set BASH=%MSYS_PATH%\usr\bin\bash -c "PATH=/usr/bin 
set PACMAN=%MSYS_PATH%\usr\bin\pacman.exe --noconfirm

%PACMAN% -S mingw-w64-x86_64-graphviz
%BASH% rebaseall -p"
%BASH% wget -O /tmp/chromedriver_win32.zip https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_win32.zip"
%BASH% 7z x -y -o/tmp/ /tmp/chromedriver_win32.zip"
%BASH% cp /tmp/chromedriver.exe /usr/bin/"
%BASH% cd dist && PATH_SEPARATOR=: PATH=/usr/bin/ %PYTHON_EXE% -m pip install *.whl"
%BASH% PATH=/usr/bin/ tree /usr/lib/python3.7"
%BASH% cd tests && PATH=/usr/bin/:/mingw64/bin %PYTHON_EXE% -m nose -v test*"
