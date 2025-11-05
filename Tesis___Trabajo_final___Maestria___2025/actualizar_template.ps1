# Script para actualizar el template oficial UNAL con información actualizada
$ErrorActionPreference = "Stop"

Write-Host "Actualizando template oficial UNAL..." -ForegroundColor Cyan

# Leer contenido
$lines = Get-Content "0000.tex" -Encoding UTF8

# Procesar línea por línea
$output = @()
foreach ($line in $lines) {
    # Actualizar información personal
    $line = $line -replace 'Juan Sebastian Giraldo Duque', 'Luis Antonio Giraldo'
    
    # Actualizar título (buscar la línea específica)
    if ($line -match '\\renewcommand\{\\thesisname\}') {
        $line = '\renewcommand{\thesisname}{Arquitectura de Gateway de Telemetría Edge para Smart Energy con 6LoWPAN, IEEE 802.11ah HaLow Multi-Banda y Procesamiento Inteligente}'
    }
    
    # Actualizar fechas
    $line = $line -replace 'Año entrega', '2025'
    $line = $line -replace 'Fecha entrega', 'Noviembre 2025'
    
    # Actualizar sede y facultad
    $line = $line -replace 'Sede de la Universidad', 'Sede Medellín'
    $line = $line -replace '\\renewcommand\{\\department\}\{Departamento\}', '\renewcommand{\department}{Departamento de Ingeniería Eléctrica y Electrónica}'
    $line = $line -replace '\\renewcommand\{\\faculty\}\{Facultad\}', '\renewcommand{\faculty}{Facultad de Minas}'
    
    # Actualizar título académico
    if ($line -match '\\renewcommand\{\\academictitle\}.*Modalidad') {
        $line = '\renewcommand{\academictitle}{Magíster en Ingeniería - Ingeniería Electrónica}'
    }
    
    # Actualizar capítulos
    $line = $line -replace '\\include\{00HipotesisPlanteamiento\}', '%\include{00HipotesisPlanteamiento}'
    $line = $line -replace '\\include\{00Objetivos\}', '%\include{00Objetivos}'
    $line = $line -replace '\\include\{01Seccion01\}', '\include{01Introduccion}'
    $line = $line -replace '\\include\{02Seccion02\}', '\include{02MarcoTeorico}'
    $line = $line -replace '\\include\{03Gateway\}', '\include{03Gateway_NEW}'
    $line = $line -replace '\\include\{04Arquitectura\}', '\include{04Arquitectura_NEW}'
    $line = $line -replace '\\include\{05Seccion05\}', '\include{05Conclusiones}'
    $line = $line -replace '\\include\{06Seccion06\}', '%\include{06Seccion06}'
    $line = $line -replace '\\include\{07Seccion07\}', '%\include{07Seccion07}'
    
    # Actualizar anexos
    if ($line -match '\\include\{08Apendice01\}') {
        $output += '\include{09AnexoA_InstalacionOpenWRT}'
        $output += '\include{10AnexoB_DockerCompose}'
        $output += '\include{11AnexoC_ScriptsIntegracion}'
        $output += '\include{12AnexoD_EspecificacionesIEEE}'
        $output += '\include{13AnexoE_NodoIoT}'
        $line = '\include{14AnexoF_ConfiguracionesOpenWRT}'
    }
    
    $output += $line
}

# Guardar archivo actualizado
$output | Out-File "0000.tex" -Encoding UTF8
Write-Host "✓ Template actualizado correctamente" -ForegroundColor Green

# Verificar tamaño
$size = (Get-Item "0000.tex").Length / 1KB
Write-Host "Tamaño: $([math]::Round($size, 2)) KB" -ForegroundColor Yellow
