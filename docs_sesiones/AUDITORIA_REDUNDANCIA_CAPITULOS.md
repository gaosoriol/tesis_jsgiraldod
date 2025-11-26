# 🔍 AUDITORÍA DE REDUNDANCIA Y CONTENIDO A ELIMINAR

**Fecha:** Noviembre 26, 2025  
**Objetivo:** Acotar la tesis eliminando redundancia entre capítulos  
**Meta:** Pasar de 326 páginas a ~250 páginas (reducción 23%)

---

## 📊 ESTADO ACTUAL DE CAPÍTULOS

| Capítulo | Páginas Est. | Secciones | Subsecciones | Estado |
|----------|--------------|-----------|--------------|--------|
| Cap 1 - Introducción | 20 | 8 | 20 | ✅ Bien acotado |
| Cap 2 - Marco Teórico | 50 | 4 | 24 | ⚠️ SOBRECARGADO |
| Cap 3 - Arquitectura | 90 | 15 | 53 | ⚠️ SOBRECARGADO |
| Cap 4 - Implementación | 40 | 10 | 23 | ✅ Bien estructurado |
| Cap 5 - Resultados | 30 | 7 | 27 | ✅ OK |
| Cap 6 - Conclusiones | 40 | 9 | 29 | ⚠️ Revisable |
| Anexos (7) | 56 | 7 | - | ✅ Necesarios |

**Total actual:** ~326 páginas

---

## 🎯 PROPUESTA DE NUEVA ESTRUCTURA (ACOTADA)

### **Capítulo 1: Introducción** (20 págs) - SIN CAMBIOS
```
1.1. Contexto y Motivación
1.2. Planteamiento del Problema
1.3. Justificación
1.4. Objetivos de la Investigación
1.5. Alcance y Delimitación
```
**Acción:** ✅ Mantener como está

---

### **Capítulo 2: Marco Teórico** (30 págs) - REDUCIR 40%
**Actual: 50 páginas, 24 subsecciones**  
**Propuesto: 30 páginas, 12 subsecciones**

#### 📌 ESTRUCTURA PROPUESTA (TU ESQUEMA):

**2.1. Ecosistema de Estandarización para Smart Energy**
- 2.1.1. Arquitectura de Referencia Smart Grid (NIST y IEEE 2030.5) ✅ MANTENER
- 2.1.2. Marco de Interoperabilidad IoT (ISO/IEC 30141:2024) ✅ MANTENER

**2.2. Tecnologías de Red de Campo (Field Area Networks)**
- 2.2.1. Pila de protocolos IPv6 sobre redes restringidas (6LoWPAN) ✅ MANTENER
- 2.2.2. Thread: Malla segura y direccionable para dispositivos finales ✅ MANTENER

**2.3. Tecnologías de Backhaul y Largo Alcance**
- 2.3.1. IEEE 802.11ah (Wi-Fi HaLow): Características y ventajas en sub-1 GHz ✅ MANTENER

**2.4. Computación en el Borde (Edge Computing)**
- 2.4.1. Arquitecturas distribuidas y procesamiento local ✅ MANTENER
- 2.4.2. Agentes de IA y Modelos de Lenguaje (LLM) en el borde ✅ MANTENER

#### ❌ CONTENIDO A ELIMINAR DEL CAP 2 (REDUNDANTE O DEMASIADO TÉCNICO):

**ELIMINAR COMPLETAMENTE:**

1. **2.X "Evolución de las Infraestructuras Eléctricas"** (líneas 9-14)
   - Razón: Historia no aporta, va directo a estándares actuales
   - Acción: Reducir a 1 párrafo introductorio en 2.1

2. **2.X "Análisis Crítico de Estándares y Trade-offs"** (líneas 140-222)
   - Razón: Este análisis pertenece a Cap 3 (Diseño de Arquitectura)
   - Acción: Mover tablas comparativas a 3.1.2

3. **2.X "IEC 61850 - Comunicación en Subestaciones"** (líneas 223-228)
   - Razón: NO se usa IEC 61850 en la implementación (usas IEEE 2030.5)
   - Acción: ELIMINAR completamente

4. **2.X "Síntesis de Estándares y Transición a Tecnologías por Nivel"** (línea 229)
   - Razón: Redundante, ya está en introducción del capítulo
   - Acción: ELIMINAR

