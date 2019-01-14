#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=NFSU_icon.ico
#AutoIt3Wrapper_Outfile=NFSU_Launcher.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UPX_Parameters=-9 --strip-relocs=0 --compress-exports=0 --compress-icons=0
#AutoIt3Wrapper_Res_Description=Need for Speed™ Underground Widescreen Launcher
#AutoIt3Wrapper_Res_Fileversion=1.0.0.47
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.47
#AutoIt3Wrapper_Res_LegalCopyright=2016, SalFisher47
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Res_SaveSource=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Region ;**** Pragma Compile ****
#pragma compile(AutoItExecuteAllowed, true)
#pragma compile(Compression, 9)
#pragma compile(Compatibility, vista, win7, win8, win81, win10)
#pragma compile(InputBoxRes, true)
#pragma compile(CompanyName, 'SalFisher47')
#pragma compile(FileDescription, 'Need for Speed™ Underground Widescreen Launcher')
#pragma compile(FileVersion, 1.0.0.47)
#pragma compile(InternalName, 'Need for Speed™ Underground Widescreen Launcher')
#pragma compile(LegalCopyright, '2016, SalFisher47')
#pragma compile(OriginalFilename, NFSU_Launcher.exe)
#pragma compile(ProductName, 'Need for Speed™ Underground Widescreen Launcher')
#pragma compile(ProductVersion, 1.0.0.47)
#EndRegion ;**** Pragma Compile ****
; === UniCrack Installer.au3 =======================================================================================================
; Title .........: Need for Speed™ Underground Launcher
; Version .......: 1.0.0.47
; AutoIt Version : 3.3.14.5
; Language ......: English
; Description ...: Need for Speed™ Underground Widescreen Launcher
;				   - based on ThirteenAG's widescreen fix
; Author(s) .....: SalFisher47
; Last Modified .: December 26, 2016
; ==================================================================================================================================
$exe32bit = @ScriptDir & "\speed.exe"
$widescreen_fix_ini = @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.ini"
$widescreen_fix_asi = @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.asi"
$iniResX = IniRead($widescreen_fix_ini, "MAIN", "ResX", 0)
$iniResY = IniRead($widescreen_fix_ini, "MAIN", "ResY", 0)
If ($iniResX == 0) And ($iniResY == 0) Then
	$iniResX = @DesktopWidth
	$iniResY = @DesktopHeight
ElseIf ($iniResX == 0) Or ($iniResY == 0) Then
	IniWrite($widescreen_fix_ini, "MAIN", "ResX", " 0")
	IniWrite($widescreen_fix_ini, "MAIN", "ResY", " 0")
	$iniResX = @DesktopWidth
	$iniResY = @DesktopHeight
EndIf
$desktopX = $iniResX
$desktopY = $iniResY
$desktopRatio = Round($desktopX/$desktopY, 2)
$HUD_fix = IniRead($widescreen_fix_ini, "MAIN", "FixHUD", "")
$HUD_widescreen = IniRead($widescreen_fix_ini, "MAIN", "HUDWidescreenMode", "")
#cs
$cracked = IniRead($widescreen_fix_ini, "EXE", "cracked", "0")
DirCreate(@AppDataCommonDir & "\SalFisher47\WidescreenLauncher")
FileInstall("NFSU_ProgramData.ini", @AppDataCommonDir & "\SalFisher47\WidescreenLauncher\NFSU1.ini", 0)
$cracked_ProgramData = IniRead(@AppDataCommonDir & "\SalFisher47\WidescreenLauncher\NFSU1.ini", "EXE", "cracked", 0)
#ce
If Not FileExists($exe32bit) Then
	MsgBox(16, "Need for Speed™ Underground Launcher", "Executable not found:" & @CRLF & "..\speed.exe")
	Exit
