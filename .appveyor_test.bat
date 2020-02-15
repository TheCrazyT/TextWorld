IF "%BUILD_MSYS%"=="1" (
	.appveyor_test_msys.bat
)
IF "%BUILD_CYGWIN%"=="1" (
	.appveyor_test_cygwin.bat
)
