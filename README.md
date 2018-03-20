# Make Screenshots Searchable

## Requirements:
* macOS 10.10 or higher
* Xcode Command Line Tools
* Homebrew
* Tesseract

### To install Xcode CLT (Command Line Tools):
1. Open Terminal
2. Enter the following command: xcode-select --install

### To install Homebrew
1. Open Terminal
2. Enter the following command: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### To install Tesseract
1. Open Terminal
2. Enter the following command: brew install tesseract

## What's next
### KNOWN ISSUES:
* Scanning for JPG images only works with images ending in ".jpg", whereas images ending in ".jpeg" are not processed.
### TO DO:
* Automate installation of Tesseract
