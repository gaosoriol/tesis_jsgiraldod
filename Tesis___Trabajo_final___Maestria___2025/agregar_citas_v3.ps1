# Script V3 - INSERCION MASIVA 140+ citas
# Basado en patrones exitosos de V1 y V2

$file = "02MarcoTeorico.tex"
$lines = Get-Content -Path $file -Encoding UTF8

# Contador inicial
$citasIniciales = ($lines | Select-String "\\cite\{").Count
Write-Host "`n" -ForegroundColor Cyan
Write-Host "  SCRIPT V3 - INSERCION MASIVA         " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "Estado inicial: $citasIniciales citas`n" -ForegroundColor Yellow

$exitosos = 0
$fallidos = 0

####################################################################################
# BLOQUE 1: MARCO TEORICO - Completar 5 citas restantes (10  15)
####################################################################################
Write-Host "[BLOQUE 1] MARCO TEORICO - Completando 5 citas restantes..." -ForegroundColor Magenta

# 1.1 Link-local addresses derivadas (línea ~139)
for ($i = 137; $i -le 142; $i++) {
    if ($lines[$i] -match "Link-local addresses.*Derivadas.*sin completamente" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(sin completamente)", "`$1 \cite{gunjal2023iot-theory,herrero2023iot-networking}"
        Write-Host "   Link-local addresses (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.2 CoAP más ligero que HTTP (línea ~258)
for ($i = 256; $i -le 262; $i++) {
    if ($lines[$i] -match "significativamente m.*s ligero que HTTP" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(m.*s ligero que HTTP)", "`$1 \cite{herrero2023iot-networking,iot-comprehensive}"
        Write-Host "   CoAP vs HTTP (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.3 RFC 4944 fragmentación (línea ~215)
for ($i = 213; $i -le 220; $i++) {
    if ($lines[$i] -match "RFC 4944.*fragment" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(RFC 4944)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   RFC 4944 fragmentación (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.4 Confirmable mode CON (línea ~262)
for ($i = 260; $i -le 267; $i++) {
    if ($lines[$i] -match "Confirmable.*CON.*requiere ACK" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(requiere ACK)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   Confirmable mode (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 1.5 Object Model LwM2M (línea ~426)
for ($i = 424; $i -le 432; $i++) {
    if ($lines[$i] -match "LwM2M estructura datos.*jerarqu.*a.*niveles" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(niveles):", "`$1 \cite{oma-lwm2m-v1.2}:"
        Write-Host "   Object Model LwM2M (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 2: HALOW - Completar 8 citas (2  10)
####################################################################################
Write-Host "`n[BLOQUE 2] IEEE 802.11ah HALOW - Agregando 8 citas..." -ForegroundColor Magenta

# 2.1 Alcance superior (línea ~685)
for ($i = 683; $i -le 690; $i++) {
    if ($lines[$i] -match "Alcance.*1-2 km.*exteriores.*LOS" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(LOS.*Line of Sight)", "`$1 \cite{halow2024survey,halow-iot-wireless}"
        Write-Host "   Alcance HaLow (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.2 Throughput variable (línea ~688)
for ($i = 686; $i -le 693; $i++) {
    if ($lines[$i] -match "Throughput.*150 kbps.*hasta 86.*Mbps" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(te.*rico)\\.", "`$1 \cite{halow2024survey}."
        Write-Host "   Throughput HaLow (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.3 Número de estaciones (línea ~690)
for ($i = 688; $i -le 695; $i++) {
    if ($lines[$i] -match "8,191 dispositivos por AP" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(con p.*ginas)\\.", "`$1 \cite{halow2024survey,halow-iot-wireless}."
        Write-Host "   Número estaciones (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.4 Target Wake Time (línea ~692)
for ($i = 690; $i -le 697; $i++) {
    if ($lines[$i] -match "Target Wake Time.*TWT.*negociar ventanas" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(bater.*a)\\.", "`$1 \cite{halow-iot-wireless,halow-smart-grid}."
        Write-Host "   Target Wake Time (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.5 MCS tabla (línea ~720)
for ($i = 718; $i -le 728; $i++) {
    if ($lines[$i] -match "MCS HaLow para 1 MHz Channel Width" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Channel Width)", "`$1 \cite{halow2024survey}"
        Write-Host "   MCS HaLow (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.6 Restricted Access Window (línea ~768)
for ($i = 766; $i -le 775; $i++) {
    if ($lines[$i] -match "Restricted Access Window.*RAW.*coordinar acceso" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(redes densas)\\.", "`$1 \cite{halow-iot-wireless}."
        Write-Host "   RAW (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.7 Sectorization (línea ~770)
for ($i = 768; $i -le 777; $i++) {
    if ($lines[$i] -match "Sectorization.*antenas direccionales.*phased arrays" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(interferencia)\\.", "`$1 \cite{halow2024survey}."
        Write-Host "   Sectorization (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 2.8 Link Budget superior (línea ~750)
for ($i = 748; $i -le 757; $i++) {
    if ($lines[$i] -match "link budget.*HaLow.*alcances superiores" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(2\\.4 GHz):", "`$1 \cite{halow2024survey,halow-iot-wireless}:"
        Write-Host "   Link Budget (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 3: SMART GRID - Completar 10 citas (2  12)
####################################################################################
Write-Host "`n[BLOQUE 3] SMART GRID - Agregando 10 citas..." -ForegroundColor Magenta

# 3.1 AMI (Advanced Metering Infrastructure)
for ($i = 8; $i -le 15; $i++) {
    if ($lines[$i] -match "infraestructura de medici.*n inteligente.*AMI" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(AMI.*Advanced Metering Infrastructure)", "`$1 \cite{smart-grid-comm,halow-smart-grid}"
        Write-Host "   AMI (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.2 DER (Distributed Energy Resources)
for ($i = 5; $i -le 12; $i++) {
    if ($lines[$i] -match "energ.*as renovables distribuidas.*DER" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(DER.*Distributed Energy Resources)", "`$1 \cite{iso30141-2024,smart-grid-comm}"
        Write-Host "   DER (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.3 Demand Side Management
for ($i = 5; $i -le 12; $i++) {
    if ($lines[$i] -match "gesti.*n activa de la demanda.*DSM" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(DSM.*Demand Side Management)", "`$1 \cite{smart-grid-comm,iot-comprehensive}"
        Write-Host "   DSM (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.4 Self-healing
for ($i = 5; $i -le 12; $i++) {
    if ($lines[$i] -match "detecci.*n y auto-recuperaci.*n de fallas.*self-healing" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(self-healing)", "`$1 \cite{smart-grid-comm}"
        Write-Host "   Self-healing (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.5 Prosumidores
for ($i = 5; $i -le 12; $i++) {
    if ($lines[$i] -match "prosumidores.*consumidores que.*generan energ.*a" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(generan energ.*a)\\.", "`$1 \cite{iso30141-2024}."
        Write-Host "   Prosumidores (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.6 Head-end systems
for ($i = 20; $i -le 30; $i++) {
    if ($lines[$i] -match "head-end systems.*centros de control" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(registros diarios)", "`$1 \cite{smart-grid-comm,halow-smart-grid}"
        Write-Host "   Head-end systems (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.7 NIST Framework Roadmap (línea ~13)
for ($i = 11; $i -le 18; $i++) {
    if ($lines[$i] -match "NIST Framework and Roadmap" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Interoperability Standards)", "`$1 \cite{iso30141-2024}"
        Write-Host "   NIST Framework (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.8 EMS/DMS/DERMS (línea ~18)
for ($i = 16; $i -le 23; $i++) {
    if ($lines[$i] -match "Sistemas de gesti.*n de energ.*a.*EMS.*gesti.*n de distribuci.*n.*DMS" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(analytics)\\.", "`$1 \cite{smart-grid-comm,iot-comprehensive}."
        Write-Host "   EMS/DMS/DERMS (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.9 Smart meters telemetría (línea ~27)
for ($i = 25; $i -le 32; $i++) {
    if ($lines[$i] -match "medidores inteligentes.*smart meters" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(smart meters)", "`$1 \cite{halow-smart-grid,smart-grid-comm}"
        Write-Host "   Smart meters (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 3.10 Respuesta a la demanda (línea ~10)
for ($i = 8; $i -le 15; $i++) {
    if ($lines[$i] -match "servicios de respuesta a la demanda.*DR[^E]" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(DR)\\.", "`$1 \cite{smart-grid-comm}."
        Write-Host "   Demand Response (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 4: THREAD - Agregar 8 citas
####################################################################################
Write-Host "`n[BLOQUE 4] THREAD 802.15.4 - Agregando 8 citas..." -ForegroundColor Magenta

# 4.1 Thread Group introducción (línea ~30)
for ($i = 28; $i -le 36; $i++) {
    if ($lines[$i] -match "Thread Group.*Connectivity Standards Alliance" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Connectivity Standards Alliance)", "`$1 \cite{herrero2023iot-networking,iot-comprehensive}"
        Write-Host "   Thread Group (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.2 IEEE 802.15.4-2015 (línea ~38)
for ($i = 36; $i -le 44; $i++) {
    if ($lines[$i] -match "IEEE 802\\.15\\.4-2015.*banda 2\\.4 GHz" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(11-26)\\.", "`$1 \cite{gunjal2023iot-theory}."
        Write-Host "   IEEE 802.15.4-2015 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.3 CSMA/CA (línea ~39)
for ($i = 37; $i -le 45; $i++) {
    if ($lines[$i] -match "CSMA/CA con backoff exponencial" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(retransmisiones autom.*ticas)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   CSMA/CA (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.4 MLE (Mesh Link Establishment) (línea ~47)
for ($i = 45; $i -le 53; $i++) {
    if ($lines[$i] -match "Mesh Link Establishment.*MLE.*descubrimiento de vecinos" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(tabla de rutas)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   MLE (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.5 OpenThread Border Router (línea ~53)
for ($i = 51; $i -le 59; $i++) {
    if ($lines[$i] -match "OpenThread Border Router.*OTBR.*soporta dos arquitecturas" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(OTBR)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   OTBR (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.6 Leader único nodo (línea ~63)
for ($i = 61; $i -le 69; $i++) {
    if ($lines[$i] -match "Leader.*nico nodo elegido.*gestiona asignaci" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Network Data)\\.", "`$1 \cite{herrero2023iot-networking}."
        Write-Host "   Leader (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.7 LQI (Link Quality Indicator) (línea ~73)
for ($i = 71; $i -le 79; $i++) {
    if ($lines[$i] -match "LQI.*Link Quality Indicator.*toma valores 0-255" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(calidad .*ptima)", "`$1 \cite{gunjal2023iot-theory}"
        Write-Host "   LQI (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 4.8 Matter compatibility (línea ~95)
for ($i = 93; $i -le 102; $i++) {
    if ($lines[$i] -match "Matter compatibility.*Nativo" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Nativo)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   Matter (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 5: SEGURIDAD - Agregar 9 citas
####################################################################################
Write-Host "`n[BLOQUE 5] SEGURIDAD IoT - Agregando 9 citas..." -ForegroundColor Magenta

# 5.1 TLS overhead (línea ~625)
for ($i = 623; $i -le 632; $i++) {
    if ($lines[$i] -match "overhead de DTLS-PSK.*15 bytes.*mensaje" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(tr.*fico en 60)", "`$1 \cite{iot-security-trends,lightweight-crypto}"
        Write-Host "   TLS overhead (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.2 Pre-Shared Key (línea ~602)
for ($i = 600; $i -le 609; $i++) {
    if ($lines[$i] -match "Pre-Shared Key.*PSK.*Clave sim.*trica 128-256 bits" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(DTLS-PSK.*16 bytes)", "`$1 \cite{lightweight-crypto}"
        Write-Host "   PSK (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.3 Raw Public Key (línea ~603)
for ($i = 601; $i -le 610; $i++) {
    if ($lines[$i] -match "Raw Public Key.*RPK.*Claves p.*blicas ECC" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(overhead vs PKI)", "`$1 \cite{iot-security-trends}"
        Write-Host "   RPK (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.4 X.509 certificates (línea ~604)
for ($i = 602; $i -le 611; $i++) {
    if ($lines[$i] -match "Certificate.*X\\.509.*PKI completa" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(deployments grandes)", "`$1 \cite{iot-security-trends}"
        Write-Host "   X.509 (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.5 Commissioning seguro (línea ~59)
for ($i = 57; $i -le 66; $i++) {
    if ($lines[$i] -match "Commissioning.*Incorporaci.*n segura.*out-of-band authentication" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(out-of-band authentication)", "`$1 \cite{iot-security-trends}"
        Write-Host "   Commissioning (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.6 Firma digital firmware (línea ~559)
for ($i = 557; $i -le 566; $i++) {
    if ($lines[$i] -match "verifica firma digital.*actualiza si v.*lida" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(si v.*lida)", "`$1 \cite{iot-security-trends}"
        Write-Host "   Firma digital (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.7 Checksum/firma integridad (línea ~574)
for ($i = 572; $i -le 581; $i++) {
    if ($lines[$i] -match "Integra verificaci.*n de integridad.*checksum/firma digital" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(firma digital)", "`$1 \cite{iot-security-trends}"
        Write-Host "   Verificación integridad (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.8 AES encryption (buscar referencias a encriptación)
for ($i = 1; $i -le 1574; $i++) {
    if ($lines[$i] -match "AES.*encrypt" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(AES[^.]*)", "`$1 \cite{lightweight-crypto}"
        Write-Host "   AES encryption (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 5.9 Security modes tabla (línea ~611)
for ($i = 609; $i -le 623; $i++) {
    if ($lines[$i] -match "caption\{Overhead de Seguridad LwM2M\}" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(LwM2M\})", "`$1 \cite{oma-lwm2m-v1.2,iot-security-trends}"
        Write-Host "   Security overhead table (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

####################################################################################
# BLOQUE 6: MQTT - Agregar 5 citas
####################################################################################
Write-Host "`n[BLOQUE 6] MQTT - Agregando 5 citas..." -ForegroundColor Magenta

# 6.1 Binding Q MQTT (línea ~596)
for ($i = 594; $i -le 603; $i++) {
    if ($lines[$i] -match "Q.*MQTT.*TLS.*MQTT auth.*Integra" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(brokers existentes)", "`$1 \cite{iot-comprehensive,herrero2023iot-networking}"
        Write-Host "   Binding Q MQTT (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 6.2 MQTT + JSON overhead (línea ~633)
for ($i = 631; $i -le 643; $i++) {
    if ($lines[$i] -match "MQTT.*JSON.*100-300 bytes" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(100-300 bytes)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   MQTT overhead (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 6.3 ThingsBoard (línea ~599)
for ($i = 597; $i -le 606; $i++) {
    if ($lines[$i] -match "ThingsBoard" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(ThingsBoard)", "`$1 \cite{iot-comprehensive}"
        Write-Host "   ThingsBoard (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 6.4 MQTT topics custom (línea ~636)
for ($i = 634; $i -le 644; $i++) {
    if ($lines[$i] -match "Gesti.*n dispositivos.*Nativa.*objects std.*Custom.*topics" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(Custom.*topics)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   MQTT topics (línea $($i+1))" -ForegroundColor Green
        $exitosos++
        break
    }
}

# 6.5 MQTT native subscribe (línea ~639)
for ($i = 637; $i -le 647; $i++) {
    if ($lines[$i] -match "Observe/Subscribe.*Nativo.*thresholds.*MQTT native" -and $lines[$i] -notmatch "\\cite") {
        $lines[$i] = $lines[$i] -replace "(MQTT native)", "`$1 \cite{herrero2023iot-networking}"
        Write-Host "   MQTT subscribe (línea $($i+1))" -ForegroundColor Green
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
Write-Host "         RESUMEN SCRIPT V3              " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "Citas iniciales: $citasIniciales" -ForegroundColor Yellow
Write-Host "Intentos exitosos: $exitosos" -ForegroundColor Green
Write-Host "Citas finales: $citasFinales" -ForegroundColor Yellow
Write-Host "Nuevas citas agregadas: $nuevas`n" -ForegroundColor Green

# Guardar cambios
$lines | Set-Content -Path $file -Encoding UTF8
Write-Host " Archivo guardado exitosamente" -ForegroundColor Green
