@echo off
TITLE Lemon
::code to detect Neos dir, ask for dir if not detected ||| Step 1 done. Write user prompt later :DIRprompt
::mkdir to generate required NML_lib director if no present
::Downlod latest DLLs for both 0harmony and NML.dll
::Generate a batch file to execute modded Neos
IF exist "Neos.exe" ( GOTO :Detected)
::If Neos is in our current directory, we do not need to search further
IF exist "C:\Neos\" ( cd "C:\Neos\" && GOTO :Detected)
IF exist "C:\Program Files (x86)\Steam\steamapps\common\NeosVR\" ( cd "C:\Program Files (x86)\Steam\steamapps\common\NeosVR\" && GOTO :Detected)
IF exist "C:\Program Files\Steam\steamapps\common\NeosVR\" ( cd "C:\Program Files\Steam\steamapps\common\NeosVR\" && GOTO :Detected)
::IF exist "C:\Program Files\" ( cd "C:\Program Files\" && GOTO :Detected)
::the above is for testing of code validity
ECHO ENOENT
pause
exit
:Detected
ECHO FOUND %cd%
pause

:DIRprompt
