echo chrome version:
wmic datafile where name="C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe" get Version /value


IF "%BUILD_MSYS%"=="1" (
	.appveyor_init_msys.bat
)
IF "%BUILD_CYGWIN%"=="1" (
	.appveyor_init_cygwin.bat
)