5. **2.2.X "Visión General de la Pila de Protocolos"** (líneas 239-282)
   - Razón: Diagrama genérico, mejor en Cap 3 específico de tu arquitectura
   - Acción: Mover figura a 3.2.2, eliminar texto genérico

6. **2.2.X "Capa Física y Enlace: IEEE 802.15.4"** - DETALLES TÉCNICOS (líneas 283-295)
   - Razón: Demasiado detalle (modulación OQPSK, timings, etc.) para marco teórico
   - Acción: Reducir a 1 párrafo: "IEEE 802.15.4 provee capa física 250 kbps @ 2.4 GHz"

7. **2.2.X "6LoWPAN"** - TABLAS DE COMPRESIÓN NHC/IPHC (líneas 296-427)
   - Razón: Tablas con detalles de headers pertenecen a Cap 5 (Resultados)
   - Mantener: Solo concepto de compresión y beneficio (de 40 bytes IPv6 a 10-15 bytes)
   - Acción: Eliminar tablas detalladas, mover a Anexo D si necesario

8. **2.2.X "CoAP"** - DETALLES DE MÉTODOS Y CÓDIGOS (líneas 428-476)
   - Razón: Tabla de códigos CoAP (GET/POST/PUT/DELETE) es documentación técnica
   - Mantener: Solo concepto "CoAP es HTTP restringido sobre UDP"
   - Acción: Eliminar tabla de métodos

9. **2.2.X "LwM2M"** - OBJETOS OMA DETALLADOS (líneas 477-580)
   - Razón: Tabla de objetos LwM2M (Device/Server/Firmware) es especificación
   - Mantener: Solo "LwM2M provee gestión remota (FOTA, bootstrap, registro)"
   - Acción: Eliminar tabla de objetos, mover a Anexo D

10. **2.2.X "Síntesis del Stack y Transición a Edge Computing"** (líneas 581-586)
    - Razón: Redundante
    - Acción: ELIMINAR

11. **2.2.X "Stacks Comerciales: Wi-SUN y Thread"** - COMPARATIVA DETALLADA (líneas 587-677)
    - Razón: Tabla comparativa de 20 parámetros entre Wi-SUN/Thread/Zigbee
    - Mantener: Solo 1 párrafo justificando elección de Thread
    - Acción: Eliminar tabla completa (no usas Wi-SUN ni Zigbee)

12. **2.3.X "Fibra Óptica FTTN/FTTC - Capacidad Ilimitada"** (líneas 682-696)
    - Razón: Detalles de GPON/XGS-PON no aportan (solo mencionas fibra como backhaul)
    - Mantener: Solo "Fibra provee 10 Gbps simétricos, latencia <1 ms"
    - Acción: Eliminar detalles de PON/OLT/ONT

13. **2.3.X "Wi-Fi HaLow"** - DEMASIADO DETALLE (líneas 697-713)
    - Razón: Tablas de modulación MCS0-MCS10, bandwidth 1/2/4/8 MHz
    - Mantener: Concepto "HaLow: 1 km alcance, 40 Mbps max, sub-1 GHz"
    - Acción: Mover tabla MCS completa a Anexo C, reducir a 1 párrafo

14. **2.3.X "Síntesis de Tecnologías Nivel 2"** (línea 714)
    - Razón: Redundante
    - Acción: ELIMINAR

15. **2.4.X "Containerización con Docker"** - COMANDOS Y YAML (líneas 722-769)
    - Razón: Comandos `docker-compose up -d`, snippets YAML son implementación
    - Mantener: Solo concepto "Docker permite microservicios aislados"
    - Acción: Mover ejemplos YAML a Cap 4 o Anexo B

16. **2.4.X "Time-Series Databases - TimescaleDB"** - QUERIES SQL (líneas 770-815)
    - Razón: Ejemplos SQL con `CREATE EXTENSION` y queries de compresión
    - Mantener: Solo "TimescaleDB comprime series temporales 10-20×"
    - Acción: Mover queries a Anexo B (Docker Compose)

17. **2.4.X "Message Brokers - Apache Kafka"** - CONFIGURACIÓN (líneas 816-840)
    - Razón: Parámetros de configuración (partitions, replication.factor)
    - Mantener: Solo "Kafka provee buffer persistente 7 días"
    - Acción: Mover config a Anexo B

