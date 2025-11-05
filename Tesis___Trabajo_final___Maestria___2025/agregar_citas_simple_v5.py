import sys
sys.stdout.reconfigure(encoding='utf-8')

# Leer archivo
with open('02MarcoTeorico.tex', 'r', encoding='utf-8') as f:
    content = f.read()

# Reemplazo 1: CoAP (línea 258)
old1 = 'CoAP (Constrained Application Protocol, RFC 7252) es un protocolo web RESTful optimizado para dispositivos IoT con recursos limitados, diseñado como alternativa ligera a HTTP.'
new1 = old1[:-1] + ' \\cite{gunjal2023iot-theory,herrero2023iot-networking}.'
if old1 in content:
    content = content.replace(old1, new1)
    print(' Cita 1 CoAP agregada')
else:
    print(' No encontrado CoAP')

# Reemplazo 2: 6LoWPAN (línea 120)
old2 = '6LoWPAN (IPv6 over Low-Power Wireless Personal Area Networks), definido en RFC 6282 y RFC 4944, es una capa de adaptación que permite la transmisión de paquetes IPv6 sobre redes IEEE 802.15.4, superando la limitación del MTU de 127 bytes mediante compresión de headers y fragmentación.'
new2 = old2[:-1] + ' \\cite{gunjal2023iot-theory,iot-comprehensive}.'
if old2 in content:
    content = content.replace(old2, new2)
    print(' Cita 2 6LoWPAN agregada')
else:
    print(' No encontrado 6LoWPAN')

# Reemplazo 3: LwM2M (línea 413)
old3 = 'LwM2M (Lightweight Machine-to-Machine) es un protocolo de gestión de dispositivos IoT estandarizado por OMA SpecWorks (anteriormente Open Mobile Alliance), diseñado específicamente para dispositivos constrained.'
new3 = old3[:-1] + ' \\cite{oma-lwm2m-v1.2,iot-comprehensive}.'
if old3 in content:
    content = content.replace(old3, new3)
    print(' Cita 3 LwM2M agregada')
else:
    print(' No encontrado LwM2M')

# Guardar
with open('02MarcoTeorico.tex', 'w', encoding='utf-8') as f:
    f.write(content)

print(f'\nTotal de citas ahora: {content.count("\\cite{")}')
