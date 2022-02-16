@echo off
echo this script used for shutdown after check if your app is not running or after time xxx min
echo how you do for shutdown your pc
echo 1- After a specified time
echo 2- After completing the tasks of the specified program
set /p id="Enter choice: "
echo %id%
if %id% EQU 1 (set /p ti="Enter time in min : "&&set /a "timemin=ti*60"&&echo The device will turn off after the specified time &&timeout 10&& goto shutdown ) else ( set /p app="enter name application complete like Viber.exe : ")
echo %app%
:loop
tasklist /fi "USERNAME ne NT AUTHORITY\SYSTEM" /fi "STATUS eq running" | find  "%app%"
if "%ERRORLEVEL%"=="0" (cls &&echo %app% is running&&goto loop) else (cls&&echo pc shutdown after 20s &&echo timeout 20 &&shutdown /s /t 10 goto end) 
:shutdown 
shutdown /s /t %timemin%
:end
echo there is no error :
