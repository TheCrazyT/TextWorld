IF "%MSYS%"=="" (
	echo "Variable MSYS not set!"
	exit /B 1
)
echo executing build
Set DISTUTILS_DEBUG=1

%MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ uname -a"
REM %MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ sed -i s/shell=True/shell=False/ setup.py"
REM %MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ sed -i s/#check/check/ setup.py"
REM %MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ bash.exe setup.sh"
%MSYS%\usr\bin\bash.exe -c "PATH=/usr/bin/ python3.exe setup.py -v bdist_wheel 2>&1"
