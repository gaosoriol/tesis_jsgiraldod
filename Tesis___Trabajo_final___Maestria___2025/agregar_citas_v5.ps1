# Script V5 - CAPITULOS 03 Y 04
# Agregar citas en Gateway y Arquitectura

Write-Host "`n" -ForegroundColor Cyan
Write-Host "  SCRIPT V5 - CAPITULOS 03 Y 04         " -ForegroundColor Cyan
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

# 3.1 IEEE 2030.5 Function Sets (línea ~18)
for ($i = 16; $i -le 25; $i++) {
    if ($lines03[$i] -match "IEEE 2030\\.5.*SEP 2\\.0.*incluyendo.*Function Sets" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(Function Sets):", "`$1 \cite{ieee20305-2023}:"
        Write-Host "   IEEE 2030.5 Function Sets (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.2 TLS 1.2/1.3 seguridad (línea ~29)
for ($i = 27; $i -le 36; $i++) {
    if ($lines03[$i] -match "TLS 1\\.2/1\\.3 obligatorio.*certificados X\\.509 ECC" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(curva P-256)", "`$1 \cite{ieee20305-2023,iot-security-trends}"
        Write-Host "   TLS seguridad (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.3 ISO/IEC 30141 (línea ~35)
for ($i = 33; $i -le 42; $i++) {
    if ($lines03[$i] -match "ISO/IEC 30141.*entidades funcionales.*vista funcional" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(vista funcional de ISO/IEC 30141)", "`$1 \cite{iso30141-2024}"
        Write-Host "   ISO/IEC 30141 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.4 OBIS/DLMS/COSEM (línea ~43)
for ($i = 41; $i -le 50; $i++) {
    if ($lines03[$i] -match "normalizaci.*n OBIS/DLMS/COSEM" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(OBIS/DLMS/COSEM)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   OBIS/DLMS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.5 MQTT QoS (línea ~43)
for ($i = 41; $i -le 50; $i++) {
    if ($lines03[$i] -match "publicaci.*n MQTT con QoS 1/2" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(QoS 1/2)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   MQTT QoS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.6 LTE M.2 backup (línea ~44)
for ($i = 42; $i -le 51; $i++) {
    if ($lines03[$i] -match "LTE M\\.2.*backup.*30s" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(backup <30s)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   LTE backup (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.7 Morse Micro temperatura (línea ~48)
for ($i = 46; $i -le 55; $i++) {
    if ($lines03[$i] -match "Morse Micro.*-40.*C.*85.*C" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(85.*C)", "`$1 \cite{halow2024survey}"
        Write-Host "   Morse Micro temp (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.8 WPA3-SAE (línea ~55)
for ($i = 53; $i -le 62; $i++) {
    if ($lines03[$i] -match "WPA3-SAE con PMF obligatorio" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(PMF obligatorio)", "`$1 \cite{iot-security-trends}"
        Write-Host "   WPA3-SAE (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.9 Thread 802.15.4 (línea ~70)
for ($i = 68; $i -le 77; $i++) {
    if ($lines03[$i] -match "Thread.*802\\.15\\.4.*o HaLow 802\\.11ah" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(802\\.11ah)", "`$1 \cite{herrero2023iot-networking,halow2024survey}"
        Write-Host "   Thread/HaLow (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.10 LwM2M sobre CoAP (línea ~70)
for ($i = 68; $i -le 77; $i++) {
    if ($lines03[$i] -match "LwM2M sobre CoAP" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(LwM2M sobre CoAP)", "`$1 \cite{oma-lwm2m-v1.2}"
        Write-Host "   LwM2M/CoAP (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.11 MCU ESP32-C6/nRF52840 (línea ~72)
for ($i = 70; $i -le 79; $i++) {
    if ($lines03[$i] -match "ESP32-C6.*nRF52840" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(nRF52840)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   MCU platforms (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.12 802.11s mesh (línea ~76)
for ($i = 74; $i -le 83; $i++) {
    if ($lines03[$i] -match "mesh 802\\.11s.*EasyMesh.*Thread Router" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(Thread Router)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   Mesh protocols (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.13 MM8108 SoC (línea ~77)
for ($i = 75; $i -le 84; $i++) {
    if ($lines03[$i] -match "SoC MM8108.*MPU Linux" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(MPU Linux)", "`$1 \cite{halow2024survey}"
        Write-Host "   MM8108 SoC (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.14 PoE 802.3af/at (línea ~78)
for ($i = 76; $i -le 85; $i++) {
    if ($lines03[$i] -match "PoE 802\\.3af/at" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(802\\.3af/at)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   PoE standard (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.15 Raspberry Pi 4 (línea ~81)
for ($i = 79; $i -le 88; $i++) {
    if ($lines03[$i] -match "Raspberry Pi 4" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(Raspberry Pi 4)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   Raspberry Pi (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.16 OpenWRT 23.05 (línea ~82)
for ($i = 80; $i -le 89; $i++) {
    if ($lines03[$i] -match "OpenWRT 23\\.05 con Docker" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(con Docker)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   OpenWRT (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.17 ThingsBoard Edge (línea ~91)
for ($i = 89; $i -le 98; $i++) {
    if ($lines03[$i] -match "ThingsBoard Edge.*plataforma de procesamiento edge" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(procesamiento edge)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   ThingsBoard Edge (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.18 Rule Engine CEP (línea ~152)
for ($i = 150; $i -le 162; $i++) {
    if ($lines03[$i] -match "Rule Engine.*Motor de Reglas CEP" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(CEP\\))", "`$1 \cite{iot-comprehensive})"
        Write-Host "   Rule Engine (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.19 TimescaleDB (línea ~175)
for ($i = 173; $i -le 183; $i++) {
    if ($lines03[$i] -match "TimescaleDB Integration" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(Integration):", "`$1 \cite{timescaledb-iot}:"
        Write-Host "   TimescaleDB (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.20 gRPC protocol (línea ~213)
for ($i = 211; $i -le 221; $i++) {
    if ($lines03[$i] -match "protocolo gRPC.*puerto 7070/TLS" -and $lines03[$i] -notmatch "\\cite") {
        $lines03[$i] = $lines03[$i] -replace "(7070/TLS):", "`$1 \cite{iot-comprehensive}:"
        Write-Host "   gRPC (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# CAPITULO 04: ARQUITECTURA
####################################################################################
Write-Host "`n[CAPÍTULO 04] Arquitectura - Agregando citas..." -ForegroundColor Magenta

$file04 = "04Arquitectura_NEW.tex"
$lines04 = Get-Content -Path $file04 -Encoding UTF8
$citas04Iniciales = ($lines04 | Select-String "\\cite\{").Count
Write-Host "Estado inicial Cap 04: $citas04Iniciales citas`n" -ForegroundColor Yellow

# 4.1 IEC 62052/62053 (línea ~28)
for ($i = 26; $i -le 35; $i++) {
    if ($lines04[$i] -match "IEC 62052/62053.*clase 1 o 2" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(IEC 62052/62053)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   IEC 62052/62053 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.2 DLMS/COSEM (línea ~29)
for ($i = 27; $i -le 36; $i++) {
    if ($lines04[$i] -match "DLMS/COSEM sobre RS-485" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(RS-485)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   DLMS/COSEM (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.3 IEC 62056-21 (línea ~29)
for ($i = 27; $i -le 36; $i++) {
    if ($lines04[$i] -match "puerto .*ptico IEC 62056-21" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(IEC 62056-21)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   IEC 62056-21 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.4 OBIS codes (línea ~30)
for ($i = 28; $i -le 37; $i++) {
    if ($lines04[$i] -match "c.*digos OBIS est.*ndar" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(OBIS est.*ndar)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   OBIS codes (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.5 ESP32C6 radio (línea ~53)
for ($i = 51; $i -le 60; $i++) {
    if ($lines04[$i] -match "ESP32C6 con radio 802\\.15\\.4 integrado" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(integrado)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   ESP32C6 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.6 MAX485/SP485 (línea ~54)
for ($i = 52; $i -le 61; $i++) {
    if ($lines04[$i] -match "MAX485 o SP485.*aislamiento galv.*nico" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(galv.*nico)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   RS485 transceiver (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.7 OpenThread (línea ~61)
for ($i = 59; $i -le 68; $i++) {
    if ($lines04[$i] -match "OpenThread en ESP-IDF" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(ESP-IDF)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   OpenThread (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.8 Thread Border Router (línea ~72)
for ($i = 70; $i -le 79; $i++) {
    if ($lines04[$i] -match "Thread Border Router.*terminando la red Thread" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(red Thread)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   Thread BR (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.9 Newracom NRC7292 (línea ~83)
for ($i = 81; $i -le 90; $i++) {
    if ($lines04[$i] -match "Newracom NRC7292.*SPI/SDIO" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(SPI/SDIO)", "`$1 \cite{halow2024survey}"
        Write-Host "   Newracom chip (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.10 FreeRTOS (línea ~89)
for ($i = 87; $i -le 96; $i++) {
    if ($lines04[$i] -match "FreeRTOS" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(FreeRTOS)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   FreeRTOS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.11 Thread mesh auto-organizante (línea ~99)
for ($i = 97; $i -le 106; $i++) {
    if ($lines04[$i] -match "red mallada auto-organizante" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(auto-organizante)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   Thread mesh (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.12 AES-128 CCM (línea ~109)
for ($i = 107; $i -le 116; $i++) {
    if ($lines04[$i] -match "AES-128 CCM.*capa de enlace" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(capa de enlace)", "`$1 \cite{lightweight-crypto}"
        Write-Host "   AES-128 CCM (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.13 DTLS en aplicación (línea ~109)
for ($i = 107; $i -le 116; $i++) {
    if ($lines04[$i] -match "DTLS en aplicaci.*n" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(aplicaci.*n)", "`$1 \cite{iot-security-trends}"
        Write-Host "   DTLS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.14 PAN ID Thread (línea ~115)
for ($i = 113; $i -le 122; $i++) {
    if ($lines04[$i] -match "PAN ID .*nico.*identificar la red Thread" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(red Thread)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   PAN ID (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.15 HaLow ventajas (línea ~127)
for ($i = 125; $i -le 134; $i++) {
    if ($lines04[$i] -match "alcance hasta 1 km.*vs.*100m WiFi" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(WiFi 2\\.4 GHz)", "`$1 \cite{halow2024survey,halow-iot-wireless}"
        Write-Host "   HaLow alcance (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.16 TIM, RAW (línea ~128)
for ($i = 126; $i -le 135; $i++) {
    if ($lines04[$i] -match "TIM.*RAW" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(RAW\\)", "`$1 \cite{halow-iot-wireless})"
        Write-Host "   TIM/RAW (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.17 Banda 902-928 MHz (línea ~134)
for ($i = 132; $i -le 141; $i++) {
    if ($lines04[$i] -match "902-928 MHz.*ISM" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(ISM)", "`$1 \cite{halow2024survey}"
        Write-Host "   Banda ISM (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.18 WMM QoS (línea ~136)
for ($i = 134; $i -le 143; $i++) {
    if ($lines04[$i] -match "QoS WMM.*priorizar tr.*fico" -and $lines04[$i] -notmatch "\\cite") {
        $lines04[$i] = $lines04[$i] -replace "(cr.*tica)", "`$1 \cite{halow-smart-grid}"
        Write-Host "   WMM QoS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# RESUMEN
####################################################################################
$citas03Finales = ($lines03 | Select-String "\\cite\{").Count
$citas04Finales = ($lines04 | Select-String "\\cite\{").Count
$nuevas03 = $citas03Finales - $citas03Iniciales
$nuevas04 = $citas04Finales - $citas04Iniciales

Write-Host "`n" -ForegroundColor Cyan
Write-Host "         RESUMEN SCRIPT V5              " -ForegroundColor Cyan
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
