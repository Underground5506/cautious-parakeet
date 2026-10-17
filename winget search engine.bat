
@echo off
setlocal

echo ====================
echo Winget Search Engine
echo ====================
echo.

set "credit=Author BLACKREAPER38 on GitHub"

:menu
echo 1. Search
echo 2. Exit
echo.
set /p "USER=Choose an option: "

if "%USER%"=="1" goto search
if "%USER%"=="2" goto exit
echo Invalid option.
echo.
goto menu

:search
set /p "package_name=Enter package name: "
echo.
winget search "%package_name%" | powershell -Command "$input | Select-Object -First 13"
echo.
goto menu

:exit
echo %credit%
timeout /t 2 >nul
exit /b
