# Video SRT Generator

## Overview

This script extracts audio from video files and generates subtitles in SRT format using Whisper AI. It supports common video formats such as MP4, MKV, and AVI. Users can select the video file and choose a language for the subtitles.

## Tutorial

![alt text](./tutorial/tut.gif)

## Features

- List available video files in the current directory.
- Allow users to select a video file.
- Provide a list of supported languages for subtitle generation.
- Extract audio from the selected video file.
- Generate SRT subtitles using Whisper AI.
- Clean up temporary audio files after generation.

## Requirements

To run this script, you will need:

- **Windows OS**: The script is written for the Windows Command Prompt (CMD).
- **Whisper AI**: The script uses Whisper for generating subtitles. Make sure to install it as per the instructions provided in the Whisper documentation.

## Setup

```
pip install -U openai-whisper
```

It also requires the command-line tool [`ffmpeg`](https://ffmpeg.org/) to be installed on your system, which is available from most package managers:

```bash
# on Ubuntu or Debian
sudo apt update && sudo apt install ffmpeg

# on Arch Linux
sudo pacman -S ffmpeg

# on MacOS using Homebrew (https://brew.sh/)
brew install ffmpeg

# on Windows using Chocolatey (https://chocolatey.org/)
choco install ffmpeg

# on Windows using Scoop (https://scoop.sh/)
scoop install ffmpeg
```

## Usage Instructions

1. **Clone or Download the Script**:

   - Download the script to your local machine.

2. **Open Command Prompt**:

   - Navigate to the directory where your video files and the script are located.

3. **Run the Script**:

   - Execute the script by typing `script_name.bat` (replace `script_name` with the actual name of your script).

4. **Select a Video File**:

   - The script will list all video files in the directory. Choose a file by entering its corresponding number.

5. **Choose a Language**:

   - You will be prompted to select a language for the subtitles. If you don't choose one, English will be the default.

6. **Subtitle Generation**:

   - The script will extract audio from the selected video and generate the SRT file. After processing, you will be notified about the generated SRT file.

7. **Exiting**:
   - If no video files are found in the directory, a message will be displayed, and you will be prompted to press any key to exit.

## Supported Video Formats

- MP4
- MKV
- AVI

## Supported Languages

- **Default**: English (en)
- **European**: German (de), French (fr), Spanish (es), Italian (it), Portuguese (pt), Dutch (nl), Swedish (sv), Norwegian (no), Danish (da), Finnish (fi), Polish (pl), Czech (cs), Slovak (sk), Slovenian (sl), Romanian (ro), Hungarian (hu), Bulgarian (bg), Serbian (sr), Croatian (hr), Macedonian (mk), Greek (el), Russian (ru), Ukrainian (uk)
- **Asian**: Chinese (zh), Japanese (ja), Korean (ko), Thai (th), Vietnamese (vi), Hindi (hi), Bengali (bn), Tamil (ta), Telugu (te), Gujarati (gu), Kannada (kn), Malayalam (ml), Marathi (mr), Nepali (ne), Sinhala (si), Urdu (ur), Khmer (km)
- **African**: Afrikaans (af), Swahili (sw), Yoruba (yo), Hausa (ha), Amharic (am)
- **Middle Eastern**: Arabic (ar), Persian (fa), Hebrew (he), Turkish (tr), Pashto (ps)
- **Others**: Indonesian (id), Malay (ms), Tagalog (tl), Javanese (jv), Sundanese (su), Hawaiian (haw)

## Troubleshooting

- **No Video Files Found**: Ensure that there are video files in the current directory. The script will notify you if none are found.
- **FFmpeg Not Recognized**: Ensure that FFmpeg is correctly installed and added to your system's PATH.
- **Whisper Installation**: Verify that Whisper is installed and properly set up.

## License

This script is released under the MIT License. Feel free to modify and distribute it as you see fit.
