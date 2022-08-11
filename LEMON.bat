@echo off
TITLE Lemon
::code to detect Neos dir, ask for dir if not detected ||| Step 1 done. Write user prompt later :DIRprompt
::mkdir to generate required NML_lib director if no present || Done
::Downlod latest DLLs for both 0harmony and NML.dll ||| Done
::Generate a batch file to execute modded Neos ||| substituted for a real shortcut
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
echo oLink.WorkingDirectory = %cd%
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
ECHO Shortcut at Desktop generated.
pause
del CreateShortcut.vbs
