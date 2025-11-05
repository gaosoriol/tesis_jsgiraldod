# -*- coding: utf-8 -*-
import re

archivo = '02MarcoTeorico.tex'

# Leer con encoding correcto
with open(archivo, 'r', encoding='utf-8') as f:
    contenido = f.read()

count = 0
original_len = len(contenido)

# Lista de reemplazos con el encoding real del archivo (Ã = ó, Ã = í, Ã = á, Ã = é, Ãº = ú)
reemplazos = [
    # 1. Smart Grid Evolution
    ('Las Smart Grids integran tecnologÃas de informaciÃn y comunicaciÃn (TIC) para monitoreo, control y optimizaciÃn en tiempo real del flujo elÃctrico desde generaciÃn hasta consumo final.',
     'Las Smart Grids integran tecnologÃas de informaciÃn y comunicaciÃn (TIC) para monitoreo, control y optimizaciÃn en tiempo real del flujo elÃctrico desde generaciÃn hasta consumo final \\\\cite{parizad2025smart-vol1,parizad2025smart-vol2}.'),
    
    ('Este enfoque permite: integraciÃn masiva de energÃas renovables distribuidas (DER - Distributed Energy Resources), gestiÃn activa de la demanda (DSM - Demand Side Management), detecciÃn y auto-recuperaciÃn de fallas (self-healing), y participaciÃn activa de prosumidores (consumidores que tambiÃn generan energÃa).',
     'Este enfoque permite: integraciÃn masiva de energÃas renovables distribuidas (DER - Distributed Energy Resources), gestiÃn activa de la demanda (DSM - Demand Side Management), detecciÃn y auto-recuperaciÃn de fallas (self-healing), y participaciÃn activa de prosumidores (consumidores que tambiÃn generan energÃa) \\\\cite{smart-grid-sdn,iot-condition-monitoring}.'),
    
    # 2. NIST
    ('SegÃºn el National Institute of Standards and Technology (NIST), una Smart Grid implementa siete dominios interconectados: Bulk Generation, Transmission, Distribution, Customer, Operations, Markets, y Service Provider.',
     'SegÃºn el National Institute of Standards and Technology (NIST), una Smart Grid implementa siete dominios interconectados: Bulk Generation, Transmission, Distribution, Customer, Operations, Markets, y Service Provider \\\\cite{iso30141-2024,iot-comprehensive}.'),
     
    # 3. 6LoWPAN
    ('6LoWPAN (IPv6 over Low-Power Wireless Personal Area Networks), definido en RFC 6282 y RFC 4944, es una capa de adaptaciÃn que permite la transmisiÃn de paquetes IPv6 sobre redes IEEE 802.15.4, superando la limitaciÃn del MTU de 127 bytes mediante compresiÃn de headers y fragmentaciÃn.',
     '6LoWPAN (IPv6 over Low-Power Wireless Personal Area Networks), definido en RFC 6282 y RFC 4944, es una capa de adaptaciÃn que permite la transmisiÃn de paquetes IPv6 sobre redes IEEE 802.15.4 \\\\cite{gunjal2023iot-theory,herrero2023iot-networking}, superando la limitaciÃn del MTU de 127 bytes mediante compresiÃn de headers y fragmentaciÃn.'),
]

# Aplicar reemplazos
for original, nuevo in reemplazos:
    if original in contenido:
        contenido = contenido.replace(original, nuevo)
        count += 1
        print(f' Reemplazo {count}: {original[:50]}...')
    else:
        print(f' No encontrado: {original[:50]}...')

# Guardar
if count > 0:
    with open(archivo, 'w', encoding='utf-8') as f:
        f.write(contenido)
    print(f'\\n Archivo guardado con {count} reemplazos')
else:
    print('\\n No se realizaron cambios')

print(f'Tamaño original: {original_len}, Tamaño final: {len(contenido)}')