18. **2.4.X "Plataforma IoT Edge - ThingsBoard"** - SCREENSHOTS Y DASHBOARDS (líneas 841-1008)
    - Razón: Descripción de UI, widgets, reglas es documentación del producto
    - Mantener: Solo "ThingsBoard Edge provee CEP, dashboards y APIs REST"
    - Acción: Mover detalles de Rule Engine a Cap 4

**RESUMEN ELIMINACIONES CAP 2:**
- De 1008 líneas → ~400 líneas (60% reducción)
- De 24 subsecciones → 7 subsecciones
- De 50 páginas → 30 páginas

---

### **Capítulo 3: Arquitectura del Sistema** (50 págs) - REDUCIR 44%
**Actual: 90 páginas, 15 secciones**  
**Propuesto: 50 páginas, 8 secciones**

#### 📌 ESTRUCTURA PROPUESTA (TU ESQUEMA):

**3.1. Visión General de la Arquitectura Multinivel Propuesta**
- 3.1.1. Topología de Red y Diagrama de Bloques ✅ MANTENER
- 3.1.2. Mapeo con Modelo de Referencia IoT (ISO 30141) ✅ MANTENER

**3.2. Nivel 1: Capa de Dispositivos y Red de Campo (Thread)**
- 3.2.1. Diseño de Nodos con ESP32-C6 y stack 6LoWPAN ✅ MANTENER
- 3.2.2. Modelo de Datos y Perfiles de Energía (DLMS/COSEM sobre CoAP) ✅ MANTENER

**3.3. Nivel 2: Infraestructura de Backhaul (Wi-Fi HaLow)**
- 3.3.1. Diseño del enlace 802.11ah para cobertura extendida ✅ MANTENER
- 3.3.2. Estrategia de coexistencia espectral ✅ MANTENER

**3.4. Nivel 3: Pasarela de Borde Inteligente (Edge Gateway)**
- 3.4.1. Arquitectura de Servicios en el Gateway (Microservicios) ✅ MANTENER
- 3.4.2. Diseño de Seguridad y Cifrado (NIST Cybersecurity Framework) ✅ MANTENER

**3.5. Nivel 4: Plataforma Central (ThingsBoard Cloud)**
- 3.5.1. Arquitectura Cloud y APIs ✅ MANTENER

#### ❌ CONTENIDO A ELIMINAR/MOVER DEL CAP 3:

**MOVER A CAP 5 (RESULTADOS):**

1. **3.X "Análisis Energético End-to-End"** (líneas 1734-1899)
   - Razón: Cálculos de consumo, tablas de mW por componente son RESULTADOS
   - Acción: Mover completo a 5.2 (Evaluación Energética)

2. **3.X "Caso de Estudio: Despliegue en Smart Energy"** (líneas 1900-2276)
   - Razón: Descripción de piloto de 30 medidores × 90 días es VALIDACIÓN
   - Acción: Mover completo a 5.1 (Setup Experimental del Piloto)

3. **3.X "Análisis de Costos"** (líneas 2277-2418)
   - Razón: BOM con precios, CAPEX/OPEX, TCO son RESULTADOS económicos
   - Acción: Mover completo a 5.3 (Análisis Económico y Viabilidad)

4. **3.X "Métricas de Desempeño"** (líneas 2419-2552)
   - Razón: Latencia medida (8±2 ms), throughput, PDR son RESULTADOS
   - Acción: Mover completo a 5.1 (Análisis de Desempeño de la Red)

5. **3.X "Escalabilidad"** (líneas 2553-2620)
   - Razón: Pruebas de carga, capacidad máxima son VALIDACIÓN
   - Acción: Mover completo a 5.4 (Pruebas de Escalabilidad y Carga)

**MOVER A CAP 6 (CONCLUSIONES):**

6. **3.X "Trabajos Futuros y Mejoras"** (líneas 2621-2630)
   - Razón: Pertenece a Cap 6
   - Acción: Mover a 6.4 (Trabajo Futuro)

7. **3.X "Limitaciones del Trabajo"** (líneas 2631-2692)
   - Razón: Pertenece a Cap 6
   - Acción: Mover a 6.3 (Limitaciones Identificadas)

**ELIMINAR COMPLETAMENTE:**

8. **3.X "Análisis de Protocolos de Comunicación"** (líneas 292-683)
   - Razón: 391 líneas repitiendo Cap 2 (CoAP, MQTT, LwM2M)
   - Acción: ELIMINAR - Ya cubierto en 2.2

