# Script V5C - PATRONES EXACTOS BASADOS EN TEXTO REAL

Write-Host "`n" -ForegroundColor Cyan
Write-Host "  SCRIPT V5C - PATRONES EXACTOS         " -ForegroundColor Cyan
Write-Host "`n" -ForegroundColor Cyan

$exitosos = 0

####################################################################################
# CAPITULO 03: GATEWAY
####################################################################################
Write-Host "[CAPÍTULO 03] Gateway - Agregando citas..." -ForegroundColor Magenta

$file03 = "03Gateway_NEW.tex"
$content03 = Get-Content -Path $file03 -Encoding UTF8 -Raw
$citas03Iniciales = ([regex]::Matches($content03, "\\cite\{")).Count
Write-Host "Estado inicial Cap 03: $citas03Iniciales citas`n" -ForegroundColor Yellow

# 3.1 SEP 2.0 (línea ~16)
if ($content03 -match "alineadas con IEEE 2030\.5 \(SEP 2\.0\)" -and $content03 -notmatch "IEEE 2030\.5 \(SEP 2\.0\).*?\\cite") {
    $content03 = $content03 -replace "(alineadas con IEEE 2030\.5 \(SEP 2\.0\))", "`$1 \cite{ieee20305-2023}"
    Write-Host "   IEEE 2030.5 SEP 2.0 (conf estándares)" -ForegroundColor Green
    $exitosos++
}

# 3.2 TLS 1.2/1.3
if ($content03 -match "seguridad IEEE 2030\.5.*?TLS 1\.2/1\.3" -and $content03 -notmatch "TLS 1\.2/1\.3.*?\\cite") {
    $content03 = $content03 -replace "(seguridad IEEE 2030\.5 se implementa mediante TLS 1\.2/1\.3 obligatorio)", "`$1 \cite{iot-security-trends}"
    Write-Host "   TLS 1.2/1.3 obligatorio" -ForegroundColor Green
    $exitosos++
}

# 3.3 ISO/IEC 30141
if ($content03 -match "entidades funcionales según la vista funcional de ISO/IEC 30141" -and $content03 -notmatch "ISO/IEC 30141.*?\\cite") {
    $content03 = $content03 -replace "(según la vista funcional de ISO/IEC 30141)", "`$1 \cite{iso30141-2024}"
    Write-Host "   ISO/IEC 30141:2024" -ForegroundColor Green
    $exitosos++
}

# 3.4 OBIS/DLMS
if ($content03 -match "normalización OBIS/DLMS/COSEM a JSON/CBOR" -and $content03 -notmatch "OBIS/DLMS/COSEM.*?\\cite") {
    $content03 = $content03 -replace "(normalización OBIS/DLMS/COSEM a JSON/CBOR)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   OBIS/DLMS/COSEM" -ForegroundColor Green
    $exitosos++
}

# 3.5 MQTT QoS
if ($content03 -match "publicación MQTT con QoS 1/2" -and $content03 -notmatch "MQTT con QoS.*?\\cite") {
    $content03 = $content03 -replace "(publicación MQTT con QoS 1/2 garantizando entrega)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   MQTT con QoS 1/2" -ForegroundColor Green
    $exitosos++
}

# 3.6 LTE backup
if ($content03 -match "LTE M\.2 \(backup <30s\)" -and $content03 -notmatch "LTE M\.2.*?\\cite") {
    $content03 = $content03 -replace "(LTE M\.2 \(backup <30s\))", "`$1 \cite{iot-comprehensive}"
    Write-Host "   LTE M.2 backup" -ForegroundColor Green
    $exitosos++
}

# 3.7 HaLow alcance 1 km
if ($content03 -match "Access Point HaLow \(902-928 MHz\) con alcance mínimo 1 km" -and $content03 -notmatch "alcance mínimo 1 km.*?\\cite") {
    $content03 = $content03 -replace "(alcance mínimo 1 km)", "`$1 \cite{halow2024survey}"
    Write-Host "   HaLow alcance 1 km" -ForegroundColor Green
    $exitosos++
}

