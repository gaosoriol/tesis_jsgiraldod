# Script V2 - Agregar Citas Masivamente (Mejorado)
# Usa patrones más simples y directos

$ErrorActionPreference = "Continue"
$logFile = "citas_v2_log.txt"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

"=" * 100 | Out-File -FilePath $logFile -Encoding UTF8
"SCRIPT V2 - INICIO: $timestamp" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"=" * 100 | Out-File -FilePath $logFile -Encoding UTF8 -Append

# Leer archivo
$lines = Get-Content '02MarcoTeorico.tex' -Encoding UTF8
$citasIniciales = (Select-String -Path '02MarcoTeorico.tex' -Pattern '\\cite\{').Count

Write-Host "`n" -ForegroundColor Cyan
Write-Host "  SCRIPT V2 - AGREGADO MASIVO DE CITAS                         " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "`nEstado inicial: $citasIniciales citas" -ForegroundColor White
"Estado inicial: $citasIniciales citas" | Out-File -FilePath $logFile -Encoding UTF8 -Append

$agregadas = 0

# ========== BLOQUE 1: PROTOCOLOS IoT (Completar 9 citas restantes) ==========
Write-Host "`n[BLOQUE 1] PROTOCOLOS IoT - Agregando 9 citas..." -ForegroundColor Yellow

# Cita 7: Observe push vs polling (línea ~268)
if ($lines[267] -notmatch '\\cite' -and $lines[267] -match 'Observe.*push.*polling') {
    $lines[267] = $lines[267] -replace '(polling HTTP)\)\.', '$1) \cite{herrero2023iot-networking}.'
    Write-Host "   Observe push notifications" -ForegroundColor Green
    "OK: Observe push (línea 268)" | Out-File -FilePath $logFile -Encoding UTF8 -Append
    $agregadas++
}

# Cita 8: Block-wise Transfer (línea ~269)
if ($lines[268] -notmatch '\\cite' -and $lines[268] -match 'Block-wise.*firmware OTA') {
    $lines[268] = $lines[268] -replace '(firmware OTA)\)\.', '$1) \cite{gunjal2023iot-theory}.'
    Write-Host "   Block-wise Transfer" -ForegroundColor Green
    "OK: Block-wise (línea 269)" | Out-File -FilePath $logFile -Encoding UTF8 -Append
    $agregadas++
}

# Cita 9: Compresión IPHC (línea ~133)
for ($i = 130; $i -lt 140; $i++) {
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match '6LoWPAN implementa.*IPHC.*RFC 6282') {
        $lines[$i] = $lines[$i] -replace '(contextuales):$', '$1 \cite{gunjal2023iot-theory}:'
        Write-Host "   Compresión IPHC 6LoWPAN" -ForegroundColor Green
        "OK: IPHC (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
        break
    }
}

# Cita 10: Link-local addresses compression (línea ~140-145)
for ($i = 138; $i -lt 148; $i++) {
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'Link-local addresses.*direcciÃn MAC.*compresiÃn') {
        $lines[$i] = $lines[$i] -replace '(0 bytes)\)\.', '$1) \cite{iot-comprehensive}.'
        Write-Host "   Link-local compression" -ForegroundColor Green
        "OK: Link-local (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
        break
    }
}

# Cita 11: LwM2M Object Model (línea ~430-440)
for ($i = 428; $i -lt 445; $i++) {
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'LwM2M estructura datos.*jerarquÃa.*3 niveles') {
        $lines[$i] = $lines[$i] -replace '(3 niveles):$', '$1 \cite{oma-lwm2m-v1.2}:'
        Write-Host "   LwM2M Object Model" -ForegroundColor Green
        "OK: Object Model (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
        break
    }
}

# Cita 12: LwM2M Bootstrap Server (línea ~422-425)
for ($i = 420; $i -lt 428; $i++) {
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'Bootstrap Server.*Provisiona credenciales') {
        $lines[$i] = $lines[$i] -replace '(LwM2M Server)\.$', '$1 \cite{oma-lwm2m-v1.2}.'
        Write-Host "   Bootstrap Server" -ForegroundColor Green
        "OK: Bootstrap (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
        break
    }
}

# Cita 13: CoAP vs HTTP comparación (línea ~300-320)
for ($i = 295; $i -lt 325; $i++) {
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'CoAP.*HTTP.*comparaci') {
        $lines[$i] = $lines[$i] -replace '(\}\\\\$)', '$1 \cite{herrero2023iot-networking}\\\\'
        Write-Host "   CoAP vs HTTP comparison" -ForegroundColor Green
        "OK: CoAP comparison (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
        break
    }
}

# Cita 14: RFC 4944 fragmentation (línea ~180-200)
for ($i = 178; $i -lt 205; $i++) {
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'RFC 4944.*fragmentaciÃn.*reensambla') {
        $lines[$i] = $lines[$i] -replace '(destino)\.$', '$1 \cite{iot-comprehensive}.'
        Write-Host "   RFC 4944 fragmentation" -ForegroundColor Green
        "OK: Fragmentation (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
        break
    }
}

