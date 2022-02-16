@echo off
echo this script used for shutdown after check if your app is not running or after time xxx min
echo how you do for shutdown your pc
echo 1- After a specified time
echo 2- After completing the tasks of the specified program
set /p id="Enter choice: "
echo %id%
if %id% EQU 1 (set /p time="Enter time in min : "&&set /a t=%time%*60&&echo Pc shutdown after %t% && shutdown /s /t %t% ) else set /p app="enter name application complete like Viber.exe : "
echo %app%
:loop
tasklist /fi "USERNAME ne NT AUTHORITY\SYSTEM" /fi "STATUS eq running" | find  "%app%"
if "%ERRORLEVEL%"=="0" (cls &&echo %app% is running&&goto loop) else (cls&&echo pc shutdown after 10s &&shutdown /s /t 10 ) 