# 3.8 API REST IEEE 2030.5
if ($content03 -match "API REST IEEE 2030\.5 compatible" -and $content03 -notmatch "API REST IEEE 2030\.5 compatible.*?\\cite") {
    $content03 = $content03 -replace "(API REST IEEE 2030\.5 compatible)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   API REST IEEE 2030.5" -ForegroundColor Green
    $exitosos++
}

# 3.9 Morse Micro temperatura
if ($content03 -match "Morse Micro: -40C a \+85C" -and $content03 -notmatch "Morse Micro.*?\\cite") {
    $content03 = $content03 -replace "(Morse Micro: -40C a \+85C)", "`$1 \cite{halow2024survey}"
    Write-Host "   Morse Micro temperatura" -ForegroundColor Green
    $exitosos++
}

# 3.10 WPA3-SAE
if ($content03 -match "WPA3-SAE con PMF obligatorio en HaLow" -and $content03 -notmatch "WPA3-SAE.*?\\cite") {
    $content03 = $content03 -replace "(WPA3-SAE con PMF obligatorio en HaLow)", "`$1 \cite{iot-security-trends}"
    Write-Host "   WPA3-SAE" -ForegroundColor Green
    $exitosos++
}

# 3.11 Morse Micro HaLow
if ($content03 -match "implementaciones de referencia de Morse Micro para Wi-Fi HaLow" -and $content03 -notmatch "Morse Micro para Wi-Fi HaLow.*?\\cite") {
    $content03 = $content03 -replace "(Morse Micro para Wi-Fi HaLow)", "`$1 \cite{halow2024survey,halow-iot-wireless}"
    Write-Host "   Morse Micro referencia" -ForegroundColor Green
    $exitosos++
}

# 3.12 Thread 802.15.4
if ($content03 -match "Implementan Thread \(802\.15\.4\)" -and $content03 -notmatch "Thread \(802\.15\.4\).*?\\cite") {
    $content03 = $content03 -replace "(Implementan Thread \(802\.15\.4\))", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Thread 802.15.4" -ForegroundColor Green
    $exitosos++
}

# 3.13 HaLow 802.11ah modo cliente
if ($content03 -match "o HaLow 802\.11ah en modo cliente" -and $content03 -notmatch "HaLow 802\.11ah.*?\\cite") {
    $content03 = $content03 -replace "(HaLow 802\.11ah en modo cliente)", "`$1 \cite{halow2024survey}"
    Write-Host "   HaLow modo cliente" -ForegroundColor Green
    $exitosos++
}

# 3.14 LwM2M sobre CoAP
if ($content03 -match "protocolos LwM2M sobre CoAP" -and $content03 -notmatch "LwM2M sobre CoAP.*?\\cite") {
    $content03 = $content03 -replace "(protocolos LwM2M sobre CoAP)", "`$1 \cite{oma-lwm2m-v1.2}"
    Write-Host "   LwM2M sobre CoAP" -ForegroundColor Green
    $exitosos++
}

# 3.15 ESP32-C6
if ($content03 -match "ESP32-C6, nRF52840" -and $content03 -notmatch "ESP32-C6.*?\\cite") {
    $content03 = $content03 -replace "(MCU Cortex-M4/M33 \(ESP32-C6, nRF52840\))", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   ESP32-C6/nRF52840" -ForegroundColor Green
    $exitosos++
}

# 3.16 Thread mesh 802.11s
if ($content03 -match "mediante mesh 802\.11s" -and $content03 -notmatch "mesh 802\.11s.*?\\cite") {
    $content03 = $content03 -replace "(mediante mesh 802\.11s, EasyMesh o Thread Router)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Mesh 802.11s" -ForegroundColor Green
    $exitosos++
}

# 3.17 OpenWRT 23.05
if ($content03 -match "OpenWRT 23\.05 con Docker" -and $content03 -notmatch "OpenWRT 23\.05.*?\\cite") {
    $content03 = $content03 -replace "(OpenWRT 23\.05 con Docker)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   OpenWRT 23.05" -ForegroundColor Green
    $exitosos++
}

