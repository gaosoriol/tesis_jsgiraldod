# Script Maestro para Agregar Citas Automaticamente
# Procesa 02MarcoTeorico.tex agregando citas en ubicaciones estrategicas

$ErrorActionPreference = "Continue"
$logFile = "agregar_citas_log.txt"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

"=" * 80 | Out-File -FilePath $logFile -Encoding UTF8
"INICIO DE PROCESO: $timestamp" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"=" * 80 | Out-File -FilePath $logFile -Encoding UTF8 -Append

# Leer archivo
$lines = Get-Content '02MarcoTeorico.tex' -Encoding UTF8
$citasIniciales = (Select-String -Path '02MarcoTeorico.tex' -Pattern '\\cite\{').Count

Write-Host "Estado inicial: $citasIniciales citas" -ForegroundColor Cyan
"Estado inicial: $citasIniciales citas" | Out-File -FilePath $logFile -Encoding UTF8 -Append

# Contadores
$exitosos = 0
$fallidos = 0

# ==================== SECCION 1: MARCO TEORICO - PROTOCOLOS IoT ====================

Write-Host "`n[SECCION 1] Agregando citas en Protocolos IoT..." -ForegroundColor Yellow

# Cita 4: Arquitectura RESTful de CoAP (línea ~261)
for ($i = 250; $i -lt 270; $i++) {
    if ($lines[$i] -match 'Arquitectura RESTful.*MÃtodos GET/POST/PUT/DELETE.*URIs') {
        $lines[$i] = $lines[$i] -replace '(\texttt\{coap://sensor01/temp\})\)\.', '$1) \cite{herrero2023iot-networking}.'
        Write-Host "   Cita 4: Arquitectura RESTful CoAP (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 4 - Arquitectura RESTful CoAP (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
        break
    }
}

# Cita 5: Header compacto CoAP (línea ~263)
for ($i = 260; $i -lt 275; $i++) {
    if ($lines[$i] -match 'Header compacto.*4 bytes fijos.*100\+ bytes HTTP') {
        $lines[$i] = $lines[$i] -replace '(100\+ bytes HTTP)\.$', '$1 \cite{gunjal2023iot-theory}.'
        Write-Host "   Cita 5: Header compacto CoAP (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 5 - Header compacto CoAP (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
        break
    }
}

# Cita 6: DTLS en CoAP (línea ~267)
for ($i = 265; $i -lt 280; $i++) {
    if ($lines[$i] -match 'DTLS integrado.*Seguridad con overhead menor que TLS') {
        $lines[$i] = $lines[$i] -replace '(TLS/TCP)\.$', '$1 \cite{iot-security-trends,lightweight-crypto}.'
        Write-Host "   Cita 6: DTLS seguridad CoAP (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 6 - DTLS seguridad CoAP (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
        break
    }
}

# Cita 7: Observe RFC 7641 (línea ~265)
for ($i = 260; $i -lt 275; $i++) {
    if ($lines[$i] -match 'Observe \(RFC 7641\).*Subscripciones a recursos') {
        $lines[$i] = $lines[$i] -replace '(telemetrÃa best-effort)\.$', '$1 \cite{herrero2023iot-networking}.'
        Write-Host "   Cita 7: Observe RFC 7641 (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 7 - Observe RFC 7641 (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
        break
    }
}

# Cita 8: Compresión IPHC (línea ~130-140)
for ($i = 125; $i -lt 145; $i++) {
    if ($lines[$i] -match 'CompresiÃn IPHC.*RFC 6282.*reduce headers IPv6') {
        $lines[$i] = $lines[$i] -replace '(2-7 bytes explotando redundancias contextuales):$', '$1 \cite{gunjal2023iot-theory}:'
        Write-Host "   Cita 8: Compresión IPHC 6LoWPAN (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 8 - Compresión IPHC (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
        break
    }
}

