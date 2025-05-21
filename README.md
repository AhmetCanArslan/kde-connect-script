# 📤 Send Clipboard Files to Devices via KDE Connect

`send_clipboard.sh` is a Bash script that allows you to quickly send files or screenshots from your clipboard to your mobile device using KDE Connect.

## Features

- Sends file paths copied to your clipboard directly to your device.
- If the clipboard contains an image (such as a screenshot), it sends the latest screenshot from your `~/Pictures/Screenshots` directory.
- Provides clear notifications for each action and error.

## Requirements

- [KDE Connect](https://kdeconnect.kde.org/) (`kdeconnect-cli` must be installed and configured)
- [xclip](https://github.com/astrand/xclip) (for clipboard access)
- Bash shell
- Your device must be paired and reachable via KDE Connect.

## Installation

1. Copy `send_clipboard` to a directory in your `$PATH`, e.g., `~/bin` or `/usr/local/bin`.
2. Make it executable:

   ```sh
   chmod +x /path/to/send_clipboard.sh
   ```

## Usage

1. **Send files:**
   - Copy one or more file paths to your clipboard (each path on a new line).
   - Run the script:

     ```sh
     ./send_clipboard.sh
     ```

2. **Send screenshots:**
   - Copy an image (e.g., take a screenshot to clipboard).
   - Run the script:

     ```sh
     ./send_clipboard.sh
     ```

   - The script will detect the image in the clipboard and send the most recent screenshot from `~/Pictures/Screenshots`.

## How it works

- The script checks your clipboard for file paths and sends each file to your device using KDE Connect.
- If no valid file paths are found, it checks if the clipboard contains an image. If so, it sends the latest screenshot from your screenshots directory.
- If neither is found, it prints an error message.

## Troubleshooting

- Make sure your device is paired and visible in KDE Connect.
- Ensure `kdeconnect-cli` and `xclip` are installed and available in your `$PATH`.
- The screenshots directory is set to `~/Pictures/Screenshots` by default. Change the `SCREENSHOT_DIR` variable in the script if your screenshots are saved elsewhere.
