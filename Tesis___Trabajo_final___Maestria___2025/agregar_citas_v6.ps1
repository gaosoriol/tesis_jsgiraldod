# Script V6 - CAPITULO 01 INTRODUCCION

Write-Host "`n" -ForegroundColor Cyan
Write-Host "  SCRIPT V6 - CAPITULO 01 INTRODUCCION  " -ForegroundColor Cyan
Write-Host "`n" -ForegroundColor Cyan

$exitosos = 0
$file01 = "01Introduccion.tex"
$content01 = Get-Content -Path $file01 -Encoding UTF8 -Raw
$citas01Iniciales = ([regex]::Matches($content01, "\\cite\{")).Count
Write-Host "Estado inicial Cap 01: $citas01Iniciales citas`n" -ForegroundColor Yellow

# 1.1 IEA medidores inteligentes
if ($content01 -match "Agencia Internacional de Energía \(IEA\)" -and $content01 -notmatch "IEA\).*?\\cite") {
    $content01 = $content01 -replace "(Según la Agencia Internacional de Energía \(IEA\))", "`$1 \cite{smart-grid-comm}"
    Write-Host "   IEA medidores inteligentes" -ForegroundColor Green
    $exitosos++
}

# 1.2 AMI arquitecturas
if ($content01 -match "infraestructuras de medición inteligente \(AMI - Advanced Metering Infrastructure\)" -and $content01 -notmatch "AMI.*?\\cite") {
    $content01 = $content01 -replace "(infraestructuras de medición inteligente \(AMI - Advanced Metering Infrastructure\))", "`$1 \cite{smart-grid-comm,parizad2025smart-vol1}"
    Write-Host "   AMI infraestructuras" -ForegroundColor Green
    $exitosos++
}

# 1.3 DER energías renovables
if ($content01 -match "energías renovables distribuidas \(DER\)" -and $content01 -notmatch "DER\).*?\\cite") {
    $content01 = $content01 -replace "(energías renovables distribuidas \(DER\))", "`$1 \cite{parizad2025smart-vol1}"
    Write-Host "   DER renovables" -ForegroundColor Green
    $exitosos++
}

# 1.4 DSM gestión demanda
if ($content01 -match "gestión activa de la demanda \(DSM\)" -and $content01 -notmatch "DSM\).*?\\cite") {
    $content01 = $content01 -replace "(gestión activa de la demanda \(DSM\))", "`$1 \cite{parizad2025smart-vol1}"
    Write-Host "   DSM gestión demanda" -ForegroundColor Green
    $exitosos++
}

# 1.5 Thread protocolo
if ($content01 -match "Thread emerge como protocolo preferencial" -and $content01 -notmatch "Thread emerge.*?\\cite") {
    $content01 = $content01 -replace "(Thread emerge como protocolo preferencial para redes de campo en Smart Energy)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Thread protocolo preferencial" -ForegroundColor Green
    $exitosos++
}

# 1.6 Thread Group CSA
if ($content01 -match "Thread Group \(miembro de Connectivity Standards Alliance\)" -and $content01 -notmatch "Connectivity Standards Alliance\).*?\\cite") {
    $content01 = $content01 -replace "(Thread Group \(miembro de Connectivity Standards Alliance\))", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Thread Group CSA" -ForegroundColor Green
    $exitosos++
}

# 1.7 6LoWPAN
if ($content01 -match "routing IPv6 nativo.*?6LoWPAN" -and $content01 -notmatch "6LoWPAN\).*?\\cite") {
    $content01 = $content01 -replace "(routing IPv6 nativo, que facilita integración con infraestructuras IP existentes)", "`$1 \cite{herrero2023iot-networking}"
    Write-Host "   Routing IPv6 nativo" -ForegroundColor Green
    $exitosos++
}

# 1.8 ThingsBoard Edge
if ($content01 -match "ThingsBoard Edge se posiciona como solución robusta" -and $content01 -notmatch "ThingsBoard Edge se posiciona.*?\\cite") {
    $content01 = $content01 -replace "(ThingsBoard Edge se posiciona como solución robusta para aplicaciones industriales)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   ThingsBoard Edge" -ForegroundColor Green
    $exitosos++
}

