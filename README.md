# Toggle Full Screen
An AutoHotkey script, optionally compiled as an executable using Ahk2Exe 1.1.28, to expand the current window to fill the screen (NOT maximized). This functionality used to be available in Windows 7 and below when selecting the "show windows stacked" or "show windows side by side" commands from the taskbar when you only had a single window/application that was not minimized, but in Windows 10 these taskbar commands are erratic or just plain broken depending on your settings. Note that in Windows 10 you'll get what appears to be some empty space on the sides and bottom of the window, that's because unless windows are "snapped" the window border is actually invisible. Version 1.1 adjusts for this border padding, and also adds the ability to stack two windows side-by-side without using Windows 10's snap feature.

The function is bound to Win-F11 by default, but as it's designed to replicate the taskbar feature the intended use is to just double click the icon to perform the toggle, so you should set Toggle Full Screen.exe to always appear on your taskbar for ease of use.

Note 1.2 is an alternate not a revision, it removes the keybind and restore feature and adds top and bottom stacking. I've been using this for years and forgot to upload it!

As this is a standard AutoHotkey script you may wish to add other AutoHotkey commands as needed and compile your own version. Based on code from winsupermaximize, which is public domain: https://code.google.com/archive/p/winsupermaximize/