# 3.18 ThingsBoard Edge
if ($content03 -match "centrada en \*\*ThingsBoard Edge\*\*" -and $content03 -notmatch "ThingsBoard Edge.*?\\cite") {
    $content03 = $content03 -replace "(centrada en \*\*ThingsBoard Edge\*\*)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   ThingsBoard Edge" -ForegroundColor Green
    $exitosos++
}

# 3.19 OpenThread Border Router
if ($content03 -match "\\textbf\{Función:\} Border router entre red Thread 802\.15\.4" -and $content03 -notmatch "Border router entre red Thread.*?\\cite") {
    $content03 = $content03 -replace "(Border router entre red Thread 802\.15\.4)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   OpenThread BR función" -ForegroundColor Green
    $exitosos++
}

####################################################################################
# CAPITULO 04: ARQUITECTURA
####################################################################################
Write-Host "`n[CAPÍTULO 04] Arquitectura - Agregando citas..." -ForegroundColor Magenta

$file04 = "04Arquitectura_NEW.tex"
$content04 = Get-Content -Path $file04 -Encoding UTF8 -Raw
$citas04Iniciales = ([regex]::Matches($content04, "\\cite\{")).Count
Write-Host "Estado inicial Cap 04: $citas04Iniciales citas`n" -ForegroundColor Yellow

# 4.1 DLMS/COSEM RS-485
if ($content04 -match "con interfaz DLMS/COSEM sobre RS-485" -and $content04 -notmatch "DLMS/COSEM sobre RS-485.*?\\cite") {
    $content04 = $content04 -replace "(con interfaz DLMS/COSEM sobre RS-485)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   DLMS/COSEM sobre RS-485" -ForegroundColor Green
    $exitosos++
}

# 4.2 IEC 62056-21
if ($content04 -match "o puerto óptico IEC 62056-21" -and $content04 -notmatch "IEC 62056-21.*?\\cite") {
    $content04 = $content04 -replace "(puerto óptico IEC 62056-21)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   IEC 62056-21" -ForegroundColor Green
    $exitosos++
}

# 4.3 códigos OBIS
if ($content04 -match "utilizando códigos OBIS estándar" -and $content04 -notmatch "códigos OBIS estándar.*?\\cite") {
    $content04 = $content04 -replace "(códigos OBIS estándar)", "`$1 \cite{ieee20305-2023}"
    Write-Host "   Códigos OBIS" -ForegroundColor Green
    $exitosos++
}

# 4.4 Thread 802.15.4
if ($content04 -match "transmisión al DCU por radio 802\.15\.4" -and $content04 -notmatch "radio 802\.15\.4.*?\\cite") {
    $content04 = $content04 -replace "(radio 802\.15\.4)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Radio 802.15.4" -ForegroundColor Green
    $exitosos++
}

# 4.5 ESP32C6 radio integrado
if ($content04 -match "ESP32C6 con radio 802\.15\.4 integrado" -and $content04 -notmatch "radio 802\.15\.4 integrado.*?\\cite") {
    $content04 = $content04 -replace "(con radio 802\.15\.4 integrado)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   ESP32C6 radio integrado" -ForegroundColor Green
    $exitosos++
}

# 4.6 OpenThread ESP-IDF
if ($content04 -match "stack Thread \(OpenThread en ESP-IDF\)" -and $content04 -notmatch "OpenThread en ESP-IDF.*?\\cite") {
    $content04 = $content04 -replace "(OpenThread en ESP-IDF)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   OpenThread en ESP-IDF" -ForegroundColor Green
    $exitosos++
}

# 4.7 Thread Border Router IP
if ($content04 -match "Thread Border Router terminando la red Thread y conectándola a IP" -and $content04 -notmatch "conectándola a IP.*?\\cite") {
    $content04 = $content04 -replace "(conectándola a IP)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Thread BR  IP" -ForegroundColor Green
    $exitosos++
}

# 4.8 Newracom NRC7292
if ($content04 -match "módulo HaLow \(Newracom NRC7292 o similar" -and $content04 -notmatch "Newracom NRC7292.*?\\cite") {
    $content04 = $content04 -replace "(Newracom NRC7292 o similar)", "`$1 \cite{halow2024survey}"
    Write-Host "   Newracom NRC7292" -ForegroundColor Green
    $exitosos++
}

