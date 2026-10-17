echo better ninite
echo ============
echo auto install
echo ============

echo.

where winget >nul 2>&1

if errorlevel 1 (
    echo [ERROR] winget isn't installed or it is not found.
    pause
    exit /b 1
)

echo [OK] winget found !
echo.

set "WINGET_ARGS=--accept-source-agreements --accept-package-agreements"
winget install --id discord.discord -e %WINGET_ARGS%
winget install --id opera.operaGX -e %WINGET_ARGS%
winget install --id Nvidia.GeForceNow -e %WINGET_ARGS%
winget install --id WiresharkFoundation.Wireshark -e %WINGET_ARGS%
winget install --id Tailscale.Tailscale -e %WINGET_ARGS%
winget install --id TheDocumentFoundation.LibreOffice -e %WINGET_ARGS%
winget install --id Microsoft.WSL -e %WINGET_ARGS%
winget install --id Google.QuickShare -e %WINGET_ARGS%
winget install --id PrismLauncher.PrismLauncher -e %WINGET_ARGS%
winget install --id VideoLAN.VLC -e %WINGET_ARGS%


echo operation finished
echo this project is licensed under the MIT License
echo available on GitHub
echo author: BLACKREAPER38