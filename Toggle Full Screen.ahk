/*
 * AHK Toggle Full Screen
 * (Based on BoD winsupermaximize v1.01)
 *
 * V1
 */

#SingleInstance ignore

/*
 * Tray menu.
 */
Menu, tray, NoStandard
Menu, tray, Add, Toggle full screen window, menuSuperMaximize
Menu, tray, Add, Exit, menuExit
Menu, tray, Default, Toggle full screen window

/*
 * Bind to Win-F11.
 */
#F11::superMaximize()

menuExit:
	ExitApp
return

menuSuperMaximize:
	Send !{Tab}
	Sleep, 200
	superMaximize()
return


/*
 * Maximizes the currently active window.
 */
superMaximize() {
	global

	WinActive("A")
	WinGet, winId, ID

	if (isSuperMaximized_%winId% = 1) {
		; already supermaximized: we restore the window
		WinMove, , , orig_%winId%_x, orig_%winId%_y, orig_%winId%_width, orig_%winId%_height
		if (orig_%winId%_wasMaximized) {
			WinMaximize
		}
		isSuperMaximized_%winId% = 0
	} else {
		; not supermaximized: we supermaximize it
		WinGet, orig_%winId%_wasMaximized, MinMax
		if (orig_%winId%_wasMaximized = 1) {
			WinRestore
		}
		WinGetPos, orig_%winId%_x, orig_%winId%_y, orig_%winId%_width, orig_%winId%_height ; store the old bounds
		SysGet, MWA, MonitorWorkArea
		WinMove, , , %MWALeft%, %MWATop%, %MWARight%, %MWABottom%
		isSuperMaximized_%winId% = 1
	}
}
