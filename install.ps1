# Define la ruta de configuración de Neovim
$NvimConfigDir = "$env:LOCALAPPDATA\nvim"
$SourceDir = $PSScriptRoot

Write-Host "🚀 Iniciando la instalación de idleNvim para Windows..."

# Verifica si Neovim está instalado
$nvimPath = Get-Command nvim -ErrorAction SilentlyContinue
if (-not $nvimPath) {
    Write-Host "❌ Neovim no está instalado o no se encuentra en el PATH. Por favor, instálalo primero."
    exit 1
}

# Crea una copia de seguridad de la configuración existente
if (Test-Path $NvimConfigDir) {
    $BackupDir = "$NvimConfigDir.bak_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')"
    Write-Host "📦 Realizando copia de seguridad de la configuración existente en $BackupDir..."
    Move-Item -Path $NvimConfigDir -Destination $BackupDir
}

# Copia los archivos de configuración
Write-Host "📋 Copiando los archivos de configuración a $NvimConfigDir..."
New-Item -ItemType Directory -Force -Path $NvimConfigDir | Out-Null
Copy-Item -Path "$SourceDir\init.lua" -Destination $NvimConfigDir -Recurse
Copy-Item -Path "$SourceDir\lua" -Destination $NvimConfigDir -Recurse

if ($?) {
    Write-Host ""
    Write-Host "✅ ¡La configuración de idleNvim se ha instalado correctamente!"
    Write-Host "✨ Abre Neovim (ejecuta 'nvim') para que los plugins se instalen automáticamente."
} else {
    Write-Host "❌ La instalación ha fallado. Por favor, revisa los errores."
}

# Mantiene la ventana abierta para ver el mensaje
Read-Host "Presiona Enter para salir"
