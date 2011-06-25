#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Res_File_Add=strings.dat
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <Misc.au3>
#include <NamedPipes.au3>
#include <ScreenCapture.au3>
$handle = DllOpen("user32.dll")
Dim $winhandle, $lines
Global $check = 1

_Singleton("Bosskey!", 0)
;_NamedPipes_CreateNamedPipe("\\.\pipe\BossKeyPipe", 2, 1, 7)

ToolTip("Just thought you'd like to know.", 0, 0, "Pressing CTRL while BossKey is active will yield a thingy here.", 2)
Sleep(1250)
ToolTip("Just thought you'd like to know.", 0, 0, "Pressing CTRL+SHIFT+DEL closes BossKey", 2)
Sleep(1250)
ToolTip("Just thought you'd like to know.", 0, 0, "CTRL+SHIFT+Q hides whatever you wanted to hide.", 2)
Sleep(1250)

If FileExists("strings.dat") Then
	$num = _FileCountLines("strings.dat")
	$num = Mod(Random(0, $num), $num)
	$num = FileReadLine("strings.dat", $num)
	ToolTip("Copyright y International and RobCraft.dre.am", 0, 0, "BossKey 1.1 | " & $num, 1)
Else
	ToolTip("Copyright y International and RobCraft.dre.am", 0, 0, "BossKey 1.1 | Like a boss!", 1)
EndIf

Sleep(1500)
ToolTip("")

$winhandle = GetCurrentWindow(_IsPressed(57, $handle))

ToolTip("")

While True
	Sleep(75)
	If _IsPressed(11, $handle) Then
		$title = WinGetTitle($winhandle)
		ToolTip("Hiding " & $title, 0, 0, "BossKey Version 1.1", 1)
		If _IsPressed(10, $handle) Then
			If _IsPressed(51, $handle) Then
				If $check == 1 Then
					WinSetState($winhandle, "", @SW_HIDE)
					$check = 0
				Else
					WinSetState($winhandle, "", @SW_SHOW)
					WinActivate($winhandle)
					$check = 1
				EndIf
			EndIf
			If _IsPressed(57, $handle) Then
				$num = $winhandle
				ToolTip("")
				$title = InputBox("BossKey", "Window Title?" & @CRLF & "Leave blank to choose current window.")
				GetCurrentWindow(Execute($title == ""))
			EndIf
			If _IsPressed("2C", $handle) Then
				ToolTip("")
				_ScreenCapture_Capture(@DesktopDir & "\BossKeyScreencap" & @HOUR & @MIN & @SEC & @MON & @MDAY & @YEAR & ".png")
				ConsoleWrite("Capture stored to: " & @DesktopDir & "\BossKeyScreencap" & @HOUR & @MIN & @SEC & @MON & @MDAY & @YEAR & ".png" & @CRLF)
			EndIf
			If _IsPressed("2E", $handle) Then
				Exit
			EndIf
		EndIf
	Else
		ToolTip("")
	EndIf

	If Not WinExists($winhandle) Then
		ToolTip("Window lost! Seppuku!", 0, 0)
		Sleep(1500)
	EndIf
WEnd

Func GetCurrentWindow($Method)
	Local $WindowHandle, $title, $num
	If $Method = 0 Then
		ToolTip("Select the window you want to hide NOW.", 0, 0)
		$title = WinGetTitle("")
		WinWaitNotActive($title)
		ToolTip("Wait...", 0, 0)
		Sleep(750)
		$WindowHandle = WinGetHandle("")
		$title = WinGetTitle("")
		If (@error > 0) Then
			ToolTip("Fail.", 0, 0, "Window does not exist.", 3, 0)
			Sleep(1250)
		EndIf
	Else
		Sleep(2000)
		$WindowHandle = WinGetHandle($title)
		If @error > 0 Then
			ToolTip("Fail.", 0, 0, "Window does not exist.", 3, 0)
			Sleep(1250)
			$WindowHandle = $num
		EndIf
	EndIf
	ConsoleWrite("Window obtained." & @CRLF & "Title: " & $title & @CRLF & "Handle: " & $WindowHandle & @CRLF)
	Return $WindowHandle
EndFunc   ;==>GetCurrentWindow

; y International ;
; and             ;
; RobCraft.dre.am ;
; macweirdo ftw!  ;
; lololololololol ;