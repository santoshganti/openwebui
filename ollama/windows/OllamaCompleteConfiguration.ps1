@echo off
REM Complete Ollama Configuration for Custom Installation
REM Run as Administrator

echo ====================================
echo Ollama Complete Configuration
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
echo Step 1: Configuring Model Storage Paths...
setx OLLAMA_MODELS "D:\Ollama\Models" /M
setx OLLAMA_CACHE "D:\Ollama\Cache" /M
setx OLLAMA_HOST "0.0.0.0:11434" /M
if %errorLevel% == 0 (
    echo ✓ Environment variables set successfully
) else (
    echo ✗ Failed to set environment variables
)

echo.
echo Step 2: Creating Directory Structure...
mkdir "D:\Ollama\Models" 2>nul
mkdir "D:\Ollama\Cache" 2>nul
mkdir "D:\Ollama\Logs" 2>nul
if exist "D:\Ollama\Models" (
    echo ✓ Model storage directories created
) else (
    echo ✗ Failed to create directories
)

echo.
echo Step 3: Configuring Windows Firewall...
netsh advfirewall firewall add rule name="Ollama Server" dir=in action=allow protocol=TCP localport=11434 >nul 2>&1
if %errorLevel% == 0 (
    echo ✓ Firewall rule added successfully
) else (
    echo ✗ Failed to add firewall rule (may already exist)
)

echo.
echo Step 4: Checking Application Installation...
if exist "D:\Applications\Ollama\ollama.exe" (
    echo ✓ Ollama application found at D:\Applications\Ollama\
    "D:\Applications\Ollama\ollama.exe" --version
) else (
    echo ✗ Ollama application not found at expected location
    echo Please verify installation path
)

echo.
echo Step 5: Service Configuration...
sc query ollama >nul 2>&1
if %errorLevel% == 0 (
    echo ○ Ollama service exists, updating configuration...
    sc stop ollama >nul 2>&1
    sc config ollama binPath= "\"D:\Applications\Ollama\ollama.exe\" serve --host 0.0.0.0:11434"
    sc start ollama >nul 2>&1
    echo ✓ Service updated and restarted
) else (
    echo ○ No service found, will run manually
)

echo.
echo Step 6: Testing Configuration...
echo Waiting for Ollama to initialize...
timeout /t 5 /nobreak >nul

REM Test if Ollama is responding
curl -s http://localhost:11434/api/version >nul 2>&1
if %errorLevel% == 0 (
    echo ✓ Ollama is responding on localhost
    curl http://localhost:11434/api/version
) else (
    echo ○ Ollama not yet responding (may need manual start)
)

echo.
echo Step 7: Disk Space Check...
echo Application Installation:
dir "D:\Applications\Ollama" | findstr "bytes"
echo.
echo Model Storage Space Available:
for /f %%i in ("D:\Ollama\Models") do (
    dir %%~di | findstr "bytes free"
)

echo.
echo ====================================
echo Configuration Summary
echo ====================================
echo Application Path: D:\Applications\Ollama\
echo Model Storage: D:\Ollama\Models\
echo Cache Storage: D:\Ollama\Cache\
echo Network Binding: 0.0.0.0:11434
echo.
echo Next Steps:
echo 1. Test network access: curl http://10.0.0.84:11434/api/version
echo 2. Download first model: ollama pull qwen3:4b
echo 3. Verify storage location: dir D:\Ollama\Models
echo.
echo Manual Start Command (if needed):
echo set OLLAMA_MODELS=D:\Ollama\Models
echo set OLLAMA_HOST=0.0.0.0:11434
echo "D:\Applications\Ollama\ollama.exe" serve
echo.
pause