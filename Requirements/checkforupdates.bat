@echo off

if "%update%"=="yes" goto updateOption

:startupCheck
curl.exe -s -o "sc.txt" https://api.github.com/repos/NikonUK/MetaTools/releases
findstr "tag_name" sc.txt > list_of_ver.txt
fc list_of_ver.txt list_of_ver_fromdate.txt > nul
if errorlevel 1 goto matchFail

::delete temp files
del list_of_ver.txt
del sc.txt
goto continueSetup
pause

:matchFail
cls
echo [7mThere is a new version of MetaTools available.
echo Do you want to update? (This is automatic)[0m

::options
cmdMenuSel f870 "Yes" "No"
if "%errorlevel%"=="1" (
    ::delete temp files
    del list_of_ver.txt
    del sc.txt
    cd ..
    cd Updater
    autoupdate.bat
    exit
)
if "%errorlevel%"=="2" (
    ::delete temp files
    del list_of_ver.txt
    del sc.txt
    goto continueSetup
)

:updateOption
curl.exe -s -o "sc.txt" https://api.github.com/repos/NikonUK/MetaTools/releases
findstr "tag_name" sc.txt > list_of_ver.txt
fc list_of_ver.txt list_of_ver_fromdate.txt > nul
if errorlevel 1 goto updateAvailable

cls
echo You are using the latest version of MetaTools!
del list_of_ver.txt
del sc.txt
pause 
exit /b

:updateAvailable
cls
echo [7mThere is a new version of MetaTools available.
echo Do you want to update? (This is automatic)[0m

::options
cmdMenuSel f870 "Yes" "No"
if "%errorlevel%"=="1" (
    del list_of_ver.txt
    del sc.txt
    cd ..
    cd Updater
    autoupdate.bat
    exit
)

if "%errorlevel%"=="2" (
    ::delete temp files
    del list_of_ver.txt
    del sc.txt
    goto MainMenu
)

set update = none 