/*
 * AHK Toggle Full Screen 1.2
 * (Based on BoD winsupermaximize v1.01)
 * https://github.com/xtcrefugee/ToggleFullScreen
 */
#Persistent
#SingleInstance Ignore

Menu, tray, NoStandard
Menu, tray, Add, Full screen window, menuSuperMaximize
Menu, tray, Add ; separator
Menu, tray, Add, Stack window left, menuStackLeft
Menu, tray, Add, Stack window right, menuStackRight
Menu, tray, Add ; separator
Menu, tray, Add, Stack window top, menuStackTop
Menu, tray, Add, Stack window bottom, menuStackBottom
Menu, tray, Add ; separator
Menu, tray, Add, Exit, menuExit
Menu, tray, Default, Full screen window
return

menuExit:
	ExitApp
return

menuSuperMaximize:
	Send !{Tab}
	Sleep, 200
	superMaximize(0)
return

menuStackLeft:
	Send !{Tab}
	Sleep, 200
	superMaximize(1)
return

menuStackRight:
	Send !{Tab}
	Sleep, 200
	superMaximize(2)
return

menuStackTop:
	Send !{Tab}
	Sleep, 200
	superMaximize(3)
return

menuStackBottom:
	Send !{Tab}
	Sleep, 200
	superMaximize(4)
return

superMaximize(stackType) {
	global
	WinActive("A")
	SysGet, MWA, MonitorWorkArea
	SysGet, windowPadding, 32, 33
	; there's an additional 1px border on snapped windows,
	; uncomment the line below if you want that here
	;windowPadding--
	; set below to 1 if you don't want the top 1px frame
	; i.e. on Chrome windows
	topWindowBorder := 1
	if (stackType = 0) {
		; full screen
		windowX := MWALeft-windowPadding
		windowY := MWATop-topWindowBorder
		windowW := MWARight+(windowPadding*2)
		windowH := MWABottom+windowPadding+topWindowBorder
	} else if (stackType = 1) {
		; stacked left
		windowX := MWALeft-windowPadding
		windowY := MWATop-topWindowBorder
		windowW := (MWARight//2)+(windowPadding*2)
		windowH := MWABottom+windowPadding+topWindowBorder
	} else if (stackType = 3) {
		; stacked top
		windowX := MWALeft-windowPadding
		windowY := MWATop-topWindowBorder
		windowW := MWARight+(windowPadding*2)
		windowH := (MWABottom//2)+windowPadding+topWindowBorder
	} else if (stackType = 4) {
		; stacked bottom
		windowX := MWALeft-windowPadding
		windowY := MWABottom//2
		windowW := MWARight+(windowPadding*2)
		windowH := (MWABottom//2)+windowPadding
	} else {
		; stacked right
		windowX := (MWARight//2)-windowPadding
		windowY := MWATop-topWindowBorder
		windowW := (MWARight//2)+(windowPadding*2)
		windowH := MWABottom+windowPadding+topWindowBorder
	}
	WinRestore
	WinMove, , , %windowX%, %windowY%, %windowW%, %windowH%
}
