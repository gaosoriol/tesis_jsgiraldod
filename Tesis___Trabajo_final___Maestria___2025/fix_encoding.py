# -*- coding: utf-8 -*-
import os
import glob

# Encontrar todos los archivos .tex
archivos_tex = glob.glob("*.tex")

print(f"Encontrados {len(archivos_tex)} archivos .tex")

for archivo in archivos_tex:
    print(f"\nProcesando: {archivo}")
    
    try:
        # Intentar leer con diferentes codificaciones
        contenido = None
        
        # Primero intentar UTF-8
        try:
            with open(archivo, 'r', encoding='utf-8') as f:
                contenido = f.read()
        except:
            pass
        
        # Si no funciona, intentar con latin-1
        if contenido is None:
            try:
                with open(archivo, 'r', encoding='latin-1') as f:
                    contenido = f.read()
            except:
                pass
        
        if contenido:
            # Guardar como UTF-8
            with open(archivo, 'w', encoding='utf-8') as f:
                f.write(contenido)
            print(f"  ✓ Corregido!")
        else:
            print(f"  ✗ Error al leer archivo")
            
    except Exception as e:
        print(f"  ✗ Error: {e}")

print("\n¡Proceso completado!")
