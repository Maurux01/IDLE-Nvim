@echo off
setlocal

REM Check for Chocolatey
where choco >nul 2>nul
if %errorlevel% neq 0 (
    echo Chocolatey not found. Please install Chocolatey from https://chocolatey.org/install and re-run this script.
    pause
    exit /b 1
)

REM Install dependencies
choco install -y neovim git curl unzip

REM Create config folder if not exists
if not exist "%USERPROFILE%\.config\nvim" mkdir "%USERPROFILE%\.config\nvim"

REM Copy init.lua
copy /Y init.lua "%USERPROFILE%\.config\nvim\init.lua"
echo init.lua copied to %%USERPROFILE%%\.config\nvim\init.lua

echo Done! Open Neovim and run :Lazy sync to install all plugins.
pause 