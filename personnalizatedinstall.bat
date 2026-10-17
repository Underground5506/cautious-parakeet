
@echo off
setlocal

echo =========================
echo Personalised Autoinstall
echo =========================
echo.

:: Open a file selection dialog
for /f "usebackq delims=" %%F in (`powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; $d = New-Object System.Windows.Forms.OpenFileDialog; $d.Filter = 'Text files (*.txt)^|*.txt'; if ($d.ShowDialog() -eq 'OK') { $d.FileName }"`) do set "APP_FILE=%%F"

if not defined APP_FILE (
    echo [ERROR] No file selected.
    pause
    exit /b 1
)

:: Check Winget
where winget >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Winget not found.
    pause
    exit /b 1
)

:: Read IDs and install packages
set "WINGET_ARGS=--accept-source-agreements --accept-package-agreements --silent"

for /f "usebackq eol=# tokens=* delims=" %%A in ("%APP_FILE%") do (
    echo Installing %%A...
    winget install --id "%%A" -e %WINGET_ARGS%
)


echo.
echo Installation process finished.
echo.
echo Press 1 for help
echo Press X to exit
choice /c 1X /n /m "Your choice: "

if errorlevel 2 exit /b
if errorlevel 1 goto help

:help
echo.
echo =========================
echo          HELP
echo =========================
echo.
echo 1. Open the Winget search page:
echo https://winget.run/
echo.
echo 2. Search for the software you want.
echo.
echo 3. Copy the exact package ID.
echo.
echo 4. Paste the ID into a .txt file.
echo    Example: Discord.Discord
echo.
echo 5. Save the file and run this script again.
echo.
pause
