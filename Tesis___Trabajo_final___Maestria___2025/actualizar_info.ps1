# Script para actualizar información de la tesis
$ErrorActionPreference = "Stop"

Write-Host "Actualizando información de la tesis..." -ForegroundColor Cyan

# Leer archivo
$content = Get-Content "0000.tex" -Raw -Encoding UTF8

# 1. RESTAURAR NOMBRE CORRECTO
$content = $content -replace 'Luis Antonio Giraldo', 'Juan Sebastian Giraldo Duque'

# 2. RESTAURAR TÍTULO ORIGINAL con formato correcto
$oldTitle = 'Arquitectura de Gateway de Telemetra Edge para Smart Energy con 6LoWPAN, IEEE 802.11ah HaLow Multi-Banda y Procesamiento Inteligente'
$newTitle = 'Arquitectura IoT Centrada en Pasarelas de Borde\\ \vspace{2mm}\large{Implementación de Protocolos basados en 6LowPAN para Smart Energy}'
$content = $content -replace [regex]::Escape($oldTitle), $newTitle

# 3. ACTUALIZAR SEDE A MANIZALES
$content = $content -replace 'Sede Medelln', 'Sede Manizales'
$content = $content -replace 'Sede Medellín', 'Sede Manizales'

# 4. ACTUALIZAR PROGRAMA A MAESTRÍA EN AUTOMATIZACIÓN INDUSTRIAL
$content = $content -replace 'Magster en Ingeniera - Ingeniera Electrnica', 'Magíster en Automatización Industrial'
$content = $content -replace 'Magíster en Ingeniería - Ingeniería Electrónica', 'Magíster en Automatización Industrial'

# 5. ACTUALIZAR DEPARTAMENTO (Manizales suele ser Ingeniería Eléctrica, Electrónica y Computación)
$content = $content -replace 'Departamento de Ingeniera Elctrica y Electrnica', 'Departamento de Ingeniería Eléctrica, Electrónica y Computación'

# 6. ACTUALIZAR AÑO
$content = $content -replace 'Año entrega', '2025'

# Guardar
[System.IO.File]::WriteAllText(".\0000.tex", $content, [System.Text.Encoding]::UTF8)

Write-Host "✓ Información actualizada correctamente" -ForegroundColor Green
Write-Host ""
Write-Host "Cambios realizados:" -ForegroundColor Yellow
Write-Host "  • Nombre: Juan Sebastian Giraldo Duque" -ForegroundColor White
Write-Host "  • Título: Arquitectura IoT Centrada en Pasarelas de Borde (formato correcto)" -ForegroundColor White
Write-Host "  • Sede: Manizales" -ForegroundColor White
Write-Host "  • Programa: Maestría en Automatización Industrial" -ForegroundColor White
Write-Host "  • Año: 2025" -ForegroundColor White
