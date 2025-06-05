@echo off
REM Ollama Storage Configuration Verification Script
REM Run as Administrator

echo ====================================
echo Ollama Storage Configuration Check
echo ====================================

echo.
echo 1. Checking Environment Variables:
echo OLLAMA_MODELS = %OLLAMA_MODELS%
echo OLLAMA_CACHE = %OLLAMA_CACHE%
echo OLLAMA_HOST = %OLLAMA_HOST%

echo.
echo 2. Checking Drive Space:
if defined OLLAMA_MODELS (
    echo Checking space on model drive...
    for /f %%i in ("%OLLAMA_MODELS%") do (
        echo Model Drive: %%~di
        dir %%~di | findstr "bytes free"
    )
) else (
    echo OLLAMA_MODELS not set - using default location
    echo Default: %USERPROFILE%\.ollama\models
)

echo.
echo 3. Checking Directory Structure:
if defined OLLAMA_MODELS (
    if exist "%OLLAMA_MODELS%" (
        echo ✓ Models directory exists: %OLLAMA_MODELS%
        echo Contents:
        dir "%OLLAMA_MODELS%" /B 2>nul || echo   [Empty]
    ) else (
        echo ✗ Models directory missing: %OLLAMA_MODELS%
        echo Creating directory...
        mkdir "%OLLAMA_MODELS%" 2>nul
        if exist "%OLLAMA_MODELS%" (
            echo ✓ Directory created successfully
        ) else (
            echo ✗ Failed to create directory
        )
    )
) else (
    echo Using default model location
)

echo.
echo 4. Checking Ollama Process:
tasklist /FI "IMAGENAME eq ollama.exe" 2>nul | find /I "ollama.exe" >nul
if %ERRORLEVEL% == 0 (
    echo ✓ Ollama is currently running
    echo Note: Restart Ollama to apply new storage settings
) else (
    echo ○ Ollama is not running
)

echo.
echo 5. Testing Configuration:
if defined OLLAMA_MODELS (
    echo Testing write access to model directory...
    echo test > "%OLLAMA_MODELS%\test.tmp" 2>nul
    if exist "%OLLAMA_MODELS%\test.tmp" (
        echo ✓ Write access confirmed
        del "%OLLAMA_MODELS%\test.tmp" 2>nul
    ) else (
        echo ✗ No write access to model directory
        echo Run as Administrator or check permissions
    )
)

echo.
echo 6. Recommendations:
echo - Restart Ollama service after setting environment variables
echo - Download a small model to test: ollama pull qwen3:1.7b
echo - Monitor disk usage: dir "%OLLAMA_MODELS%" /S
echo - For large models (14B+), ensure sufficient space

echo.
echo ====================================
echo Configuration Check Complete
echo ====================================
pause