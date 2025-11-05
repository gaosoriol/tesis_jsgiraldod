# -*- coding: utf-8 -*-
import re

archivo = '02MarcoTeorico.tex'

# Leer archivo
with open(archivo, 'r', encoding='utf-8') as f:
    contenido = f.read()

# Contador de reemplazos
count = 0

# Smart Grid
contenido = contenido.replace(
    'Las Smart Grids integran tecnologías de información y comunicación (TIC) para monitoreo, control y optimización en tiempo real del flujo eléctrico desde generación hasta consumo final.',
    'Las Smart Grids integran tecnologías de información y comunicación (TIC) para monitoreo, control y optimización en tiempo real del flujo eléctrico desde generación hasta consumo final \\cite{parizad2025smart-vol1,parizad2025smart-vol2}.'
)
count += 1

# Guardar
with open(archivo, 'w', encoding='utf-8') as f:
    f.write(contenido)

print(f'Reemplazos realizados: {count}')
