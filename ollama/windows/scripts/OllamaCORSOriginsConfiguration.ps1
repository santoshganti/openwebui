@echo off
REM Ollama CORS Origins Configuration Script
REM Sets OLLAMA_ORIGINS environment variable with organized origin list
REM Run as Administrator

echo ====================================
echo Ollama CORS Origins Configuration
echo ====================================

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running as Administrator... OK
) else (
    echo ERROR: This script must be run as Administrator
    echo Right-click and select "Run as administrator"
    pause
    exit /b 1
)

echo.
echo Building OLLAMA_ORIGINS configuration...

REM Build the origins string with organized sections
set "ORIGINS="

REM Localhost Origins
set "ORIGINS=%ORIGINS%http://localhost,"
set "ORIGINS=%ORIGINS%https://localhost,"

REM Localhost with Wildcard Ports
set "ORIGINS=%ORIGINS%http://localhost:*,"
set "ORIGINS=%ORIGINS%https://localhost:*,"

REM Loopback IP Origins
set "ORIGINS=%ORIGINS%http://127.0.0.1,"
set "ORIGINS=%ORIGINS%https://127.0.0.1,"

REM Loopback IP with Wildcard Ports
set "ORIGINS=%ORIGINS%http://127.0.0.1:*,"
set "ORIGINS=%ORIGINS%https://127.0.0.1:*,"

REM All Interfaces Origins
set "ORIGINS=%ORIGINS%http://0.0.0.0,"
set "ORIGINS=%ORIGINS%https://0.0.0.0,"

REM All Interfaces with Wildcard Ports
set "ORIGINS=%ORIGINS%http://0.0.0.0:*,"
set "ORIGINS=%ORIGINS%https://0.0.0.0:*,"

REM Production Services Domain
set "ORIGINS=%ORIGINS%http://ollama.services.darkcatalist.com,"
set "ORIGINS=%ORIGINS%https://ollama.services.darkcatalist.com,"

REM Windows-specific Services Domain
set "ORIGINS=%ORIGINS%http://ollama.windows.darkcatalist.com,"
set "ORIGINS=%ORIGINS%https://ollama.windows.darkcatalist.com,"

REM OpenWebUI Domains
set "ORIGINS=%ORIGINS%http://openwebui.services.darkcatalist.com,"
set "ORIGINS=%ORIGINS%https://openwebui.services.darkcatalist.com,"

REM Application and Development Protocols
set "ORIGINS=%ORIGINS%app://*,"
set "ORIGINS=%ORIGINS%file://*,"
set "ORIGINS=%ORIGINS%tauri://*,"
set "ORIGINS=%ORIGINS%vscode-webview://*,"
set "ORIGINS=%ORIGINS%vscode-file://*"

echo.
echo Origin Categories Configured:
echo   ✓ Localhost (HTTP/HTTPS)
echo   ✓ Localhost with wildcard ports
echo   ✓ Loopback IP (127.0.0.1)
echo   ✓ Loopback IP with wildcard ports
echo   ✓ All interfaces (0.0.0.0)
echo   ✓ All interfaces with wildcard ports
echo   ✓ Production services domain
echo   ✓ Windows-specific services domain
echo   ✓ OpenWebUI domains
echo   ✓ Application protocols (app, file, tauri, vscode)

echo.
echo Setting OLLAMA_ORIGINS environment variable...

REM Set the environment variable
setx OLLAMA_ORIGINS "%ORIGINS%" /M

if %errorLevel% == 0 (
    echo ✓ OLLAMA_ORIGINS set successfully
) else (
    echo ✗ Failed to set OLLAMA_ORIGINS
    pause
    exit /b 1
)

echo.
echo Verification:
echo Current OLLAMA_ORIGINS length:
echo %ORIGINS% | find /c /v ""

echo.
echo ====================================
echo Configuration Complete
echo ====================================
echo.
echo Next Steps:
echo 1. Restart Ollama service or application
echo 2. Test NPM proxy access: https://ollama.services.darkcatalist.com/api/version
echo 3. Verify CORS headers in browser developer tools
echo.
echo To restart Ollama:
echo   taskkill /f /im ollama.exe
echo   "D:\Applications\Ollama\ollama.exe" serve
echo.
pause