IF "%MSYS%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing test
%MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ rebaseall -p"


%MSYS%\usr\bin\bash.exe -c "cd dist && PATH_SEPARATOR=: PATH=/usr/bin/ python3.exe -m pip install *.whl"
%MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ tree /usr/lib/python3.7"
cd tests
%MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ python3.exe -m nose -v"
cd ..