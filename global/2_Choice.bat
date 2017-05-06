@echo off
::version specific code
echo "Choose Captivate version to work on: 6/7/8/9"
set/p cho=Choice:
if %cho% equ 6 goto cp6
if %cho% equ 7 goto cp7
if %cho% equ 8 goto cp8
if %cho% equ 9 goto cp9

:cp6
call ..\Cp6\RunCp6.bat
goto end 

:cp7
call ..\Cp7\RunCp7.bat
goto end 

:cp8
call ..\Cp8\RunCp8.bat
goto end 

:cp9
call ..\Cp9\RunCp9.bat
goto end 

:end
pause