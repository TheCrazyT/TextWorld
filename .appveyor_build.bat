IF "%BUILD_MSYS%"=="1" (
	.appveyor_build_msys.bat
)
IF "%BUILD_CYGWIN%"=="1" (
	.appveyor_build_cygwin.bat
)
