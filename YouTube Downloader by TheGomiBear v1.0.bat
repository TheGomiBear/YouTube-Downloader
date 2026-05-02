@echo off
title YouTube Downloader by TheGomiBear v1.0
setlocal enabledelayedexpansion

:: Check if yt-dlp.exe exists
if not exist "yt-dlp.exe" (
    echo [ERROR] This tool requires yt-dlp.exe!
    echo Please download it from this link:
    echo github.com/yt-dlp/yt-dlp#release-files
    echo and place it in the folder where this tool is located.
    pause
    exit /b
)

:menu
cls
echo ======================================
echo YOUTUBE DOWNLOADER BY THEGOMIBEAR V1.0
echo ======================================
echo.
set /p "url=Enter your YouTube URL here: "

echo.
echo Select format:
echo 1. Video (MP4 - Best quality)
echo 2. Audio (MP3)
echo 3. Exit
set /p "choice=Enter choice (1-3): "

if "%choice%"=="1" (
    echo Downloading video...
    yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" --merge-output-format mp4 "%url%"
) else if "%choice%"=="2" (
    echo Downloading audio...
    yt-dlp -x --audio-format mp3 "%url%"
) else if "%choice%"=="3" (
    exit /b
) else (
    echo [ERROR] Invalid choice!
    pause
    goto menu
)

echo.
echo Download complete!
pause
goto menu