# 1.9 Rule engine local
if ($content01 -match "capacidades completas de rule engine" -and $content01 -notmatch "rule engine.*?\\cite") {
    $content01 = $content01 -replace "(capacidades completas de rule engine, dashboards interactivos)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   Rule engine capacidades" -ForegroundColor Green
    $exitosos++
}

# 1.10 HaLow alcance
if ($content01 -match "Wi-Fi HaLow combina throughput superior a LoRaWAN" -and $content01 -notmatch "Wi-Fi HaLow combina.*?\\cite") {
    $content01 = $content01 -replace "(Wi-Fi HaLow combina throughput superior a LoRaWAN \(40 Mbps vs 50 kbps\))", "`$1 \cite{halow2024survey,halow-iot-wireless}"
    Write-Host "   HaLow throughput" -ForegroundColor Green
    $exitosos++
}

# 1.11 HaLow latencia
if ($content01 -match "latencia determinística \(<30 ms vs 1-5 seg\)" -and $content01 -notmatch "latencia determinística.*?\\cite") {
    $content01 = $content01 -replace "(latencia determinística \(<30 ms vs 1-5 seg\))", "`$1 \cite{halow2024survey}"
    Write-Host "   HaLow latencia" -ForegroundColor Green
    $exitosos++
}

# 1.12 HaLow Smart Energy
if ($content01 -match "backhaul de gateways Smart Energy" -and $content01 -notmatch "gateways Smart Energy.*?\\cite") {
    $content01 = $content01 -replace "(backhaul de gateways Smart Energy en zonas urbanas y suburbanas densas)", "`$1 \cite{halow-smart-grid}"
    Write-Host "   HaLow Smart Energy backhaul" -ForegroundColor Green
    $exitosos++
}

# 1.13 IoT security
if ($content01 -match "Ausencia de estándares de interoperabilidad" -and $content01 -notmatch "interoperabilidad.*?\\cite") {
    $content01 = $content01 -replace "(Ausencia de estándares de interoperabilidad): La mayoría de soluciones comerciales implementan APIs propietarias", "`$1: La mayoría de soluciones comerciales implementan APIs propietarias \cite{iot-comprehensive}"
    Write-Host "   Interoperabilidad APIs" -ForegroundColor Green
    $exitosos++
}

# 1.14 Edge Computing latencia
if ($content01 -match "traductores application-layer.*?latencias acumuladas de 150-300 ms" -and $content01 -notmatch "150-300 ms.*?\\cite") {
    $content01 = $content01 -replace "(latencias acumuladas de 150-300 ms)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   Latencias multi-protocolo" -ForegroundColor Green
    $exitosos++
}

# 1.15 Edge arquitecturas
if ($content01 -match "arquitecturas dispositivo  cloud presentan Single Points of Failure" -and $content01 -notmatch "Single Points of Failure.*?\\cite") {
    $content01 = $content01 -replace "(Single Points of Failure \(SPOF\) en enlaces WAN)", "`$1 \cite{iot-comprehensive}"
    Write-Host "   SPOF enlaces WAN" -ForegroundColor Green
    $exitosos++
}

####################################################################################
# RESUMEN
####################################################################################
$citas01Finales = ([regex]::Matches($content01, "\\cite\{")).Count
$nuevas01 = $citas01Finales - $citas01Iniciales

Write-Host "`n" -ForegroundColor Cyan
Write-Host "         RESUMEN SCRIPT V6              " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "`nCapítulo 01 (Introducción):" -ForegroundColor Yellow
Write-Host "  Citas iniciales: $citas01Iniciales" -ForegroundColor White
Write-Host "  Citas finales: $citas01Finales" -ForegroundColor White
Write-Host "  Nuevas agregadas: $nuevas01" -ForegroundColor Green
Write-Host "`nTotal intentos exitosos: $exitosos" -ForegroundColor Green
Write-Host "Total nuevas citas: $nuevas01`n" -ForegroundColor Green

# Guardar cambios
$content01 | Set-Content -Path $file01 -Encoding UTF8 -NoNewline
Write-Host " Archivo guardado exitosamente`n" -ForegroundColor Green