9. **3.X "Conclusiones del Capítulo"** (línea 2693)
   - Razón: No necesario en capítulo intermedio
   - Acción: ELIMINAR

**RESUMEN ELIMINACIONES CAP 3:**
- De 2180 líneas → ~1000 líneas (54% reducción)
- De 15 secciones → 5 secciones
- De 90 páginas → 50 páginas

---

### **Capítulo 4: Implementación** (40 págs) - MANTENER + AGREGAR FIBRA
**Actual: 40 páginas, 10 secciones**  
**Propuesto: 45 páginas, 9 secciones (agregar Fibra + TB on-premise)**

#### 📌 ESTRUCTURA PROPUESTA (TU ESQUEMA):

**4.1. Entorno de Desarrollo y Materiales**
- 4.1.1. Hardware: Raspberry Pi 4, Módulos MM6108, ESP32-C6 ✅ MANTENER
- **4.1.2. Infraestructura Fibra + ThingsBoard On-Premise** ➕ AGREGAR

**4.2. Implementación de la Red de Sensores (Thread)**
- 4.2.1. Configuración del Open Thread Border Router (OTBR) ✅ MANTENER
- 4.2.2. Desarrollo de firmware para telemetría energética ✅ MANTENER

**4.3. Implementación del Gateway de Borde**
- 4.3.1. Despliegue de ThingsBoard Edge en Raspberry Pi 4 ✅ MANTENER
- 4.3.2. Configuración de OpenWRT y bridging de interfaces ✅ MANTENER
- 4.3.3. Integración de IA: Ollama y Agentes MCP ✅ MANTENER

**4.4. Integración Cloud y Visualización**
- 4.4.1. Sincronización Edge-to-Cloud con ThingsBoard ✅ MANTENER

**Acción:** Solo agregar 4.1.2 con fibra + TB on-premise

---

### **Capítulo 5: Resultados** (60 págs) - CONSOLIDAR CONTENIDO DE CAP 3
**Actual: 30 páginas, 7 secciones**  
**Propuesto: 60 páginas, 6 secciones (+ contenido de Cap 3)**

#### 📌 ESTRUCTURA PROPUESTA (TU ESQUEMA):

**5.1. Análisis de Desempeño de la Red (QoS)**
- 5.1.1. Latencia End-to-End: Thread vs. HaLow ✅ MANTENER
- 5.1.2. Tasa de entrega de paquetes (PDR) ✅ MANTENER
- **+ Contenido de Cap 3 "Métricas de Desempeño"** ➕ AGREGAR

**5.2. Evaluación Energética**
- 5.2.1. Perfil de consumo en nodos alimentados por batería ✅ MANTENER
- 5.2.2. Eficiencia del chipset Morse Micro MM6108 ✅ MANTENER
- **+ Contenido de Cap 3 "Análisis Energético End-to-End"** ➕ AGREGAR

**5.3. Análisis Económico y de Viabilidad**
- 5.3.1. Modelo de Costos CAPEX/OPEX (10k nodos) ✅ MANTENER
- 5.3.2. Análisis de ROI frente a LTE/LoRa ✅ MANTENER
- **+ Contenido de Cap 3 "Análisis de Costos"** ➕ AGREGAR

**5.4. Pruebas de Escalabilidad y Carga**
- 5.4.1. Comportamiento con múltiples medidores ✅ MANTENER
- **+ Contenido de Cap 3 "Escalabilidad"** ➕ AGREGAR

**5.5. Setup Experimental del Piloto**
- **+ Contenido de Cap 3 "Caso de Estudio"** ➕ AGREGAR

**5.6. Discusión de Resultados**
- 5.6.1. Comparación con el Estado del Arte ✅ MANTENER

**RESUMEN CAP 5:**
- De 566 líneas → ~1200 líneas (integra contenido Cap 3)
- De 30 páginas → 60 páginas

---

### **Capítulo 6: Conclusiones** (30 págs) - CONSOLIDAR DESDE CAP 3
**Actual: 40 páginas, 9 secciones**  
**Propuesto: 30 páginas, 4 secciones (simplificar)**

#### 📌 ESTRUCTURA PROPUESTA (TU ESQUEMA):

**6.1. Conclusiones Generales** ✅ MANTENER