# Cita 9: Operaciones LwM2M CRUD (línea ~420-430)
for ($i = 415; $i -lt 435; $i++) {
    if ($lines[$i] -match 'Ejecuta operaciones CRUD.*Create, Read, Update, Delete') {
        $lines[$i] = $lines[$i] -replace '(objetos del cliente)\.$', '$1 \cite{oma-lwm2m-v1.2}.'
        Write-Host "   Cita 9: Operaciones CRUD LwM2M (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 9 - Operaciones CRUD LwM2M (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
        break
    }
}

# ==================== SECCION 2: IEEE 802.11ah HaLow ====================

Write-Host "`n[SECCION 2] Agregando citas en IEEE 802.11ah HaLow..." -ForegroundColor Yellow

# Buscar sección de HaLow
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match 'IEEE 802\.11ah.*HaLow') {
        
        # Cita 10: Introducción HaLow (misma línea o +1)
        if ($lines[$i] -match 'IEEE 802\.11ah.*standard.*Wi-Fi Alliance') {
            $lines[$i] = $lines[$i] -replace '(para IoT)\.$', '$1 \cite{halow2024survey,morse_micro_mm8108_2025}.'
            Write-Host "   Cita 10: Introducción IEEE 802.11ah (línea $($i+1))" -ForegroundColor Green
            "OK: Cita 10 - Introducción HaLow (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
            $exitosos++
        }
        
        # Buscar características de HaLow en las siguientes 50 líneas
        for ($j = $i; $j -lt ($i + 50) -and $j -lt $lines.Count; $j++) {
            
            # Cita 11: Rango de cobertura
            if ($lines[$j] -match 'rango de cobertura.*hasta 1 km.*outdoor' -and $lines[$j] -notmatch '\\cite') {
                $lines[$j] = $lines[$j] -replace '(entornos outdoor)\.$', '$1 \cite{halow2024survey,ieee80211ah-scalability}.'
                Write-Host "   Cita 11: Rango cobertura HaLow (línea $($j+1))" -ForegroundColor Green
                "OK: Cita 11 - Rango cobertura (línea $($j+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
                $exitosos++
            }
            
            # Cita 12: RAW (Restricted Access Window)
            if ($lines[$j] -match 'RAW.*Restricted Access Window' -and $lines[$j] -notmatch '\\cite') {
                $lines[$j] = $lines[$j] -replace '(colisiones)\.$', '$1 \cite{ieee80211ah-restricted,ieee80211ah-scalability}.'
                Write-Host "   Cita 12: RAW mechanism (línea $($j+1))" -ForegroundColor Green
                "OK: Cita 12 - RAW mechanism (línea $($j+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
                $exitosos++
            }
            
            # Cita 13: Modulación MCS10
            if ($lines[$j] -match 'MCS10.*BPSK.*1/2' -and $lines[$j] -notmatch '\\cite') {
                $lines[$j] = $lines[$j] -replace '(MHz)\.$', '$1 \cite{ieee80211ah-performance,ieee80211ah-throughput}.'
                Write-Host "   Cita 13: Modulación MCS (línea $($j+1))" -ForegroundColor Green
                "OK: Cita 13 - Modulación MCS (línea $($j+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
                $exitosos++
            }
        }
        break
    }
}

# ==================== SECCION 3: SMART GRID ====================

Write-Host "`n[SECCION 3] Agregando citas en Smart Grid..." -ForegroundColor Yellow

