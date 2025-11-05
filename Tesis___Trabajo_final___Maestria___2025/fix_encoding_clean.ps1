# Script para corregir problemas de codificación UTF-8 mal interpretados
# Los archivos tienen caracteres en encoding incorrecto que deben ser reemplazados

$archivos = Get-ChildItem -Path "." -Filter "*.tex"

foreach ($archivo in $archivos) {
    Write-Host "Procesando: $($archivo.Name)"
    
    # Leer como Latin1 (ISO-8859-1) y escribir como UTF-8
    $contenido = Get-Content $archivo.FullName -Raw -Encoding Latin1
    
    # Guardar correctamente como UTF-8
    [System.IO.File]::WriteAllText($archivo.FullName, $contenido, [System.Text.Encoding]::UTF8)
    
    Write-Host "  Corregido!"
}

Write-Host "`nProceso completado. Total de archivos procesados: $($archivos.Count)"
