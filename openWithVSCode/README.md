# 💻 Open with VS Code Script

`open_with_vscode.sh` is a Bash script that allows you to open files and folders with Visual Studio Code from file managers, desktop shortcuts, or command line with proper URI handling.

## Features

- Opens files and folders in VS Code with new windows
- Properly decodes URL-encoded paths (spaces, special characters)
- Supports multiple file/folder selection

## Requirements

- [Visual Studio Code](https://code.visualstudio.com/) (`code` command must be available in PATH)
- Bash shell

## Installation

1. Make the script executable:
   ```bash
   chmod +x open_with_vscode.sh
   ```

2. **For Nautilus scripts integration:**
   - Copy the script to the Nautilus scripts directory:
   ```bash
   mkdir -p ~/.local/share/nautilus/scripts
   cp open_with_vscode.sh ~/.local/share/nautilus/scripts/
   chmod +x ~/.local/share/nautilus/scripts/open_with_vscode.sh
   ```
   - The script will appear in the right-click context menu under "Scripts"

3. **For command line execution:**
   - Copy the script to a directory in your PATH:
   ```bash
   mkdir -p ~/bin
   cp open_with_vscode.sh ~/bin/
   chmod +x ~/bin/open_with_vscode.sh
   ```
   - Add `~/bin` to your PATH if not already included (add to `~/.bashrc` or `~/.zshrc`):
   ```bash
   echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
   source ~/.bashrc
   ```

4. **Alternative: For system-wide file manager integration:**
   - Copy the script to a directory in your `$PATH` (e.g., `~/bin` or `/usr/local/bin`)
   - Create a desktop entry in `~/.local/share/applications/open-with-vscode.desktop`:

   ```desktop
   [Desktop Entry]
   Name=Open with VS Code
   Exec=/path/to/open_with_vscode.sh %U
   Icon=code
   Type=Application
   Categories=Development;TextEditor;
   MimeType=text/plain;inode/directory;
   ```

## Usage

### From Nautilus File Manager
- Right-click on files or folders and select "Scripts" → "open_with_vscode.sh"
- Works with multiple selections
- You can rename "open_with_vscode.sh" to whatever you want to be shown in right click menu

### From Command Line
```bash
# Open single file
./open_with_vscode.sh file:///home/user/document.txt

# Open multiple files/folders
./open_with_vscode.sh file:///home/user/file1.txt file:///home/user/project-folder

# Open with spaces in path
./open_with_vscode.sh "file:///home/user/My%20Documents/file.txt"
```

### From File Manager
- Right-click on files/folders and select "Open with VS Code" (after setting up desktop entry)

## How it Works

1. The script accepts file:// URIs as arguments
2. Strips the `file://` prefix from each URI
3. Decodes URL-encoded characters (e.g., `%20` becomes space)
4. Opens each decoded path in a new VS Code window using `code --new-window`

## Troubleshooting

- Ensure Visual Studio Code is installed and `code` command is available in your PATH
- For file manager integration, make sure the desktop entry has the correct path to the script
- If paths with spaces don't work, check that URL decoding is working properly
