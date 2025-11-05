# Script para corregir problemas de codificación en archivos .tex

$archivos = Get-ChildItem -Path "." -Filter "*.tex" -Recurse

$reemplazos = @{
    'Ã³' = 'ó'
    'Ã­' = 'í'
    'Ã©' = 'é'
    'Ã¡' = 'á'
    'Ãº' = 'ú'
    'Ã±' = 'ñ'
    'Ã"' = 'Ó'
    'Ã' = 'Í'
    'Ã‰' = 'É'
    'Ã' = 'Á'
    'Ãš' = 'Ú'
    'Ã'' = 'Ñ'
    'Ã¡' = 'á'
    'Ã©' = 'é'
    'Ã­' = 'í'
    'Ã³' = 'ó'
    'Ãº' = 'ú'
    'Ã±' = 'ñ'
    'Ã¼' = 'ü'
    'Ã–' = 'Ö'
    'Ã¶' = 'ö'
    'TeÃ³rico' = 'Teórico'
    'EvoluciÃ³n' = 'Evolución'
    'ElÃ©ctricas' = 'Eléctricas'
    'transiciÃ³n' = 'transición'
    'elÃ©ctricas' = 'eléctricas'
    'paradigmÃ¡tico' = 'paradigmático'
    'operaciÃ³n' = 'operación'
    'energÃ©ticos' = 'energéticos'
    'tecnologÃ­as' = 'tecnologías'
    'informaciÃ³n' = 'información'
    'comunicaciÃ³n' = 'comunicación'
    'optimizaciÃ³n' = 'optimización'
    'elÃ©ctrico' = 'eléctrico'
    'generaciÃ³n' = 'generación'
    'integraciÃ³n' = 'integración'
    'energÃ­as' = 'energías'
    'gestiÃ³n' = 'gestión'
    'detecciÃ³n' = 'detección'
    'recuperaciÃ³n' = 'recuperación'
    'participaciÃ³n' = 'participación'
    'tambiÃ©n' = 'también'
    'energÃ­a' = 'energía'
    'SegÃºn' = 'Según'
    'mediciÃ³n' = 'medición'
    'fÃ­sica' = 'física'
    'transmisiÃ³n' = 'transmisión'
    'distribuciÃ³n' = 'distribución'
    'telemetrÃ­a' = 'telemetría'
    'tÃ­picamente' = 'típicamente'
    'ComunicaciÃ³n' = 'Comunicación'
    'diseÃ±ado' = 'diseñado'
    'especÃ­ficamente' = 'específicamente'
    'domÃ©sticas' = 'domésticas'
    'fÃ­sica' = 'física'
    'configuraciÃ³n' = 'configuración'
    'automÃ¡ticas' = 'automáticas'
    'compresiÃ³n' = 'compresión'
    'fragmentaciÃ³n' = 'fragmentación'
    'mÃ©tricas' = 'métricas'
    'lÃ­der' = 'líder'
    'actÃºa' = 'actúa'
    'TraducciÃ³n' = 'Traducción'
    'PropagaciÃ³n' = 'Propagación'
    'IncorporaciÃ³n' = 'Incorporación'
    'Ãºnico' = 'único'
}

foreach ($archivo in $archivos) {
    Write-Host "Procesando: $($archivo.FullName)"
    
    $contenido = Get-Content $archivo.FullName -Raw -Encoding UTF8
    
    foreach ($buscar in $reemplazos.Keys) {
        $reemplazar = $reemplazos[$buscar]
        $contenido = $contenido -replace [regex]::Escape($buscar), $reemplazar
    }
    
    $contenido | Out-File $archivo.FullName -Encoding UTF8 -NoNewline
    Write-Host "  Corregido!"
}

Write-Host "`nProceso completado. Se han corregido $($archivos.Count) archivos."
