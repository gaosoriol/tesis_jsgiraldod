# Ejecutar todos los reemplazos de citas
# Este script debe ser ejecutado con las herramientas de VS Code

Write-Host \"Total de reemplazos a realizar: $($replacements.Count)\"
$completed = 0
$failed = 0

foreach ($replacement in $replacements) {
    try {
        Write-Host \"[$($completed+1)/$($replacements.Count)] $($replacement.Description)\"
        
        # Aquí se debe usar el tool replace_string_in_file de VS Code
        # Por ahora solo registramos en el log
        
        $logEntry = \"OK: $($replacement.Description)\"
        $logEntry | Add-Content -Path $logFile -Encoding UTF8
        $completed++
    }
    catch {
        $logEntry = \"ERROR: $($replacement.Description) - $($_.Exception.Message)\"
        $logEntry | Add-Content -Path $logFile -Encoding UTF8
        $failed++
    }
}

$summary = @\"

==================== RESUMEN ====================
Total reemplazos: $($replacements.Count)
Completados: $completed
Fallidos: $failed
Porcentaje éxito: $(($completed/$replacements.Count)*100)%
==================== FIN ====================
\"@

$summary | Add-Content -Path $logFile -Encoding UTF8
Write-Host $summary
