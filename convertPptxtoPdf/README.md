# 🔄 Convert PPTX to PDF Script

`pptxtoPdf.sh` is a Bash script that converts Microsoft PowerPoint (.pptx) files to Portable Document Format (.pdf) using LibreOffice.

## Features

- Converts `.pptx` files to `.pdf`.
- Utilizes LibreOffice's `soffice` command for conversion.
- Supports batch conversion of multiple files.
- Saves the converted PDF in the same directory as the source `.pptx` file.
- Provides a confirmation message for each successful conversion.

## Requirements

- [LibreOffice](https://www.libreoffice.org/) installed (specifically, the `soffice` command must be available in your system's PATH).
- Bash shell.

## Installation

1.  **Make the script executable:**
    ```bash
    chmod +x pptxtoPdf.sh
    ```

2.  **For Nautilus scripts integration (recommended for GUI users):**
    - Copy the script to the Nautilus scripts directory:
      ```bash
      mkdir -p ~/.local/share/nautilus/scripts
      cp pptxtoPdf.sh ~/.local/share/nautilus/scripts/
      chmod +x ~/.local/share/nautilus/scripts/pptxtoPdf.sh
      ```
    - The script will then appear in the right-click context menu under "Scripts" when you select `.pptx` files in Nautilus. You can rename the script in the `~/.local/share/nautilus/scripts/` directory to change how it appears in the menu.

3.  **For command line execution:**
    - Copy the script to a directory in your PATH (e.g., `~/bin`):
      ```bash
      mkdir -p ~/bin
      cp pptxtoPdf.sh ~/bin/
      chmod +x ~/bin/pptxtoPdf.sh
      ```
    - Ensure `~/bin` is in your PATH. If not, add it to your shell's configuration file (e.g., `~/.bashrc` or `~/.zshrc`):
      ```bash
      echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc # Or ~/.zshrc
      source ~/.bashrc # Or source ~/.zshrc
      ```

## Usage

### From Nautilus File Manager (if installed as a Nautilus script)
1.  Select one or more `.pptx` files in Nautilus.
2.  Right-click on the selected file(s).
3.  Navigate to "Scripts" in the context menu.
4.  Click on `pptxtoPdf.sh` (or the name you gave it).
5.  The PDF versions will be created in the same directory as the original files.

### From Command Line
-   **To convert a single file:**
    ```bash
    pptxtoPdf.sh /path/to/your/presentation.pptx
    ```
    Or, if not in PATH, navigate to the script's directory:
    ```bash
    ./pptxtoPdf.sh /path/to/your/presentation.pptx
    ```

-   **To convert multiple files:**
    ```bash
    pptxtoPdf.sh file1.pptx /path/to/another/file2.pptx
    ```

The script will output a message for each file it converts.

## How it Works

1.  The script iterates through each file path provided as an argument.
2.  For each file, it constructs the output PDF filename by replacing the `.pptx` extension with `.pdf`.
3.  It uses the `soffice --headless --convert-to pdf "$dosya" --outdir "$(dirname "$dosya")"` command to perform the conversion.
    -   `--headless`: Runs LibreOffice without launching the GUI.
    -   `--convert-to pdf`: Specifies the target output format.
    -   `"$dosya"`: The input `.pptx` file.
    -   `--outdir "$(dirname "$dosya")"`: Specifies that the output PDF should be saved in the same directory as the input file.
4.  An optional success message is printed to the terminal.

## Troubleshooting

-   **`soffice: command not found`**: This means LibreOffice is not installed, or the `soffice` command is not in your system's PATH.
    -   **Solution**: Install LibreOffice. For example, on Debian/Ubuntu: `sudo apt install libreoffice`. On Fedora: `sudo dnf install libreoffice`. Ensure the installation includes the command-line tools.
-   **Permissions issues**: If the script cannot write to the output directory or read the input file.
    -   **Solution**: Ensure you have the necessary read/write permissions for the files and directories involved.
-   **Conversion errors**: LibreOffice might encounter issues converting specific `.pptx` files if they contain complex formatting or unsupported features.
    -   **Solution**: Try opening the file in LibreOffice Impress GUI and saving it as PDF manually to see if specific errors are reported.
