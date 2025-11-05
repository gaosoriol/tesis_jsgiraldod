# Script PowerShell para agregar citas directamente al archivo

$file = '02MarcoTeorico.tex'
$content = Get-Content -Path $file -Raw -Encoding UTF8

# Reemplazo 1: CoAP
$content = $content -replace 
'(CoAP \(Constrained Application Protocol, RFC 7252\) es un protocolo web RESTful optimizado para dispositivos IoT con recursos limitados, diseÃado como alternativa ligera a HTTP)\.',
'$1 \\cite{gunjal2023iot-theory,herrero2023iot-networking}.'

# Reemplazo 2: 6LoWPAN
$content = $content -replace
'(6LoWPAN \(IPv6 over Low-Power Wireless Personal Area Networks\), definido en RFC 6282 y RFC 4944, es una capa de adaptaciÃn que permite la transmisiÃn de paquetes IPv6 sobre redes IEEE 802\.15\.4, superando la limitaciÃn del MTU de 127 bytes mediante compresiÃn de headers y fragmentaciÃn)\.',
'$1 \\cite{gunjal2023iot-theory,iot-comprehensive}.'

# Reemplazo 3: LwM2M
$content = $content -replace
'(LwM2M \(Lightweight Machine-to-Machine\) es un protocolo de gestiÃn de dispositivos IoT estandarizado por OMA SpecWorks \(anteriormente Open Mobile Alliance\), diseÃado especÃficamente para dispositivos constrained)\.',
'$1 \\cite{oma-lwm2m-v1.2,iot-comprehensive}.'

# Guardar cambios
$content | Out-File -FilePath $file -Encoding UTF8 -NoNewline

Write-Host 'Archivo actualizado con 3 citas nuevas'
Write-Host 'Total de citas ahora:'
(Select-String -Path $file -Pattern '\\cite\{').Count
