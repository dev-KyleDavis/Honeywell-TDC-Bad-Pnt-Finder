@echo off

setlocal EnableDelayedExpansion

echo ******************************************************
echo **    WARNING: This program should run on the       **
echo **    Primary server. Running this program on a     **
echo **    secondary server will result in errors.       **
echo ******************************************************
echo.

set "temp_dir=%~d0\temp"

set /p "server_name=Enter Server Name: "

set "pnt_file_path=%temp_dir%\tpsdel_%server_name%.pnt"
set "txt_file_path=%temp_dir%\tpsdel_%server_name%.txt"

if exist "!pnt_file_path!" (
  set /p "overwrite=File already exists. Overwrite (y/n)? "
  if /i "!overwrite!" neq "y" (
    echo Program terminated.
    goto end
  )
)

echo Creating files...
timeout /t 2 /nobreak > nul
echo.

if not exist "%temp_dir%" mkdir "%temp_dir%"
type nul > "!pnt_file_path!"
type nul > "!txt_file_path!"

set /p "search_points=Search for unused points (y/n)? "

if /i "%search_points%" == "y" (
  echo Searching for unused points...
  cd /d "%temp_dir%"
  dspprime -sd tpsdel_%server_name%.pnt 2>&1
  if errorlevel 1 (
    echo Command failed with exit code %errorlevel%.
  )
  echo.
  echo Done.
) else (
  echo Program terminated.
)

:end
pause