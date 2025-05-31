# 📤 Send Clipboard to Device Script

`send_clipboard.sh` is a Bash script that sends files or screenshots from your clipboard to connected devices via KDE Connect. It intelligently handles both file paths and raw image data in the clipboard.

## Features

- Send files copied to clipboard directly to your paired device
- Automatically detects and sends the latest screenshot when clipboard contains raw PNG data
- Works with any KDE Connect paired device (uses first available device)
- Allows sending multiple files from the clipboard.

## Requirements

- [KDE Connect](https://kdeconnect.kde.org/) with at least one paired device
- `xclip` for clipboard access
- Screenshots directory at `~/Pictures/Screenshots` (for image fallback)

## Installation

1. Make the script executable:
   ```bash
   chmod +x send_clipboard.sh
   ```

2. **For keyboard shortcut execution(recommended):**
   - Copy the script to a directory in your PATH:
   ```bash
   mkdir -p ~/bin
   cp send_clipboard.sh ~/bin/
   chmod +x ~/bin/send_clipboard.sh
   ```
   - Set up a custom keyboard shortcut in your desktop environment:
     - **GNOME:** Settings → Keyboard → Custom Shortcuts
     - **KDE:** System Settings → Shortcuts → Custom Shortcuts
     - **Command:** `/home/username/bin/send_clipboard.sh` (replace with your actual path)

3. **For command line execution:**
   - Copy the script to a directory:
   ```bash
   ./send_clipboard.sh
   ```

## Usage

### Workflow Examples

1. **Send files:**
   - Copy files to clipboard (Copy from file manager Ctrl + C)
   - Run the script
   - Files will be sent to your first paired device

2. **Send screenshots:**
   - Take a screenshot (clipboard contains raw PNG data)
   - Run the script
   - The most recent screenshot from `~/Pictures/Screenshots` will be sent

## How it Works

1. **File Detection:** Reads clipboard content and treats each line as a potential file path
2. **File Validation:** Checks if each path exists and sends valid files
3. **Image Fallback:** If no files are found but clipboard contains PNG data, sends the latest screenshot
4. **Device Selection:** Automatically uses the first paired KDE Connect device
5. **Feedback:** Provides clear status messages for each operation when executed in terminal

## Configuration

### Change Target Device
Edit the script to specify a different device:
```bash
# Replace automatic detection with specific device ID if you want to send a specific device
DEVICE_ID="your_device_id_here"
```

### Change Screenshots Directory
Modify the `SCREENSHOT_DIR` variable:
```bash
SCREENSHOT_DIR="$HOME/Pictures/MyScreenshots"
```

## Troubleshooting

- **No paired devices:** Ensure KDE Connect is running and you have paired devices
  ```bash
  kdeconnect-cli -a  # List available devices
  ```

- **Device name issues:** Device names should be single words for the script to work properly
  - If your device has a multi-word name (e.g., "My Phone"), rename it to a single word (e.g., "MyPhone")
  - To rename: Go to KDE Connect settings → Select device → Change device name
  - Alternatively, modify the script to handle your specific device name format

- **xclip not found:** Install xclip
  ```bash
  sudo apt install xclip  # Debian/Ubuntu
  sudo dnf install xclip  # Fedora
  ```

- **Screenshot not found:** Check that screenshots are saved to `~/Pictures/Screenshots` or update the `SCREENSHOT_DIR` variable

- **Files not sending:** Verify file paths are correct and files exist. The script shows which files are found/not found.