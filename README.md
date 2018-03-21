# MITS (Make Image Text Searchable)
### Find images by the text INSIDE them using Spotlight + MITS

[![Watch intro video on YouTube](https://i.ytimg.com/vi/qx3Hcr5ATgI/hqdefault.jpg)](https://www.youtube.com/watch?v=qx3Hcr5ATgI)

[Watch intro video on YouTube](https://www.youtube.com/watch?v=qx3Hcr5ATgI)

MITS is a tool that makes images searchable by the text inside them. It uses OCR (via [Tesseract](https://github.com/tesseract-ocr/tesseract)) to automatically read the text in an image and adds it to the Comments for that file, which allows it to be found by Spotlight.




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
* Improve error handling
* Automate installation of Tesseract
