/*
 * AHK Toggle Full Screen
 * (Based on BoD winsupermaximize v1.01)
 *
 * V1.1a
 */
#Persistent
#SingleInstance Ignore

/*
 * Tray menu
 */
Menu, tray, NoStandard
Menu, tray, Add, Toggle full screen window, menuSuperMaximize
Menu, tray, Add, Stack window left, menuStackLeft
Menu, tray, Add, Stack window right, menuStackRight
Menu, tray, Add, Exit, menuExit
Menu, tray, Default, Toggle full screen window

/*
 * Bind keys
 */
#F11::superMaximize(0)

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


/*
 * Maximizes or stacks the currently active window
 */
superMaximize(stackType) {
	global
	WinActive("A")
	WinGet, winId, ID

	if (isSuperMaximized_%winId% = 1) {
		; already supermaximized: restore the window
		WinMove, , , orig_%winId%_x, orig_%winId%_y, orig_%winId%_width, orig_%winId%_height
		if (orig_%winId%_wasMaximized) {
			WinMaximize
		}
		isSuperMaximized_%winId% = 0
	} else {
		; not supermaximized: supermaximize it
		WinGet, orig_%winId%_wasMaximized, MinMax
		if (orig_%winId%_wasMaximized = 1) {
			WinRestore
		}
		WinGetPos, orig_%winId%_x, orig_%winId%_y, orig_%winId%_width, orig_%winId%_height ; store the old bounds
		SysGet, MWA, MonitorWorkArea
		SysGet, windowPadding, 32, 33
		; set below to 1 if you don't want the top 1px border
		; i.e. on Chrome windows, else set to 0
		topWindowBorder := 1
		if (stackType = 0) {
			; full screen
			windowX := MWALeft-windowPadding
			windowW := MWARight+(windowPadding*2)
		} else if (stackType = 1) {
			; stacked left
			windowX := MWALeft-windowPadding
			windowW := (MWARight//2)+(windowPadding*2)
		} else {
			; stacked right
			windowX := (MWARight//2)-windowPadding
			windowW := (MWARight//2)+(windowPadding*2)
		}
		windowY := MWATop-topWindowBorder
		windowH := MWABottom+windowPadding+topWindowBorder
		WinMove, , , %windowX%, %windowY%, %windowW%, %windowH%
		isSuperMaximized_%winId% = 1
	}
}
