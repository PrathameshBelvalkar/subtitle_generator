@echo off
setlocal EnableDelayedExpansion

:select_video
:: List all video files in the directory
echo Choose a video file:
set /a index=1
set "video_found=0"

for %%f in (*.mp4 *.mkv *.avi) do (
    echo !index! - %%f
    set "file[!index!]=%%f"
    set /a index+=1
    set "video_found=1"
)

:: Check if any video files were found
if !video_found! equ 0 (
    echo No video files found in the current directory.
    echo Press any key to exit.......
    pause >nul
    exit /b
)

:: Prompt user to select a file
set /p choice=Choose Number:

:: Check if choice is valid
if not defined file[%choice%] (
    echo Invalid selection. Please try again.
    goto select_video
)

:: Set selected video file
set "video_file=!file[%choice%]!"
set "audio_file=!video_file!.aac"
set "srt_file=!video_file!.srt"

:choose_language
:: Display available language options in sections
echo.
echo Available Languages:
echo ------------- Default -------------
echo en - English \(Default\)
echo.

echo ------------- European -------------
echo de - German, fr - French, es - Spanish, it - Italian, pt - Portuguese
echo nl - Dutch, sv - Swedish, no - Norwegian, da - Danish, fi - Finnish, pl - Polish
echo cs - Czech, sk - Slovak, sl - Slovenian, ro - Romanian, hu - Hungarian, bg - Bulgarian
echo sr - Serbian, hr - Croatian, mk - Macedonian, el - Greek, ru - Russian, uk - Ukrainian

echo.
echo ------------- Asian -------------
echo zh - Chinese, ja - Japanese, ko - Korean, th - Thai, vi - Vietnamese
echo hi - Hindi, bn - Bengali, ta - Tamil, te - Telugu, gu - Gujarati, kn - Kannada
echo ml - Malayalam, mr - Marathi, ne - Nepali, si - Sinhala, ur - Urdu, km - Khmer

echo.
echo ------------- African -------------
echo af - Afrikaans, sw - Swahili, yo - Yoruba, ha - Hausa, am - Amharic

echo.
echo ------------- Middle Eastern -------------
echo ar - Arabic, fa - Persian, he - Hebrew, tr - Turkish, ps - Pashto

echo.
echo ------------- Others -------------
echo id - Indonesian, ms - Malay, tl - Tagalog, jv - Javanese, su - Sundanese, haw - Hawaiian
echo.

set /p lang=Choose language (leave blank for English):

:: Set default language to English if not provided or if variable expands unexpectedly
if "%lang%"=="" set "lang=en"
if /i "%lang%"=="en_US.UTF-8" set "lang=en"

:: Validate the language code
set "valid_languages=en de fr es it pt nl sv no da fi pl cs sk sl ro hu bg sr hr mk el ru uk zh ja ko th vi hi bn ta te gu kn ml mr ne si ur km af sw yo ha am ar fa he tr ps id ms tl jv su haw"

echo Validating language choice...
set "is_valid=0"
for %%l in (%valid_languages%) do (
    if /i "!lang!"=="%%l" (
        set "is_valid=1"
        goto :continue
    )
)

echo Invalid language choice. Please try again.
goto choose_language

:continue
:: Extract audio using ffmpeg
echo Extracting audio from "%video_file%"...
ffmpeg -i "%video_file%" -vn -acodec copy "%audio_file%"

:: Generate SRT using Whisper
echo Generating SRT file...
whisper "%audio_file%" --model small --language %lang% --output_format srt

:: Delete the temporary audio file
del "%audio_file%"

:: Notify user of completion and exit
echo Process completed. SRT file generated: %srt_file%
pause
start %srt_file%
exit /b