**6.2. Contribuciones a la Industria y Academia** ✅ MANTENER

**6.3. Limitaciones Identificadas**
- **+ Contenido de Cap 3 "Limitaciones del Trabajo"** ➕ AGREGAR

**6.4. Recomendaciones y Trabajo Futuro (Roadmap 2026-2030)**
- **+ Contenido de Cap 3 "Trabajos Futuros"** ➕ AGREGAR

**ELIMINAR:**
- Subsecciones redundantes sobre cada hipótesis (ya validadas en Cap 5)
- Reducir de 29 subsecciones a ~10 subsecciones

**RESUMEN CAP 6:**
- De 1124 líneas → ~600 líneas (47% reducción)
- De 40 páginas → 30 páginas

---

## 📊 RESUMEN GLOBAL DE CAMBIOS

| Capítulo | Antes | Después | Cambio | Acción Principal |
|----------|-------|---------|--------|------------------|
| Cap 1 | 20 p | 20 p | 0% | Sin cambios |
| Cap 2 | 50 p | 30 p | **-40%** | Eliminar detalles técnicos |
| Cap 3 | 90 p | 50 p | **-44%** | Mover resultados a Cap 5 |
| Cap 4 | 40 p | 45 p | +12% | Agregar Fibra + TB on-premise |
| Cap 5 | 30 p | 60 p | +100% | Consolidar métricas de Cap 3 |
| Cap 6 | 40 p | 30 p | **-25%** | Simplificar, integrar de Cap 3 |
| Anexos | 56 p | 56 p | 0% | Sin cambios |

**TOTAL: 326 páginas → 291 páginas (reducción 11%)**

---

## 🎯 PLAN DE EJECUCIÓN

### Fase 1: Backup y Preparación
- [x] Crear rama git `refactor_estructura_acotada`
- [ ] Backup de archivos originales

### Fase 2: Cap 2 - Marco Teórico (PRIORIDAD 1)
- [ ] Eliminar secciones 1-18 listadas arriba
- [ ] Reducir de 1008 líneas a ~400 líneas
- [ ] Crear `02MarcoTeorico_REFACTORED.tex`

### Fase 3: Cap 3 - Arquitectura (PRIORIDAD 2)
- [ ] Mover secciones a Cap 5 (costos, métricas, escalabilidad)
- [ ] Mover secciones a Cap 6 (trabajos futuros, limitaciones)
- [ ] Eliminar redundancia con Cap 2
- [ ] Crear `03Arquitectura_REFACTORED.tex`

### Fase 4: Cap 5 - Resultados (PRIORIDAD 3)
- [ ] Integrar contenido movido desde Cap 3
- [ ] Reorganizar en 6 secciones principales
- [ ] Crear `05Resultados_REFACTORED.tex`

### Fase 5: Cap 4 - Implementación (PRIORIDAD 4)
- [ ] Agregar sección 4.1.2: Fibra + ThingsBoard On-Premise
- [ ] Diagrama de red fibra
- [ ] Comparativa AWS vs. On-Premise

### Fase 6: Cap 6 - Conclusiones (PRIORIDAD 5)
- [ ] Integrar limitaciones y trabajo futuro desde Cap 3
- [ ] Simplificar subsecciones
- [ ] Crear `06Conclusiones_REFACTORED.tex`

### Fase 7: Compilación y Validación
- [ ] Actualizar `0000.tex` con nuevos archivos
- [ ] Compilar PDF completo
- [ ] Verificar ~290 páginas (target: 250-300)
- [ ] Commit final

---

## 📝 PREGUNTAS PARA EL USUARIO

1. **Fibra + ThingsBoard On-Premise:** ¿Tienes diagrama de red fibra? ¿Comparativa de costos vs AWS?

2. **Nivel de agresividad:** ¿OK con eliminar 60% del Cap 2? (de 50 a 30 páginas)

3. **Prioridad:** ¿Empezamos con Cap 2 (marco teórico) o Cap 3 (arquitectura)?

4. **Anexos:** ¿Movemos tablas técnicas eliminadas a anexos o eliminamos completamente?

5. **Target final:** ¿290 páginas OK o quieres reducir más (a 250 páginas)?

---

**Generado:** Noviembre 26, 2025  
**Próxima acción:** Esperar confirmación para ejecutar Fase 2 (Cap 2 refactorizado)