# Cita 15: CoAP Confirmable mode (línea ~355-365)
for ($i = 353; $i -lt 368; $i++) {
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'Confirmable.*CON.*ACK.*retransmisiones') {
        $lines[$i] = $lines[$i] -replace '(retransmisiones)\.$', '$1 \cite{gunjal2023iot-theory}.'
        Write-Host "   Confirmable mode" -ForegroundColor Green
        "OK: CON mode (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
        break
    }
}

# ========== BLOQUE 2: IEEE 802.11ah HaLow (10 citas) ==========
Write-Host "`n[BLOQUE 2] IEEE 802.11ah HaLow - Agregando 10 citas..." -ForegroundColor Yellow

# Buscar sección HaLow y agregar citas
for ($i = 500; $i -lt 800; $i++) {
    # Cita 16: Introducción HaLow
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'IEEE 802\.11ah.*HaLow.*Wi-Fi.*sub-GHz') {
        $lines[$i] = $lines[$i] -replace '(sub-GHz)\.$', '$1 \cite{halow2024survey,morse_micro_mm8108_2025}.'
        Write-Host "   HaLow introducción" -ForegroundColor Green
        "OK: HaLow intro (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 17: Rango cobertura
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'rango.*cobertura.*1 km.*outdoor') {
        $lines[$i] = $lines[$i] -replace '(outdoor)\.$', '$1 \cite{halow2024survey,ieee80211ah-scalability}.'
        Write-Host "   Rango cobertura" -ForegroundColor Green
        "OK: Cobertura (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 18: Bandas sub-GHz
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match '(902-928 MHz.*Estados Unidos|863-868 MHz.*Europa)') {
        $lines[$i] = $lines[$i] -replace '(MHz)\.$', '$1 \cite{ieee80211ah-performance}.'
        Write-Host "   Bandas frecuencia" -ForegroundColor Green
        "OK: Bandas (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 19: RAW mechanism
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'RAW.*Restricted Access Window.*colisiones') {
        $lines[$i] = $lines[$i] -replace '(escalabilidad)\.$', '$1 \cite{ieee80211ah-restricted,ieee80211ah-scalability}.'
        Write-Host "   RAW mechanism" -ForegroundColor Green
        "OK: RAW (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 20: MCS modulation
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'MCS.*Modulation and Coding Scheme') {
        $lines[$i] = $lines[$i] -replace '(throughput)\.$', '$1 \cite{ieee80211ah-throughput}.'
        Write-Host "   MCS modulation" -ForegroundColor Green
        "OK: MCS (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 21: Channel widths
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match '(1 MHz|2 MHz|4 MHz|8 MHz).*ancho.*canal') {
        $lines[$i] = $lines[$i] -replace '(8 MHz)\.$', '$1 \cite{ieee80211ah-performance,halow2024survey}.'
        Write-Host "   Channel widths" -ForegroundColor Green
        "OK: Channels (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 22: Power saving
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'ahorro.*energÃa.*TIM.*Target Wake Time') {
        $lines[$i] = $lines[$i] -replace '(baterÃa)\.$', '$1 \cite{ieee80211ah-scalability}.'
        Write-Host "   Power saving" -ForegroundColor Green
        "OK: Power save (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 23: Scalability
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match '8191.*estaciones.*AP.*escalabilidad') {
        $lines[$i] = $lines[$i] -replace '(simultaneamente)\.$', '$1 \cite{ieee80211ah-scalability}.'
        Write-Host "   Scalability 8191" -ForegroundColor Green
        "OK: Scalability (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 24: Morse Micro chipset
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'Morse Micro.*MM8108.*SoC') {
        $lines[$i] = $lines[$i] -replace '(producciÃn)\.$', '$1 \cite{morse_micro_mm8108_2025}.'
        Write-Host "   Morse Micro" -ForegroundColor Green
        "OK: Morse Micro (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 25: Use cases IoT
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'casos de uso.*smart.*agricultura.*medidores') {
        $lines[$i] = $lines[$i] -replace '(inteligentes)\.$', '$1 \cite{halow2024survey}.'
        Write-Host "   Use cases" -ForegroundColor Green
        "OK: Use cases (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
}

# ========== BLOQUE 3: SMART GRID (12 citas) ==========
Write-Host "`n[BLOQUE 3] Smart Grid - Agregando 12 citas..." -ForegroundColor Yellow