EndIf
Switch $desktopRatio
	Case 1.33   ; 4:3 aspect ratio, 1024x768
		If not FileExists($widescreen_fix_ini) Then
			DirCreate(@ScriptDir & "\scripts")
			FileInstall("dinput8.dll", @ScriptDir & "\dinput8.dll", 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.ini", $widescreen_fix_ini, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.asi", $widescreen_fix_asi, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.dat", @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.dat", 0)
			FileInstall("scripts\XBOXFrontB.bun", @ScriptDir & "\scripts\XBOXFrontB.bun", 0)
			FileInstall("scripts\XBOXGlobalB.bun", @ScriptDir & "\scripts\XBOXGlobalB.bun", 0)
		EndIf
		;_Cracked()
		$HUD_fix_new = IniRead($widescreen_fix_ini, "HUD", "4x3_HUD_fix", "0")
		$HUD_widescreen_new = IniRead($widescreen_fix_ini, "HUD", "4x3_HUD_widescreen", "0")
		If $HUD_fix <> $HUD_fix_new Then IniWrite($widescreen_fix_ini, "MAIN", "FixHUD", " " & $HUD_fix_new)
		If $HUD_widescreen <> $HUD_widescreen_new Then IniWrite($widescreen_fix_ini, "MAIN", "HUDWidescreenMode", " " & $HUD_widescreen_new)
		ShellExecute($exe32bit, " " & $CmdLineRaw, @ScriptDir)
	Case 1.25   ; 5:4 aspect ratio, 1280x1024
		If not FileExists($widescreen_fix_ini) Then
			DirCreate(@ScriptDir & "\scripts")
			FileInstall("dinput8.dll", @ScriptDir & "\dinput8.dll", 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.ini", $widescreen_fix_ini, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.asi", $widescreen_fix_asi, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.dat", @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.dat", 0)
			FileInstall("scripts\XBOXFrontB.bun", @ScriptDir & "\scripts\XBOXFrontB.bun", 0)
			FileInstall("scripts\XBOXGlobalB.bun", @ScriptDir & "\scripts\XBOXGlobalB.bun", 0)
		EndIf
		;_Cracked()
		$HUD_fix_new = IniRead($widescreen_fix_ini, "HUD", "5x4_HUD_fix", "0")
		$HUD_widescreen_new = IniRead($widescreen_fix_ini, "HUD", "5x4_HUD_widescreen", "0")
		If $HUD_fix <> $HUD_fix_new Then IniWrite($widescreen_fix_ini, "MAIN", "FixHUD", " " & $HUD_fix_new)
		If $HUD_widescreen <> $HUD_widescreen_new Then IniWrite($widescreen_fix_ini, "MAIN", "HUDWidescreenMode", " " & $HUD_widescreen_new)
		ShellExecute($exe32bit, " " & $CmdLineRaw, @ScriptDir)
	Case 1.77   ; 16:9 aspect ratio, 1360x768
		If not FileExists($widescreen_fix_ini) Then
			DirCreate(@ScriptDir & "\scripts")
			FileInstall("dinput8.dll", @ScriptDir & "\dinput8.dll", 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.ini", $widescreen_fix_ini, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.asi", $widescreen_fix_asi, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.dat", @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.dat", 0)
			FileInstall("scripts\XBOXFrontB.bun", @ScriptDir & "\scripts\XBOXFrontB.bun", 0)
			FileInstall("scripts\XBOXGlobalB.bun", @ScriptDir & "\scripts\XBOXGlobalB.bun", 0)
		EndIf
		;_Cracked()
		$HUD_fix_new = IniRead($widescreen_fix_ini, "HUD", "16x9_HUD_fix", "1")
		$HUD_widescreen_new = IniRead($widescreen_fix_ini, "HUD", "16x9_HUD_widescreen", "1")
		If $HUD_fix <> $HUD_fix_new Then IniWrite($widescreen_fix_ini, "MAIN", "FixHUD", " " & $HUD_fix_new)
		If $HUD_widescreen <> $HUD_widescreen_new Then IniWrite($widescreen_fix_ini, "MAIN", "HUDWidescreenMode", " " & $HUD_widescreen_new)
		ShellExecute($exe32bit, " " & $CmdLineRaw, @ScriptDir)
	Case 1.78   ; 16:9 aspect ratio, 1366x768
		If not FileExists($widescreen_fix_ini) Then
			DirCreate(@ScriptDir & "\scripts")
			FileInstall("dinput8.dll", @ScriptDir & "\dinput8.dll", 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.ini", $widescreen_fix_ini, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.asi", $widescreen_fix_asi, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.dat", @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.dat", 0)
			FileInstall("scripts\XBOXFrontB.bun", @ScriptDir & "\scripts\XBOXFrontB.bun", 0)
			FileInstall("scripts\XBOXGlobalB.bun", @ScriptDir & "\scripts\XBOXGlobalB.bun", 0)
		EndIf
		;_Cracked()
		$HUD_fix_new = IniRead($widescreen_fix_ini, "HUD", "16x9_HUD_fix", "1")
		$HUD_widescreen_new = IniRead($widescreen_fix_ini, "HUD", "16x9_HUD_widescreen", "1")
		If $HUD_fix <> $HUD_fix_new Then IniWrite($widescreen_fix_ini, "MAIN", "FixHUD", " " & $HUD_fix_new)
		If $HUD_widescreen <> $HUD_widescreen_new Then IniWrite($widescreen_fix_ini, "MAIN", "HUDWidescreenMode", " " & $HUD_widescreen_new)
		ShellExecute($exe32bit, " " & $CmdLineRaw, @ScriptDir)
	Case 1.60   ; 16:10 aspect ratio, 1440x900
		If not FileExists($widescreen_fix_ini) Then
			DirCreate(@ScriptDir & "\scripts")
			FileInstall("dinput8.dll", @ScriptDir & "\dinput8.dll", 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.ini", $widescreen_fix_ini, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.asi", $widescreen_fix_asi, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.dat", @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.dat", 0)
			FileInstall("scripts\XBOXFrontB.bun", @ScriptDir & "\scripts\XBOXFrontB.bun", 0)
			FileInstall("scripts\XBOXGlobalB.bun", @ScriptDir & "\scripts\XBOXGlobalB.bun", 0)
		EndIf
		;_Cracked()
		$HUD_fix_new = IniRead($widescreen_fix_ini, "HUD", "16x10_HUD_fix", "0")
		$HUD_widescreen_new = IniRead($widescreen_fix_ini, "HUD", "16x10_HUD_widescreen", "0")
		If $HUD_fix <> $HUD_fix_new Then IniWrite($widescreen_fix_ini, "MAIN", "FixHUD", " " & $HUD_fix_new)
		If $HUD_widescreen <> $HUD_widescreen_new Then IniWrite($widescreen_fix_ini, "MAIN", "HUDWidescreenMode", " " & $HUD_widescreen_new)
		ShellExecute($exe32bit, " " & $CmdLineRaw, @ScriptDir)
	Case Else   ; other aspect ratio
		If not FileExists($widescreen_fix_ini) Then
			DirCreate(@ScriptDir & "\scripts")
			FileInstall("dinput8.dll", @ScriptDir & "\dinput8.dll", 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.ini", $widescreen_fix_ini, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.asi", $widescreen_fix_asi, 0)
			FileInstall("scripts\NFSUnderground.WidescreenFix.dat", @ScriptDir & "\scripts\NFSUnderground.WidescreenFix.dat", 0)
			FileInstall("scripts\XBOXFrontB.bun", @ScriptDir & "\scripts\XBOXFrontB.bun", 0)
			FileInstall("scripts\XBOXGlobalB.bun", @ScriptDir & "\scripts\XBOXGlobalB.bun", 0)
		EndIf
		;_Cracked()
		$HUD_fix_new = IniRead($widescreen_fix_ini, "HUD", "other_HUD_fix", "1")
		$HUD_widescreen_new = IniRead($widescreen_fix_ini, "HUD", "other_HUD_widescreen", "1")
		If $HUD_fix <> $HUD_fix_new Then IniWrite($widescreen_fix_ini, "MAIN", "FixHUD", " " & $HUD_fix_new)
		If $HUD_widescreen <> $HUD_widescreen_new Then IniWrite($widescreen_fix_ini, "MAIN", "HUDWidescreenMode", " " & $HUD_widescreen_new)
		ShellExecute($exe32bit, " " & $CmdLineRaw, @ScriptDir)
EndSwitch

#cs
Func _Cracked()
	If $cracked == 1 Then
		If $cracked_ProgramData == 1 Then
			;ShellExecute($exe32bit, " " & $CmdLineRaw, @ScriptDir)
		Else
			FileInstall("Speed.exe", @ScriptDir & "\Speed.exe", 1)
			IniWrite($widescreen_fix_ini, "EXE", "cracked", " 1")
			IniWrite(@AppDataCommonDir & "\SalFisher47\WidescreenLauncher\NFSU1.ini", "EXE", "cracked", " 1")
		EndIf
	Else
		FileInstall("Speed.exe", @ScriptDir & "\Speed.exe", 1)
		IniWrite($widescreen_fix_ini, "EXE", "cracked", " 1")
		IniWrite(@AppDataCommonDir & "\SalFisher47\WidescreenLauncher\NFSU1.ini", "EXE", "cracked", " 1")
	EndIf
EndFunc
#ce