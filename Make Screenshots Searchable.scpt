--Make Screenshots Searchable v1.0b

--Requirements:
--macOS 10.10 or higher
--Xcode Command Line Tools
--Homebrew
--Tesseract

--To install Xcode CLT (Command Line Tools):
--1. Open Terminal
--2. Enter the following command: xcode-select --install

--To install Homebrew
--1. Open Terminal
--2. Enter the following command: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

--To install Tesseract
--1. Open Terminal
--2. Enter the following command: brew install tesseract


--TO DO
--Automate installation of Tesseract

--Prompt user for which images to scan
choose from list {"Process PNG images", "Process JPG images"} with title "Select a filetype" with prompt "First, select the type of image you want to process. We'll select the folder to scan next." default items "Process PNG images" OK button name "Continue" cancel button name "Cancel" multiple selections allowed "false" empty selection allowed "false"

-- Grab the result and set a variable
set fileTypeAnswer to result as text
if fileTypeAnswer contains "PNG" then
	set scanFileType to "png"
else if fileTypeAnswer contains "JPG" then
	set scanFileType to "jpg"
else
	--If nothing is selected, quit the script. Catches when "Cancel" is clicked.
	return
end if

--Select a folder to process
tell application "Finder"
	set theRootFolder to choose folder "Choose Folder Location" with prompt "Choose a folder to process"
end tell

-- Create the empty variables
set the_comment to ""
set a to 0
set progress total steps to 0
set progress completed steps to 0
set progress description to "Processing images..."
set progress additional description to "Preparing to process."

tell application "Finder"
	--Find all files of the filetype we're looking for
	set theImages to every file of entire contents of theRootFolder whose name extension is scanFileType
	
	-- Update the initial progress information
	--set theImageCount to length of theImages
	set theImageCount to length of theImages
	set AppleScript's progress total steps to theImageCount
	set AppleScript's progress completed steps to 0
	set AppleScript's progress additional description to "Preparing to process."
	
	repeat with this_file in theImages
		-- Update the progress bar detail
		set AppleScript's progress additional description to "Processing image " & a & " of " & theImageCount
		
		--Bug: Missing space
		--Declare which file is being processed
		set justFilename to this_file as POSIX file
		set AppleScript's progress description to "Processing" & justFilename
		
		-- Store the previous comments to append to later
		set previous_comment to comment of this_file
		
		-- Use Tesseract to process the image
		set this_file to (the POSIX path of (this_file as alias))
		tell application "Terminal"
			try
				set ocrOutput to do shell script "usr/local/bin/tesseract " & quoted form of this_file & " stdout"
				log ocrOutput
			end try
		end tell
		
		set this_file to this_file as POSIX file as alias
		
		try
			--Append the OCR output to the current comments, if any exist
			set comment of this_file to previous_comment & ocrOutput & return
		end try
		
		-- Increment the progress for the progress bar
		set a to a + 1
		set AppleScript's progress completed steps to a
		
	end repeat
end tell
