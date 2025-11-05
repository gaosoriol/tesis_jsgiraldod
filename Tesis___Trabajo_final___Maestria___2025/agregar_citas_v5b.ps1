# Script V5B - CAPITULOS 03 Y 04 CORREGIDO

Write-Host "`n" -ForegroundColor Cyan
Write-Host "  SCRIPT V5B - CAPITULOS 03 Y 04        " -ForegroundColor Cyan
Write-Host "`n" -ForegroundColor Cyan

$exitosos = 0

####################################################################################
# CAPITULO 03: GATEWAY
####################################################################################
Write-Host "[CAPÍTULO 03] Gateway - Agregando citas..." -ForegroundColor Magenta

$file03 = "03Gateway_NEW.tex"
$lines03 = Get-Content -Path $file03 -Encoding UTF8
$citas03Iniciales = ($lines03 | Select-String "\\cite\{").Count
Write-Host "Estado inicial Cap 03: $citas03Iniciales citas`n" -ForegroundColor Yellow

# 3.1 IEEE 2030.5 SEP 2.0 (línea ~16)
if ($lines03[15] -match "IEEE 2030" -and $lines03[15] -notmatch "\\cite") {
    $lines03[15] = $lines03[15] -replace "(SEP 2.0)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   IEEE 2030.5 SEP 2.0 (línea 16)" -ForegroundColor Green
    $exitosos++
}

# 3.2 TLS certificados (línea ~29)
if ($lines03[29] -match "TLS 1\\.2/1\\.3" -and $lines03[29] -notmatch "\\cite") {
    $lines03[29] = $lines03[29] -replace "(RBAC para control de acceso)", "`$1 \cite{ieee20305-2023,iot-security-trends}"
    Write-Host "   TLS seguridad (línea 30)" -ForegroundColor Green
    $exitosos++
}

# 3.3 ISO/IEC 30141 (línea ~33)
if ($lines03[33] -match "ISO/IEC 30141" -and $lines03[33] -notmatch "\\cite") {
    $lines03[33] = $lines03[33] -replace "(ISO/IEC 30141)", "`$1 \cite{iso30141-2024}"
    Write-Host "   ISO/IEC 30141 (línea 34)" -ForegroundColor Green
    $exitosos++
}

# 3.4 OBIS/DLMS (línea ~43)
if ($lines03[42] -match "OBIS/DLMS/COSEM" -and $lines03[42] -notmatch "\\cite") {
    $lines03[42] = $lines03[42] -replace "(JSON/CBOR)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   OBIS/DLMS (línea 43)" -ForegroundColor Green
    $exitosos++
}

# 3.5 MQTT QoS (línea ~43)
if ($lines03[42] -match "MQTT con QoS" -and $lines03[42] -notmatch "\\cite") {
    $lines03[42] = $lines03[42] -replace "(QoS 1/2)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   MQTT QoS (línea 43)" -ForegroundColor Green
    $exitosos++
}

# 3.6 LTE M.2 (línea ~43)
if ($lines03[42] -match "LTE M\\.2" -and $lines03[42] -notmatch "\\cite") {
    $lines03[42] = $lines03[42] -replace "(backup <30s)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   LTE backup (línea 43)" -ForegroundColor Green
    $exitosos++
}

# 3.7 Morse Micro (línea ~47)
if ($lines03[47] -match "Morse Micro" -and $lines03[47] -notmatch "\\cite") {
    $lines03[47] = $lines03[47] -replace "(\+85)", "`$1 \cite{halow2024survey}"
    Write-Host "   Morse Micro (línea 48)" -ForegroundColor Green
    $exitosos++
}

# 3.8 WPA3-SAE (línea ~52)
if ($lines03[52] -match "WPA3-SAE" -and $lines03[52] -notmatch "\\cite") {
    $lines03[52] = $lines03[52] -replace "(HaLow)", "`$1 \cite{iot-security-trends}"
    Write-Host "   WPA3-SAE (línea 53)" -ForegroundColor Green
    $exitosos++
}

# 3.9 Thread/HaLow (línea ~67)
if ($lines03[66] -match "Thread.*802\\.15\\.4" -and $lines03[66] -notmatch "\\cite") {
    $lines03[66] = $lines03[66] -replace "(802\\.11ah)", "`$1 \cite{herrero2023iot-networking,halow2024survey}"
    Write-Host "   Thread/HaLow (línea 67)" -ForegroundColor Green
    $exitosos++
}