# Buscar secciones de Smart Grid en todo el documento
for ($i = 0; $i -lt $lines.Count; $i++) {
    # Cita 26: Dominios NIST (ya existe en línea 9, buscar otras menciones)
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'dominios.*NIST.*Bulk Generation.*Transmission') {
        $lines[$i] = $lines[$i] -replace '(Service Provider)\.$', '$1 \cite{parizad2025smart-vol1}.'
        Write-Host "   Dominios NIST" -ForegroundColor Green
        "OK: NIST dominios (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 27: AMI infrastructure
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'AMI.*Advanced Metering Infrastructure.*mediciÃn inteligente') {
        $lines[$i] = $lines[$i] -replace '(bidireccional)\.$', '$1 \cite{parizad2025smart-vol1,parizad2025smart-vol2}.'
        Write-Host "   AMI infrastructure" -ForegroundColor Green
        "OK: AMI (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 28: IEEE 2030.5
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'IEEE 2030\.5.*Smart Energy Profile') {
        $lines[$i] = $lines[$i] -replace '(DER)\.$', '$1 \cite{ieee20305-2023}.'
        Write-Host "   IEEE 2030.5" -ForegroundColor Green
        "OK: IEEE 2030.5 (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 29: DER Distributed Energy Resources
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'DER.*Distributed Energy Resources.*solar.*eÃlica') {
        $lines[$i] = $lines[$i] -replace '(almacenamiento)\.$', '$1 \cite{parizad2025smart-vol2,ieee20305-2023}.'
        Write-Host "   DER resources" -ForegroundColor Green
        "OK: DER (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 30: Demand Response
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'Demand Response.*DR.*respuesta.*demanda') {
        $lines[$i] = $lines[$i] -replace '(peak shaving)\.$', '$1 \cite{smart-grid-sdn}.'
        Write-Host "   Demand Response" -ForegroundColor Green
        "OK: DR (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 31: Ciberseguridad Smart Grid
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'ciberseguridad.*Smart Grid.*infraestructura crÃtica') {
        $lines[$i] = $lines[$i] -replace '(crítica)\.$', '$1 \cite{securing-smart-grid,sdn-grid-resilience}.'
        Write-Host "   Ciberseguridad" -ForegroundColor Green
        "OK: Ciberseguridad (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 32: SDN en Smart Grid
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'SDN.*Software-Defined Networking.*Smart Grid') {
        $lines[$i] = $lines[$i] -replace '(programable)\.$', '$1 \cite{smart-grid-sdn,sdn-grid-resilience}.'
        Write-Host "   SDN Smart Grid" -ForegroundColor Green
        "OK: SDN (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 33: Resiliencia grid
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'resiliencia.*grid.*recuperaciÃn.*fallos') {
        $lines[$i] = $lines[$i] -replace '(autonomÃa)\.$', '$1 \cite{sdn-grid-resilience}.'
        Write-Host "   Resiliencia" -ForegroundColor Green
        "OK: Resiliencia (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 34: Microgrid
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'microgrid.*microred.*operaciÃn.*isla') {
        $lines[$i] = $lines[$i] -replace '(autÃnoma)\.$', '$1 \cite{parizad2025smart-vol2}.'
        Write-Host "   Microgrid" -ForegroundColor Green
        "OK: Microgrid (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 35: V2G Vehicle-to-Grid
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'V2G.*Vehicle.*Grid.*vehÃculos elÃctricos') {
        $lines[$i] = $lines[$i] -replace '(bidireccional)\.$', '$1 \cite{parizad2025smart-vol2}.'
        Write-Host "   V2G" -ForegroundColor Green
        "OK: V2G (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 36: Smart meters
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'medidores inteligentes.*smart meters.*lectura remota') {
        $lines[$i] = $lines[$i] -replace '(tiempo real)\.$', '$1 \cite{parizad2025smart-vol1}.'
        Write-Host "   Smart meters" -ForegroundColor Green
        "OK: Smart meters (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
    
    # Cita 37: SCADA systems
    if ($lines[$i] -notmatch '\\cite' -and $lines[$i] -match 'SCADA.*Supervisory Control.*monitorizaciÃn') {
        $lines[$i] = $lines[$i] -replace '(tiempo real)\.$', '$1 \cite{securing-smart-grid}.'
        Write-Host "   SCADA" -ForegroundColor Green
        "OK: SCADA (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $agregadas++
    }
}

# ========== GUARDAR Y VERIFICAR ==========
Write-Host "`n[GUARDANDO] Escribiendo cambios..." -ForegroundColor Cyan
$lines | Set-Content '02MarcoTeorico.tex' -Encoding UTF8

$citasFinales = (Select-String -Path '02MarcoTeorico.tex' -Pattern '\\cite\{').Count
$nuevas = $citasFinales - $citasIniciales

# RESUMEN
Write-Host "`n" -ForegroundColor Green
Write-Host "  RESUMEN - SCRIPT V2                                           " -ForegroundColor Green
Write-Host "" -ForegroundColor Green
Write-Host "  Citas iniciales:        $citasIniciales                                          " -ForegroundColor White
Write-Host "  Citas finales:          $citasFinales                                          " -ForegroundColor White
Write-Host "  Nuevas agregadas:       $nuevas                                          " -ForegroundColor Green
Write-Host "  Intentos exitosos:      $agregadas                                          " -ForegroundColor Green
Write-Host "" -ForegroundColor Green

# Log final
"" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"=" * 100 | Out-File -FilePath $logFile -Encoding UTF8 -Append
"RESUMEN FINAL" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Citas iniciales: $citasIniciales" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Citas finales: $citasFinales" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Nuevas agregadas: $nuevas" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Intentos: $agregadas" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"FIN: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath $logFile -Encoding UTF8 -Append

Write-Host "`nLog guardado: $logFile" -ForegroundColor Yellow
Write-Host "Compilando documento..." -ForegroundColor Cyan
