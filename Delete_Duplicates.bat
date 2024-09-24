@echo off
setlocal enabledelayedexpansion

set /p "keywords=Enter the keywords (separated by spaces): "

echo Please review the entered keywords: %keywords%
choice /M "Proceed with deleting files?"

if errorlevel 2 (
    echo Operation canceled. No files will be deleted.
    pause
    exit /b
)

for /r %%F in (*) do (
    set "filename=%%~nF"
    for %%K in (%keywords%) do (
        echo !filename! | find /i "%%K" >nul
        if not errorlevel 1 (
            echo Deleting "%%F"
            del "%%F"
        )
    )
)

echo All matching files have been deleted.

pause