# 4.9 FreeRTOS driver HaLow
if ($content04 -match "driver HaLow integrado en FreeRTOS" -and $content04 -notmatch "integrado en FreeRTOS.*?\\cite") {
    $content04 = $content04 -replace "(integrado en FreeRTOS)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   FreeRTOS driver" -ForegroundColor Green
    $exitosos++
}

# 4.10 Thread auto-organizante
if ($content04 -match "una red mallada auto-organizante" -and $content04 -notmatch "auto-organizante.*?\\cite") {
    $content04 = $content04 -replace "(auto-organizante)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Thread auto-organizante" -ForegroundColor Green
    $exitosos++
}

# 4.11 AES-128 CCM
if ($content04 -match "AES-128 CCM en capa de enlace" -and $content04 -notmatch "AES-128 CCM.*?\\cite") {
    $content04 = $content04 -replace "(AES-128 CCM en capa de enlace)", "`$1 \cite{lightweight-crypto}"
    Write-Host "   AES-128 CCM" -ForegroundColor Green
    $exitosos++
}

# 4.12 DTLS aplicación
if ($content04 -match "y DTLS en aplicación" -and $content04 -notmatch "DTLS en aplicación.*?\\cite") {
    $content04 = $content04 -replace "(DTLS en aplicación)", "`$1 \cite{iot-security-trends}"
    Write-Host "   DTLS aplicación" -ForegroundColor Green
    $exitosos++
}

# 4.13 HaLow alcance 1km
if ($content04 -match "alcance hasta 1 km en línea de vista" -and $content04 -notmatch "alcance hasta 1 km.*?\\cite") {
    $content04 = $content04 -replace "(alcance hasta 1 km en línea de vista)", "`$1 \cite{halow2024survey,halow-iot-wireless}"
    Write-Host "   HaLow alcance 1 km" -ForegroundColor Green
    $exitosos++
}

# 4.14 Banda sub-1 GHz
if ($content04 -match "mejor penetración en interiores \(banda sub-1 GHz\)" -and $content04 -notmatch "banda sub-1 GHz.*?\\cite") {
    $content04 = $content04 -replace "(banda sub-1 GHz)", "`$1 \cite{halow2024survey}"
    Write-Host "   Banda sub-1 GHz" -ForegroundColor Green
    $exitosos++
}

# 4.15 HaLow 902-928 MHz
if ($content04 -match "opera en banda 902-928 MHz" -and $content04 -notmatch "902-928 MHz.*?\\cite") {
    $content04 = $content04 -replace "(banda 902-928 MHz \(ISM, región dependiente\))", "`$1 \cite{halow2024survey}"
    Write-Host "   HaLow 902-928 MHz" -ForegroundColor Green
    $exitosos++
}

# 4.16 WPA3-SAE HaLow
if ($content04 -match "seguridad WPA3-SAE resistente a ataques de diccionario" -and $content04 -notmatch "WPA3-SAE.*?\\cite") {
    $content04 = $content04 -replace "(WPA3-SAE resistente a ataques de diccionario)", "`$1 \cite{iot-security-trends}"
    Write-Host "   WPA3-SAE" -ForegroundColor Green
    $exitosos++
}

####################################################################################
# RESUMEN
####################################################################################
$citas03Finales = ([regex]::Matches($content03, "\\cite\{")).Count
$citas04Finales = ([regex]::Matches($content04, "\\cite\{")).Count
$nuevas03 = $citas03Finales - $citas03Iniciales
$nuevas04 = $citas04Finales - $citas04Iniciales

Write-Host "`n" -ForegroundColor Cyan
Write-Host "         RESUMEN SCRIPT V5C             " -ForegroundColor Cyan
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
$content03 | Set-Content -Path $file03 -Encoding UTF8 -NoNewline
$content04 | Set-Content -Path $file04 -Encoding UTF8 -NoNewline
Write-Host " Archivos guardados exitosamente`n" -ForegroundColor Green
