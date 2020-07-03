@echo off
SETLOCAL

call :exte_loop
call :dire_loop

mkdir "%dire%"

for /R %%f in (*) do (
	call :nice %%~xf "%%f"
)

pause
ENDLOCAL
goto :eof

:exte_loop
	echo Please input the file extension
	set /p exte=
	if "%exte%" equ "" (
		echo Invalid Input
		goto :exte_loop 
		)
	goto :eof

:dire_loop
	echo Please input the folder name (directory):
	set /p dire=
	if "%dire%" equ "" (
		echo Invalid Input
		goto :dire_loop 
		)
	goto :eof

:nice 
	set var=%1
	set var=%var:~1%
	goto :filt %var% "%2"
	goto :eof

:filt
	if "%1" equ ".%exte%" (
		call :moving %2
		)
	goto :eof

:moving
	move %1 "%cd%\%dire%"
	goto :eof