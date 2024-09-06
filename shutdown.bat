@echo off
setlocal enabledelayedexpansion

:input
set /p hours=Enter the number of hours until shutdown: 
if "%hours%"=="" (
    echo Please enter a valid number.
    goto input
)

rem Check if input is a valid number
for /L %%i in (0,1,23) do (
    if "!hours!"=="%%i" goto valid
)
echo Invalid input. Please enter a number between 0 and 23.
goto input

:valid
set /a seconds=hours*3600
shutdown /s /t %seconds%
echo The computer will shut down in %hours% hour(s).
pause
