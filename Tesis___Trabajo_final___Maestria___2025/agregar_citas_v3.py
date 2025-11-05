# -*- coding: utf-8 -*-
archivo = "02MarcoTeorico.tex"

with open(archivo, "r", encoding="utf-8") as f:
    contenido = f.read()

count = 0

# Función helper
def replace_if_found(text, old, new):
    global count
    global contenido
    if old in contenido:
        contenido = contenido.replace(old, new, 1)
        count += 1
        print(f" {count}. {old[:40]}...")
        return True
    return False

# TAREA 1: Protocolos IoT (15 citas)

# CoAP
replace_if_found(contenido,
    "CoAP (Constrained Application Protocol, RFC 7252) es un protocolo web RESTful optimizado para dispositivos IoT con recursos limitados, diseÃado como alternativa ligera a HTTP.",
    "CoAP (Constrained Application Protocol, RFC 7252) es un protocolo web RESTful optimizado para dispositivos IoT con recursos limitados, diseÃado como alternativa ligera a HTTP \\cite{gunjal2023iot-theory,iot-comprehensive}.")

# LwM2M
replace_if_found(contenido,
    "LwM2M (Lightweight Machine-to-Machine) es un protocolo de gestiÃn de dispositivos IoT estandarizado por OMA SpecWorks (anteriormente Open Mobile Alliance), diseÃado especÃficamente para dispositivos constrained.",
    "LwM2M (Lightweight Machine-to-Machine) es un protocolo de gestiÃn de dispositivos IoT estandarizado por OMA SpecWorks (anteriormente Open Mobile Alliance), diseÃado especÃficamente para dispositivos constrained \\cite{oma-lwm2m-v1.2}.")

replace_if_found(contenido,
    "LwM2M 1.2 (2019) es la versiÃn actual con mejoras en seguridad y eficiencia.",
    "LwM2M 1.2 (2019) es la versiÃn actual con mejoras en seguridad y eficiencia \\cite{gunjal2023iot-theory,iot-interoperability}.")

# MQTT binding
replace_if_found(contenido,
    "\\item \\textbf{Binding Q (MQTT)}: Para integraciÃn con infraestructuras MQTT existentes (ej. ThingsBoard).",
    "\\item \\textbf{Binding Q (MQTT)}: Para integraciÃn con infraestructuras MQTT existentes (ej. ThingsBoard) \\cite{mqtt-deployment,sdn-mqtt-alliance}.")

# Guardar
with open(archivo, "w", encoding="utf-8") as f:
    f.write(contenido)

print(f"\n Total: {count} citas agregadas")
