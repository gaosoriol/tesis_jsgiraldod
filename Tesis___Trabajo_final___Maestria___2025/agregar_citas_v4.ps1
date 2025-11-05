# Script V4 - INSERCION MASIVA CONTINUACION
# Agregar 30+ citas adicionales en secciones faltantes

$file = "02MarcoTeorico.tex"
$lines = Get-Content -Path $file -Encoding UTF8

# Contador inicial
$citasIniciales = ($lines | Select-String "\\cite\{").Count
Write-Host "`n" -ForegroundColor Cyan
Write-Host "  SCRIPT V4 - INSERCION CONTINUA        " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "Estado inicial: $citasIniciales citas`n" -ForegroundColor Yellow

$exitosos = 0

####################################################################################
# BLOQUE 1: HALOW Bandwidths - Agregar 7 citas
####################################################################################
Write-Host "[BLOQUE 1] HALOW Bandwidths - Agregando 7 citas..." -ForegroundColor Magenta

# 1.1 Casos de uso 2 MHz (línea ~817)
for ($i = 815; $i -le 825; $i++) {
    if ($lines[$i] -match "Casos de Uso 2 MHz:" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Casos de Uso 2 MHz:)", "`$1 \cite{halow-smart-grid,halow-iot-wireless}"
        Write-Host "   Casos uso 2 MHz (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.2 Modelo propagación Hata (línea ~806)
for ($i = 804; $i -le 812; $i++) {
    if ($lines[$i] -match "modelo de propagaci.*n Hata urbano" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Hata urbano)", "`$1 \cite{halow2024survey}"
        Write-Host "   Modelo Hata (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.3 4 MHz bandwidth balance (línea ~824)
for ($i = 822; $i -le 832; $i++) {
    if ($lines[$i] -match "4 MHz Bandwidth.*Balance Gesti.*n y Throughput" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Throughput)", "`$1 \cite{halow-smart-grid,halow2024survey}"
        Write-Host "   4 MHz bandwidth (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.4 Firmware OTA (línea ~847)
for ($i = 845; $i -le 855; $i++) {
    if ($lines[$i] -match "Soporta firmware OTA.*Transferencia de im.*genes" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(simult.*neas)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   Firmware OTA (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.5 8 MHz alto tráfico (línea ~862)
for ($i = 860; $i -le 870; $i++) {
    if ($lines[$i] -match "8 MHz Bandwidth.*Alto Tr.*fico" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(L.*nea de Vista)", "`$1 \cite{halow2024survey,halow-iot-wireless}"
        Write-Host "   8 MHz bandwidth (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.6 Latencia ultra-baja (línea ~885)
for ($i = 883; $i -le 893; $i++) {
    if ($lines[$i] -match "Latencia ultra-baja.*Cr.*tico para aplicaciones tiempo-real" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(100 ms)", "`$1 \cite{halow-smart-grid}"
        Write-Host "   Latencia ultra-baja (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.7 Backhaul urbano LOS (línea ~899)
for ($i = 897; $i -le 907; $i++) {
    if ($lines[$i] -match "Backhaul urbano LOS.*Enlaces punto-a-punto" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(800m)", "`$1 \cite{halow-iot-wireless}"
        Write-Host "   Backhaul LOS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 2: LTE IoT - Agregar 5 citas
####################################################################################
Write-Host "`n[BLOQUE 2] LTE IoT - Agregando 5 citas..." -ForegroundColor Magenta

# 2.1 Power Saving Mode (línea ~1003)
for ($i = 1001; $i -le 1010; $i++) {
    if ($lines[$i] -match "Power Saving Mode.*PSM.*deep sleep profundo" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(TAU periodic update)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   PSM (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.2 eDRX (línea ~1005)
for ($i = 1003; $i -le 1012; $i++) {
    if ($lines[$i] -match "Extended Discontinuous Reception.*eDRX.*Extiende ciclos DRX" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(0\\.2-0\\.6 mA promedio)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   eDRX (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.3 RAI (línea ~1007)
for ($i = 1005; $i -le 1014; $i++) {
    if ($lines[$i] -match "Release Assistance Indication.*RAI.*dispositivo se.*aliza" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(conexi.*n RRC)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   RAI (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.4 IEEE 802.15.4 MAC (línea ~1009)
for ($i = 1007; $i -le 1016; $i++) {
    if ($lines[$i] -match "IEEE 802\\.15\\.4 define PHY y MAC" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(baja potencia)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   IEEE 802.15.4 MAC (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.5 CCA Clear Channel Assessment (línea ~1019)
for ($i = 1017; $i -le 1026; $i++) {
    if ($lines[$i] -match "CCA.*Clear Channel Assessment.*Medir energ.*a RF" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(8 symbol periods)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   CCA (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 3: IEEE 2030.5 - Agregar 8 citas
####################################################################################
Write-Host "`n[BLOQUE 3] IEEE 2030.5 Smart Energy - Agregando 8 citas..." -ForegroundColor Magenta

# 3.1 IEEE 2030.5 introducción (línea ~1050)
for ($i = 1048; $i -le 1058; $i++) {
    if ($lines[$i] -match "IEEE 2030\\.5.*anteriormente conocido como ZigBee SEP 2\\.0" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(ZigBee SEP 2\\.0)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   IEEE 2030.5 intro (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.2 California SB-2030 (línea ~1051)
for ($i = 1049; $i -le 1059; $i++) {
    if ($lines[$i] -match "mandatorio para DR programs en California SB-2030" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(California SB-2030)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   California SB-2030 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.3 RESTful HTTP/TLS (línea ~1051)
for ($i = 1049; $i -le 1059; $i++) {
    if ($lines[$i] -match "modelo RESTful sobre HTTP/TLS" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(HTTP/TLS)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   RESTful HTTP/TLS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.4 Function Sets (línea ~1055)
for ($i = 1053; $i -le 1063; $i++) {
    if ($lines[$i] -match "Function Sets.*cada uno exponiendo recursos REST" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(URIs jer.*rquicas):", "`$1 \cite{ieee20305-2023}:"
        Write-Host "   Function Sets (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.5 LFDI derivado (línea ~1103)
for ($i = 1101; $i -le 1111; $i++) {
    if ($lines[$i] -match "LFDI.*Long Form Device Identifier.*derivado de certificado X\\.509" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(X\\.509):", "`$1 \cite{ieee20305-2023}:"
        Write-Host "   LFDI (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.6 OBIS codes (línea ~1109)
for ($i = 1107; $i -le 1117; $i++) {
    if ($lines[$i] -match "OBIS.*Object Identification System.*seg.*n IEC 62056" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(IEC 62056):", "`$1 \cite{ieee20305-2023}:"
        Write-Host "   OBIS codes (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.7 Prioridades messaging (línea ~1118)
for ($i = 1116; $i -le 1126; $i++) {
    if ($lines[$i] -match "Prioridades 0-9.*donde 0 es cr.*tico" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(sobretensi.*n)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   Prioridades MSG (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.8 XML schemas (línea ~1122)
for ($i = 1120; $i -le 1130; $i++) {
    if ($lines[$i] -match "schemas XML estrictos para todos los recursos" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(recursos)", "`$1 \cite{ieee20305-2023}"
        Write-Host "   XML schemas (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 4: 6LoWPAN Adicional - Agregar 5 citas
####################################################################################
Write-Host "`n[BLOQUE 4] 6LoWPAN Detalles - Agregando 5 citas..." -ForegroundColor Magenta

# 4.1 RFC 6282 (línea ~115)
for ($i = 113; $i -le 122; $i++) {
    if ($lines[$i] -match "6LoWPAN.*definido en RFC 6282 y RFC 4944" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(RFC 6282 y RFC 4944)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   RFC 6282 y 4944 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.2 MTU 127 bytes (línea ~116)
for ($i = 114; $i -le 123; $i++) {
    if ($lines[$i] -match "MTU de 127 bytes" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(127 bytes)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   MTU 127 bytes (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.3 Context-based compression (línea ~143)
for ($i = 141; $i -le 150; $i++) {
    if ($lines[$i] -match "Context-based compression.*Prefijos de red conocidos" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(4 bits)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   Context compression (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.4 Best Practice payload (línea ~222)
for ($i = 220; $i -le 229; $i++) {
    if ($lines[$i] -match "Best Practice.*Dise.*ar payloads.*70 bytes" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(25-30 bytes)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   Best practice payload (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.5 Fragmentación limitaciones (línea ~213)
for ($i = 211; $i -le 220; $i++) {
    if ($lines[$i] -match "Limitaciones de Fragmentaci.*n:" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Fragmentaci.*n):", "`$1 \cite{gunjal2023iot-theory}:"
        Write-Host "   Fragmentación limits (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 5: CoAP Adicional - Agregar 5 citas
####################################################################################
Write-Host "`n[BLOQUE 5] CoAP Detalles - Agregando 5 citas..." -ForegroundColor Magenta

# 5.1 RFC 7252 CoAP (línea ~258)
for ($i = 256; $i -le 265; $i++) {
    if ($lines[$i] -match "CoAP.*RFC 7252.*protocolo web RESTful" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(RFC 7252)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   RFC 7252 CoAP (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.2 Métodos GET/POST/PUT/DELETE (línea ~260)
for ($i = 258; $i -le 267; $i++) {
    if ($lines[$i] -match "m.*todos GET, POST, PUT, DELETE" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(DELETE)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   Métodos CoAP (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.3 Confirmable vs Non-confirmable (línea ~261)
for ($i = 259; $i -le 268; $i++) {
    if ($lines[$i] -match "Confirmable.*CON.*Non-confirmable.*NON" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(NON)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   CON vs NON (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.4 Token de request (línea ~263)
for ($i = 261; $i -le 270; $i++) {
    if ($lines[$i] -match "Token de request.*match responses" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(asincr.*nicas)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   Token request (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.5 RFC 7959 Block-wise (línea ~269)
for ($i = 267; $i -le 276; $i++) {
    if ($lines[$i] -match "RFC 7959.*payloads grandes en bloques" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(RFC 7959)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   RFC 7959 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# RESUMEN
####################################################################################
$citasFinales = ($lines | Select-String "\\cite\{").Count
$nuevas = $citasFinales - $citasIniciales

Write-Host "`n" -ForegroundColor Cyan
Write-Host "         RESUMEN SCRIPT V4              " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "Citas iniciales: $citasIniciales" -ForegroundColor Yellow
Write-Host "Intentos exitosos: $exitosos" -ForegroundColor Green
Write-Host "Citas finales: $citasFinales" -ForegroundColor Yellow
Write-Host "Nuevas citas agregadas: $nuevas`n" -ForegroundColor Green

# Guardar cambios
$lines | Set-Content -Path $file -Encoding UTF8
Write-Host " Archivo guardado exitosamente" -ForegroundColor Green
