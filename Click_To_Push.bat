@echo off
setlocal

REM Get today's date in format 29-12-2024 and time in format 14-53
for /f "tokens=2 delims==" %%i in ('"wmic os get localdatetime /value"') do set datetime=%%i
set date=%datetime:~6,2%-%datetime:~4,2%-%datetime:~0,4%
set time=%datetime:~8,2%-%datetime:~10,2%

REM Define the commit message
set "commit_message=%date% %time%"

REM Execute git commands
git add .
git commit -m "%commit_message%"
git push --set-upstream origin master

REM Pause to display output
pause
endlocal