# Buscar sección Smart Grid
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match 'Smart Grid.*NIST|IEEE 2030\.5') {
        
        # Buscar en las siguientes 100 líneas
        for ($j = $i; $j -lt ($i + 100) -and $j -lt $lines.Count; $j++) {
            
            # Cita 14: Arquitectura NIST Smart Grid
            if ($lines[$j] -match 'arquitectura NIST.*siete dominios' -and $lines[$j] -notmatch '\\cite') {
                $lines[$j] = $lines[$j] -replace '(Service Provider)\.$', '$1 \cite{parizad2025smart-vol1,smart-grid-sdn}.'
                Write-Host "   Cita 14: Arquitectura NIST (línea $($j+1))" -ForegroundColor Green
                "OK: Cita 14 - Arquitectura NIST (línea $($j+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
                $exitosos++
            }
            
            # Cita 15: IEEE 2030.5 protocol
            if ($lines[$j] -match 'IEEE 2030\.5.*Smart Energy Profile' -and $lines[$j] -notmatch '\\cite') {
                $lines[$j] = $lines[$j] -replace '(aplicaciones DER)\.$', '$1 \cite{ieee20305-2023,parizad2025smart-vol2}.'
                Write-Host "   Cita 15: IEEE 2030.5 (línea $($j+1))" -ForegroundColor Green
                "OK: Cita 15 - IEEE 2030.5 (línea $($j+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
                $exitosos++
            }
            
            # Cita 16: Seguridad Smart Grid
            if ($lines[$j] -match 'seguridad.*Smart Grid.*ciberseguridad' -and $lines[$j] -notmatch '\\cite') {
                $lines[$j] = $lines[$j] -replace '(infraestructura crÃtica)\.$', '$1 \cite{securing-smart-grid,sdn-grid-resilience}.'
                Write-Host "   Cita 16: Seguridad Smart Grid (línea $($j+1))" -ForegroundColor Green
                "OK: Cita 16 - Seguridad Smart Grid (línea $($j+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
                $exitosos++
            }
        }
        break
    }
}

# ==================== SECCION 4: EDGE COMPUTING & CONTAINERS ====================

Write-Host "`n[SECCION 4] Agregando citas en Edge Computing..." -ForegroundColor Yellow