# 3.10 LwM2M (línea ~67)
if ($lines03[66] -match "LwM2M sobre CoAP" -and $lines03[66] -notmatch "\\cite") {
    $lines03[66] = $lines03[66] -replace "(CoAP)", "`$1 \cite{oma-lwm2m-v1.2}"
    Write-Host "   LwM2M (línea 67)" -ForegroundColor Green
    $exitosos++
}

# 3.11 ESP32-C6 (línea ~67)
if ($lines03[66] -match "ESP32-C6" -and $lines03[66] -notmatch "\\cite") {
    $lines03[66] = $lines03[66] -replace "(nRF52840)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   ESP32-C6 (línea 67)" -ForegroundColor Green
    $exitosos++
}

# 3.12 OpenWRT (línea ~82)
if ($lines03[81] -match "OpenWRT 23\\.05" -and $lines03[81] -notmatch "\\cite") {
    $lines03[81] = $lines03[81] -replace "(Docker)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   OpenWRT (línea 82)" -ForegroundColor Green
    $exitosos++
}

# 3.13 ThingsBoard Edge (línea ~91)
if ($lines03[90] -match "ThingsBoard Edge" -and $lines03[90] -notmatch "\\cite") {
    $lines03[90] = $lines03[90] -replace "(ThingsBoard Edge)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   ThingsBoard Edge (línea 91)" -ForegroundColor Green
    $exitosos++
}

# 3.14 TimescaleDB (línea ~179)
if ($lines03[178] -match "TimescaleDB" -and $lines03[178] -notmatch "\\cite") {
    $lines03[178] = $lines03[178] -replace "(TimescaleDB)", "`$1 \cite{timescaledb-iot}"
    Write-Host "   TimescaleDB (línea 179)" -ForegroundColor Green
    $exitosos++
}

# 3.15 gRPC (línea ~214)
if ($lines03[213] -match "gRPC" -and $lines03[213] -notmatch "\\cite") {
    $lines03[213] = $lines03[213] -replace "(gRPC)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   gRPC (línea 214)" -ForegroundColor Green
    $exitosos++
}

####################################################################################
# CAPITULO 04: ARQUITECTURA
####################################################################################
Write-Host "`n[CAPÍTULO 04] Arquitectura - Agregando citas..." -ForegroundColor Magenta

$file04 = "04Arquitectura_NEW.tex"
$lines04 = Get-Content -Path $file04 -Encoding UTF8
$citas04Iniciales = ($lines04 | Select-String "\\cite\{").Count
Write-Host "Estado inicial Cap 04: $citas04Iniciales citas`n" -ForegroundColor Yellow

# 4.1 IEC 62052 (línea ~30)
if ($lines04[29] -match "IEC 62052/62053" -and $lines04[29] -notmatch "\\cite") {
    $lines04[29] = $lines04[29] -replace "(IEC 62052/62053)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   IEC 62052 (línea 30)" -ForegroundColor Green
    $exitosos++
}

# 4.2 DLMS/COSEM (línea ~30)
if ($lines04[29] -match "DLMS/COSEM" -and $lines04[29] -notmatch "\\cite") {
    $lines04[29] = $lines04[29] -replace "(RS-485)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   DLMS/COSEM (línea 30)" -ForegroundColor Green
    $exitosos++
}

# 4.3 IEC 62056-21 (línea ~30)
if ($lines04[29] -match "IEC 62056-21" -and $lines04[29] -notmatch "\\cite") {
    $lines04[29] = $lines04[29] -replace "(IEC 62056-21)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   IEC 62056-21 (línea 30)" -ForegroundColor Green
    $exitosos++
}

# 4.4 ESP32C6 (línea ~53)
if ($lines04[52] -match "ESP32C6" -and $lines04[52] -notmatch "\\cite") {
    $lines04[52] = $lines04[52] -replace "(integrado)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   ESP32C6 (línea 53)" -ForegroundColor Green
    $exitosos++
}

