@echo off
cls
cd ..
rmdir /s /q Requirements\ 
del MetaTools.bat
cd Updater
git clone https://github.com/NikonUK/MetaTools ..\latest
cd ..
move "%cd%\latest\MetaTools.bat" "%cd%"
move "%cd%\latest\Requirements" "%cd%"
rmdir /s /q "%cd%\latest\"

cls
echo Successfully Updated!
echo returning to menu...
timeout 5
call MetaTools.bat
exit