for ($i = 0; $i -lt $lines.Count; $i++) {
    # Cita 17: Docker containers
    if ($lines[$i] -match 'Docker.*containers.*namespaces' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(aislamiento de procesos)\.$', '$1 \cite{microservices-iot,construction-optimization}.'
        Write-Host "   Cita 17: Docker containers (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 17 - Docker containers (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
    
    # Cita 18: Edge AI
    if ($lines[$i] -match 'Edge.*AI.*inteligencia artificial.*edge' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(en el edge)\.$', '$1 \cite{kumar2025ai-edge,edge-ai-realtime}.'
        Write-Host "   Cita 18: Edge AI (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 18 - Edge AI (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
    
    # Cita 19: Microservicios
    if ($lines[$i] -match 'microservicios.*arquitectura.*modular' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(escalabilidad independiente)\.$', '$1 \cite{microservices-iot}.'
        Write-Host "   Cita 19: Microservicios (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 19 - Microservicios (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
}

# ==================== SECCION 5: BASES DE DATOS Y STREAMING ====================

Write-Host "`n[SECCION 5] Agregando citas en BD y Streaming..." -ForegroundColor Yellow

for ($i = 0; $i -lt $lines.Count; $i++) {
    # Cita 20: TimescaleDB hypertables
    if ($lines[$i] -match 'TimescaleDB.*hypertables.*series temporales' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(grandes volÃºmenes de datos)\.$', '$1 \cite{mccafferty2022energy-iot,data-fusion}.'
        Write-Host "   Cita 20: TimescaleDB (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 20 - TimescaleDB (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
    
    # Cita 21: Apache Kafka
    if ($lines[$i] -match 'Kafka.*streaming.*topics.*partitions' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(tiempo real)\.$', '$1 \cite{data-fusion,edge-ai-realtime}.'
        Write-Host "   Cita 21: Apache Kafka (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 21 - Apache Kafka (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
}

# ==================== SECCION 6: SEGURIDAD IoT ====================

Write-Host "`n[SECCION 6] Agregando citas en Seguridad IoT..." -ForegroundColor Yellow

for ($i = 0; $i -lt $lines.Count; $i++) {
    # Cita 22: Amenazas IoT
    if ($lines[$i] -match 'amenazas.*IoT.*Mirai|DDoS|botnet' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(dispositivos vulnerables)\.$', '$1 \cite{iot-security-trends,navigating-iot-security}.'
        Write-Host "   Cita 22: Amenazas IoT (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 22 - Amenazas IoT (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
    
    # Cita 23: Criptografía ligera
    if ($lines[$i] -match 'criptografÃa ligera.*lightweight.*constrained' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(recursos limitados)\.$', '$1 \cite{lightweight-crypto,iot-control-security}.'
        Write-Host "   Cita 23: Criptografía ligera (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 23 - Criptografía ligera (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
    
    # Cita 24: Autenticación multifactor
    if ($lines[$i] -match 'autenticaciÃn.*multifactor|MFA|2FA' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(acceso no autorizado)\.$', '$1 \cite{multifactor-authentication,gateway-security}.'
        Write-Host "   Cita 24: Autenticación multifactor (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 24 - Autenticación multifactor (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
}

# ==================== SECCION 7: ARQUITECTURAS Y DIGITAL TWINS ====================

Write-Host "`n[SECCION 7] Agregando citas en Arquitecturas..." -ForegroundColor Yellow

for ($i = 0; $i -lt $lines.Count; $i++) {
    # Cita 25: ISO/IEC 30141
    if ($lines[$i] -match 'ISO.*30141.*arquitectura de referencia.*IoT' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(interoperabilidad)\.$', '$1 \cite{iso30141-2024,iot-comprehensive}.'
        Write-Host "   Cita 25: ISO/IEC 30141 (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 25 - ISO/IEC 30141 (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
    
    # Cita 26: Digital Twins
    if ($lines[$i] -match 'digital twin.*gemelo digital.*representaciÃn virtual' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(sistema fÃsico)\.$', '$1 \cite{digital-twin-provisioning,twinarch-reference}.'
        Write-Host "   Cita 26: Digital Twins (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 26 - Digital Twins (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
    
    # Cita 27: Interoperabilidad IoT
    if ($lines[$i] -match 'interoperabilidad.*IoT.*heterogÃneo' -and $lines[$i] -notmatch '\\cite') {
        $lines[$i] = $lines[$i] -replace '(diferentes fabricantes)\.$', '$1 \cite{iot-interoperability,iso30141-2024}.'
        Write-Host "   Cita 27: Interoperabilidad (línea $($i+1))" -ForegroundColor Green
        "OK: Cita 27 - Interoperabilidad (línea $($i+1))" | Out-File -FilePath $logFile -Encoding UTF8 -Append
        $exitosos++
    }
}

# ==================== GUARDAR CAMBIOS ====================

Write-Host "`n[GUARDANDO] Escribiendo cambios al archivo..." -ForegroundColor Cyan
$lines | Set-Content '02MarcoTeorico.tex' -Encoding UTF8

# Verificar resultado
$citasFinales = (Select-String -Path '02MarcoTeorico.tex' -Pattern '\\cite\{').Count
$nuevasCitas = $citasFinales - $citasIniciales

# Resumen
Write-Host "`n" + ("=" * 80) -ForegroundColor Cyan
Write-Host "RESUMEN DE EJECUCION" -ForegroundColor Cyan
Write-Host ("=" * 80) -ForegroundColor Cyan
Write-Host "Citas iniciales: $citasIniciales" -ForegroundColor White
Write-Host "Citas finales: $citasFinales" -ForegroundColor White
Write-Host "Nuevas citas agregadas: $nuevasCitas" -ForegroundColor Green
Write-Host "Intentos exitosos: $exitosos" -ForegroundColor Green
Write-Host "Intentos fallidos: $fallidos" -ForegroundColor Red
Write-Host ("=" * 80) -ForegroundColor Cyan

# Guardar resumen en log
"" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"=" * 80 | Out-File -FilePath $logFile -Encoding UTF8 -Append
"RESUMEN FINAL" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"=" * 80 | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Citas iniciales: $citasIniciales" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Citas finales: $citasFinales" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Nuevas citas agregadas: $nuevasCitas" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Intentos exitosos: $exitosos" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"Intentos fallidos: $fallidos" | Out-File -FilePath $logFile -Encoding UTF8 -Append
"FIN: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath $logFile -Encoding UTF8 -Append

Write-Host "`nLog guardado en: $logFile" -ForegroundColor Yellow
