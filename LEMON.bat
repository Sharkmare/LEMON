@echo off
TITLE Lemon
IF exist "Neos.exe" ( GOTO :Detected)
::If Neos is in our current directory, we do not need to search further
IF exist "C:\Neos\" ( cd "C:\Neos\" && GOTO :Detected)
IF exist "C:\Program Files (x86)\Steam\steamapps\common\NeosVR\" ( cd "C:\Program Files (x86)\Steam\steamapps\common\NeosVR\" && GOTO :Detected)
IF exist "C:\Program Files\Steam\steamapps\common\NeosVR\" ( cd "C:\Program Files\Steam\steamapps\common\NeosVR\" && GOTO :Detected)
ECHO ENOENT Neos not detected
pause
exit
:Detected
ECHO FOUND %cd%
IF exist "nml_mods" ( echo Previous NML Mods folder detected) else ( mkdir "nml_mods" && echo Generating NML Mods folder)
IF exist "nml_config" ( echo Previous NML Config folder detected) else ( mkdir "nml_config" && echo Generating NML Config folder)
IF exist "nml_libs" ( echo Previous NML Lib folder detected) else ( mkdir "nml_libs" && echo Generating NML Library folder)
cd "nml_libs"
bitsadmin /transfer Harmony "https://github.com/neos-modding-group/NeosModLoader/releases/download/1.9.1/0Harmony.dll" "%cd%/0harmony.dll"
cd ../Libraries/
bitsadmin /transfer NML "https://github.com/neos-modding-group/NeosModLoader/releases/latest/download/NeosModLoader.dll" "%cd%/NeosModLoader.dll"
ECHO Mod Loader and Harmony installed
IF NOT exist "%HOMEDRIVE%%HOMEPATH%\Desktop\Modded Neos.lnk" ( GOTO :Shortcut)
pause
exit
:DIRprompt

exit
:Shortcut
cd ..
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\Modded Neos.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = ("%cd%/NEOS.exe") >> CreateShortcut.vbs
echo oLink.Arguments = "-LoadAssembly Libraries\NeosModLoader.dll" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%cd%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
ECHO Shortcut at Desktop generated.
pause
del CreateShortcut.vbs
