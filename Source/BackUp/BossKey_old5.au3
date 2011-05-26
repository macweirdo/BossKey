#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_File_Add=strings.dat
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Obfuscator=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;AutoItSetOption("WinTitleMatchMode",
#NoTrayIcon
#include <File.au3>
#include <Misc.au3>
$handle = DllOpen("user32.dll")
Dim $check, $title, $num, $winhandle, $lines

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

If _IsPressed("1B", $handle) Then
	$title = InputBox("BossKey", "Window Title?", "Minecraft")
	If $title == "" Then
		Exit
	EndIf
	$winhandle = WinGetHandle($title)
	If @error > 0 Then
		ToolTip("Fail.", 0, 0, "Window does not exist.", 3, 0)
		Sleep(1250)
	EndIf
Else
	ToolTip("Select the window you want to hide now.", 0, 0)
	$title = WinGetTitle("")
	WinWaitNotActive($title)
	ToolTip("Wait...", 0, 0)
	Sleep(2000)
	$winhandle = WinGetHandle("")
	$title = WinGetTitle("")
	If (@error > 0) Or ($title == "") Then
		Exit
	EndIf
EndIf

ToolTip("")

While 1 = 1
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
			If _IsPressed("2E", $handle) Then
				Exit
			EndIf
			If _IsPressed(57, $handle) Then
				$title = InputBox("BossKey", "Window Title?", "Minecraft")
				If $title == "" Then
					Exit
				EndIf
				$winhandle = WinGetHandle($title)
				If @error > 0 Then
					ToolTip("Fail.", 0, 0, "Window does not exist.", 3, 0)
				EndIf
			EndIf
		EndIf
	Else
		ToolTip("")
	EndIf

	If Not WinExists($winhandle) Then
		ToolTip("Window lost! Seppuku!", 0, 0)
		Sleep(1500)
		Exit
	Else

	EndIf
WEnd

; y International
; and
; RobCraft.dre.am