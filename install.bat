@echo off
setlocal

REM Verificar si Chocolatey está instalado
where choco >nul 2>nul
if %errorlevel% neq 0 (
    echo No se encontro Chocolatey. Por favor instala Chocolatey desde https://chocolatey.org/install y vuelve a ejecutar este script.
    pause
    exit /b 1
)

REM Instalar dependencias
choco install -y neovim python w3m git curl

REM Instalar packer.nvim
set NVIM_DATA_DIR=%USERPROFILE%\.local\share\nvim\site\pack\packer\start
if not exist "%NVIM_DATA_DIR%\packer.nvim" (
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "%NVIM_DATA_DIR%\packer.nvim"
)

REM Crear config si no existe
if not exist "%USERPROFILE%\.config\nvim" mkdir "%USERPROFILE%\.config\nvim"

REM Copiar init.lua si existe en el repo
if exist init.lua copy /Y init.lua "%USERPROFILE%\.config\nvim\init.lua"

echo Listo. Abre Neovim y ejecuta :PackerSync para instalar los plugins.
pause 