# 4.5 OpenThread (línea ~60)
if ($lines04[59] -match "OpenThread" -and $lines04[59] -notmatch "\\cite") {
    $lines04[59] = $lines04[59] -replace "(ESP-IDF)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   OpenThread (línea 60)" -ForegroundColor Green
    $exitosos++
}

# 4.6 Thread Border Router (línea ~70)
if ($lines04[69] -match "Thread Border Router" -and $lines04[69] -notmatch "\\cite") {
    $lines04[69] = $lines04[69] -replace "(conectándola a IP)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Thread BR (línea 70)" -ForegroundColor Green
    $exitosos++
}

# 4.7 FreeRTOS (línea ~88)
if ($lines04[87] -match "FreeRTOS" -and $lines04[87] -notmatch "\\cite") {
    $lines04[87] = $lines04[87] -replace "(FreeRTOS)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   FreeRTOS (línea 88)" -ForegroundColor Green
    $exitosos++
}

# 4.8 Thread mesh (línea ~98)
if ($lines04[97] -match "auto-organizante" -and $lines04[97] -notmatch "\\cite") {
    $lines04[97] = $lines04[97] -replace "(auto-organizante)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Thread mesh (línea 98)" -ForegroundColor Green
    $exitosos++
}

# 4.9 AES-128 (línea ~105)
if ($lines04[104] -match "AES-128" -and $lines04[104] -notmatch "\\cite") {
    $lines04[104] = $lines04[104] -replace "(enlace)", "`$1 \cite{lightweight-crypto}"
    Write-Host "   AES-128 (línea 105)" -ForegroundColor Green
    $exitosos++
}

# 4.10 DTLS (línea ~105)
if ($lines04[104] -match "DTLS" -and $lines04[104] -notmatch "\\cite") {
    $lines04[104] = $lines04[104] -replace "(aplicación)", "`$1 \cite{iot-security-trends}"
    Write-Host "   DTLS (línea 105)" -ForegroundColor Green
    $exitosos++
}

# 4.11 HaLow alcance (línea ~122)
if ($lines04[121] -match "alcance hasta 1 km" -and $lines04[121] -notmatch "\\cite") {
    $lines04[121] = $lines04[121] -replace "(WiFi 2\\.4 GHz)", "`$1 \cite{halow2024survey,halow-iot-wireless}"
    Write-Host "   HaLow alcance (línea 122)" -ForegroundColor Green
    $exitosos++
}

# 4.12 Banda ISM (línea ~129)
if ($lines04[128] -match "902-928 MHz" -and $lines04[128] -notmatch "\\cite") {
    $lines04[128] = $lines04[128] -replace "(ISM)", "`$1 \cite{halow2024survey}"
    Write-Host "   Banda ISM (línea 129)" -ForegroundColor Green
    $exitosos++
}

####################################################################################
# RESUMEN
####################################################################################
$citas03Finales = ($lines03 | Select-String "\\cite\{").Count
$citas04Finales = ($lines04 | Select-String "\\cite\{").Count
$nuevas03 = $citas03Finales - $citas03Iniciales
$nuevas04 = $citas04Finales - $citas04Iniciales

Write-Host "`n" -ForegroundColor Cyan
Write-Host "         RESUMEN SCRIPT V5B             " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "`nCapítulo 03:" -ForegroundColor Yellow
Write-Host "  Citas iniciales: $citas03Iniciales" -ForegroundColor White
Write-Host "  Citas finales: $citas03Finales" -ForegroundColor White
Write-Host "  Nuevas agregadas: $nuevas03" -ForegroundColor Green
Write-Host "`nCapítulo 04:" -ForegroundColor Yellow
Write-Host "  Citas iniciales: $citas04Iniciales" -ForegroundColor White
Write-Host "  Citas finales: $citas04Finales" -ForegroundColor White
Write-Host "  Nuevas agregadas: $nuevas04" -ForegroundColor Green
Write-Host "`nTotal intentos exitosos: $exitosos" -ForegroundColor Green
Write-Host "Total nuevas citas: $($nuevas03 + $nuevas04)`n" -ForegroundColor Green

# Guardar cambios
$lines03 | Set-Content -Path $file03 -Encoding UTF8
$lines04 | Set-Content -Path $file04 -Encoding UTF8
Write-Host " Archivos guardados exitosamente`n" -ForegroundColor Green
