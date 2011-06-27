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
Dim $winhandle, $lines, $Title
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
		If _IsPressed(10, $handle) Then
			$Title = WinGetTitle($winhandle)
			ToolTip("Hiding " & $Title, 0, 0, "BossKey Version 1.1", 1)
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
				$Title = InputBox("BossKey", "Window Title?" & @CRLF & "Leave blank to choose current window.")
				GetCurrentWindow($Title)
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
		Exit
	EndIf
WEnd

Func GetCurrentWindow($Title = "")
	Local $WindowHandle, $num
	If $Title = "" Then
		ToolTip("Select the window you want to hide NOW.", 0, 0)
		$Title = WinGetTitle("")
		WinWaitNotActive($Title)
		ToolTip("Wait...", 0, 0)
		Sleep(750)
		$WindowHandle = WinGetHandle("")
		$Title = WinGetTitle("")
		If (@error > 0) Then
			ToolTip("Fail.", 0, 0, "Window does not exist.", 3, 0)
		Else
			ConsoleWrite("Window obtained." & @CRLF & "Title: " & $Title & @CRLF & "Handle: " & $WindowHandle & @CRLF)
		EndIf
	Else
		If StringInStr($Title, "0x") Then
			$Title = $WindowHandle
		Else
			Sleep(2000)
			$WindowHandle = WinGetHandle($Title)
			If @error > 0 Then
				$WindowHandle = $num
				ToolTip("Fail.", 0, 0, "Window does not exist.", 3, 0)
			Else
				ConsoleWrite("Window obtained." & @CRLF & "Title: " & $Title & @CRLF & "Handle: " & $WindowHandle & @CRLF)
			EndIf
		EndIf
	EndIf
	Return $WindowHandle
	Sleep(1250)
EndFunc   ;==>GetCurrentWindow

; y International ;
; and             ;
; RobCraft.dre.am ;
; macweirdo ftw!  ;
; lololololololol ;