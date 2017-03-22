#!/bin/sh

echo '
on run argv
	if length of argv is equal to 0 then
		set command to ""
	else
		set command to item 1 of argv
	end if

	runSimple(command)
end run

on runSimple(command)
	if application "Terminal" is running then
		tell application "Terminal"
			activate
			do script (command)
		end tell
	else
		tell application "Terminal"
			activate
			do script (command)
			close the front window
		end tell
	end if
end runSimple
' | osascript - "$@" > /dev/null
