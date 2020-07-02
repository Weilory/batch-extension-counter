@echo off
SETLOCAL EnableDelayedExpansion

for /R %%f in (*) do (
	call :nice %%~xf
)

for /R %%f in (*) do (
	call :rea %%~xf
)

pause
ENDLOCAL
goto :eof

:nice 
	set var=%1
	set var=%var:~1%
	set /a %var%+=1
	goto :eof

:rea 
	set var=%1
	set var=%var:~1%
	call :unr "%com%" %var%
	set "com=%com% %var%"
	goto :eof

:unr
	Echo.%1 | findstr "%2">nul && (
		rem echo true
	) || (
		echo %2 : !%2!
	)
