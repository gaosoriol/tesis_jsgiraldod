# Script de analisis de bibliografia - Tarea 1
# Compara citas usadas vs entradas en Referencias.bib

Write-Host "=== ANALISIS DE BIBLIOGRAFIA ===" -ForegroundColor Cyan
Write-Host ""

# Leer archivos
$citasUsadas = Get-Content "citas_unicas.txt" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
$entradasBib = Get-Content "entradas_bib.txt" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

Write-Host "ESTADISTICAS GENERALES:" -ForegroundColor Yellow
Write-Host "   Citas unicas usadas en .tex: $($citasUsadas.Count)"
Write-Host "   Entradas en Referencias.bib: $($entradasBib.Count)"
Write-Host ""

# Encontrar citas huerfanas (usadas pero no en .bib)
$huerfanas = $citasUsadas | Where-Object { $_ -notin $entradasBib }

Write-Host "CITAS HUERFANAS (en .tex pero NO en Referencias.bib):" -ForegroundColor Red
if ($huerfanas.Count -eq 0) {
    Write-Host "   Ninguna - Todas las citas tienen entrada en .bib" -ForegroundColor Green
} else {
    Write-Host "   Encontradas $($huerfanas.Count) citas sin entrada:" -ForegroundColor Red
    $huerfanas | ForEach-Object { Write-Host "      - $_" }
}
Write-Host ""

# Encontrar entradas no usadas (en .bib pero nunca citadas)
$noUsadas = $entradasBib | Where-Object { $_ -notin $citasUsadas }

Write-Host "ENTRADAS NO USADAS (en Referencias.bib pero nunca citadas):" -ForegroundColor Magenta
Write-Host "   Total: $($noUsadas.Count) entradas ($([math]::Round($noUsadas.Count/$entradasBib.Count*100, 1))% del .bib)"
Write-Host ""
Write-Host "   Primeras 20 entradas no usadas:"
$noUsadas | Select-Object -First 20 | ForEach-Object { Write-Host "      - $_" }
if ($noUsadas.Count -gt 20) {
    Write-Host "      ... y $($noUsadas.Count - 20) mas"
}
Write-Host ""

# Encontrar entradas validas (correctamente citadas)
$validas = $citasUsadas | Where-Object { $_ -in $entradasBib }

Write-Host "CITAS VALIDAS (correctamente referenciadas):" -ForegroundColor Green
Write-Host "   Total: $($validas.Count) citas ($([math]::Round($validas.Count/$citasUsadas.Count*100, 1))% de las usadas)"
Write-Host ""

# Guardar resultados
$huerfanas | Out-File "citas_huerfanas.txt" -Encoding UTF8
$noUsadas | Out-File "entradas_no_usadas.txt" -Encoding UTF8
$validas | Out-File "citas_validas.txt" -Encoding UTF8

Write-Host "ARCHIVOS GENERADOS:" -ForegroundColor Cyan
Write-Host "   - citas_huerfanas.txt ($($huerfanas.Count) entradas)"
Write-Host "   - entradas_no_usadas.txt ($($noUsadas.Count) entradas)"
Write-Host "   - citas_validas.txt ($($validas.Count) entradas)"
Write-Host ""

# Resumen de acciones recomendadas
Write-Host "ACCIONES RECOMENDADAS:" -ForegroundColor Yellow
Write-Host ""
if ($huerfanas.Count -gt 0) {
    Write-Host "   CRITICO - Agregar $($huerfanas.Count) entrada(s) faltante(s) a Referencias.bib"
}
if ($noUsadas.Count -gt 50) {
    Write-Host "   DESEABLE - Revisar $($noUsadas.Count) entradas no usadas (candidatas a limpieza)"
}
if ($huerfanas.Count -eq 0 -and $validas.Count -eq $citasUsadas.Count) {
    Write-Host "   EXCELENTE - Bibliografia consistente, todas las citas resuelven correctamente"
}
Write-Host ""
