# Catálogo de Figuras y Tablas - Tesis Maestría

**Fecha de generación:** 2025-11-13  
**Total de elementos:** 66 captions identificados  
**Estado:** En proceso de mejora y validación

---

## 📊 Resumen Estadístico

- **Tablas identificadas:** ~50
- **Figuras identificadas:** ~16
- **Captions mejorados:** 0/66 (0%)
- **Figuras faltantes (TODO):** 2 detectadas
- **Diagramas disponibles:** tesis.drawio

---

## 🎯 Plan de Mejora de Visualización

### Fase 1: Integración de Diagramas Draw.io ✓
- [ ] Exportar diagramas de `tesis.drawio` a PNG/PDF (300 DPI)
- [ ] Integrar diagrama arquitectura completa en Cap 4 (Fig 4.1)
- [ ] Crear diagrama de flujo de datos multi-protocolo para Cap 3
- [ ] Generar diagrama de despliegue ISO/IEC 30141

### Fase 2: Creación de Gráficos Experimentales
- [ ] Gráfico latencia end-to-end (matplotlib/pgfplots)
- [ ] Gráfico consumo energético por escenario HaLow
- [ ] Gráfico throughput vs densidad de nodos
- [ ] Gráfico comparativo TCO cloud vs edge (5 años)

### Fase 3: Mejora de Captions
- [ ] Añadir contexto descriptivo a todos los captions
- [ ] Incluir variables medidas y condiciones experimentales
- [ ] Referenciar figuras/tablas desde texto narrativo
- [ ] Validar numeración consistente (X.Y format)

---

## 📋 Catálogo por Capítulo

### Capítulo 1: Introducción (4 tablas)

**Tabla 1.1: Comparación de protocolos mesh 2.4 GHz para IoT**
- **Ubicación:** `01Introduccion.tex` línea 26
- **Caption actual:** "Comparación de protocolos mesh 2.4 GHz para IoT (Thread, Zigbee, Bluetooth Mesh)"
- **Estado:** ⚠️ Caption básico, falta contexto
- **Mejora sugerida:** "Comparación de protocolos mesh 2.4 GHz para Smart Energy IoT: Thread, Zigbee y Bluetooth Mesh. Evaluación de latencia, throughput, alcance y conformidad con estándares IEEE 2030.5 e ISO/IEC 30141."

**Tabla 1.2: Comparación de plataformas edge IoT**
- **Ubicación:** `01Introduccion.tex` línea 65
- **Caption actual:** "Comparación de plataformas edge IoT para procesamiento distribuido"
- **Estado:** ⚠️ Genérico
- **Mejora sugerida:** "Comparación de plataformas edge computing para gateways Smart Energy: AWS IoT Greengrass, Azure IoT Edge, ThingsBoard Edge. Métricas: overhead de memoria, latencia de procesamiento local, costos recurrentes SaaS."

**Tabla 1.3: Comparación de tecnologías última milla**
- **Ubicación:** `01Introduccion.tex` línea 102
- **Caption actual:** "Comparación de tecnologías última milla para Smart Energy"
- **Estado:** ⚠️ Falta contexto de evaluación
- **Mejora sugerida:** "Comparación de tecnologías de backhaul para Smart Energy IoT: Wi-Fi HaLow (802.11ah), LoRaWAN, NB-IoT, LTE Cat-M1. Criterios: alcance, throughput, latencia, espectro licenciado/no licenciado, costos operativos."

**Tabla 1.4: Latencia end-to-end por arquitectura**
- **Ubicación:** `01Introduccion.tex` línea 155
- **Caption actual:** "Latencia end-to-end por arquitectura (device → cloud storage)"
- **Estado:** ⚠️ Falta descripción de escenarios
- **Mejora sugerida:** "Latencia end-to-end medida desde nodo Thread hasta almacenamiento cloud/edge (device → gateway → storage). Comparación: arquitectura cloud-only vs edge-first propuesta. Mediciones: n=1000 muestras, intervalo confianza 95%."

---

### Capítulo 2: Marco Teórico (13 tablas)

**Tabla 2.1: Stack de protocolos 6LoWPAN/CoAP/LwM2M**
- **Ubicación:** `02MarcoTeorico.tex` línea 34
- **Caption actual:** "Stack de protocolos 6LoWPAN/CoAP/LwM2M para IoT Smart Energy"
- **Estado:** ✅ Adecuado
- **Mejora sugerida:** "Stack de protocolos IoT para Smart Energy: capas Physical/MAC (IEEE 802.15.4), Network (6LoWPAN), Transport (UDP), Application (CoAP/LwM2M). Comparación overhead vs TCP/IP tradicional."

**Tabla 2.2: Compresión IPHC de Header IPv6**
- **Ubicación:** `02MarcoTeorico.tex` línea 172
- **Caption actual:** "Compresión IPHC de Header IPv6 para Smart Energy IoT"
- **Estado:** ⚠️ Falta porcentajes de reducción
- **Mejora sugerida:** "Compresión IPHC (RFC 6282) de headers IPv6 en redes 802.15.4: reducción de 40 bytes a 2-7 bytes (82.5-95%). Contexto: direcciones link-local, multicast, y context-based compression en redes Thread."

**Tabla 2.3: Compresión NHC de Header UDP**
- **Ubicación:** `02MarcoTeorico.tex` línea 210
- **Caption actual:** "Compresión NHC de Header UDP para Smart Energy CoAP"
- **Estado:** ⚠️ Falta especificación de puertos
- **Mejora sugerida:** "Compresión NHC (Next Header Compression) de headers UDP/CoAP: reducción de 8 bytes a 1-2 bytes (75-87.5%). Compresión de puertos CoAP (rango 61616-61631) y eliminación de length/checksum redundantes."

**Tabla 2.4: Latencia por Hop 6LoWPAN**
- **Ubicación:** `02MarcoTeorico.tex` línea 266
- **Caption actual:** "Latencia por Hop con/sin Compresión 6LoWPAN para Smart Energy"
- **Estado:** ⚠️ Falta condiciones experimentales
- **Mejora sugerida:** "Latencia por hop en redes Thread con/sin compresión 6LoWPAN. Escenario: topología mesh 5 hops, PHY 802.15.4 @ 250 kbps. Reducción de latencia: 71% (7.7 ms → 2.2 ms) mediante IPHC+NHC."

**Tabla 2.5: Tabla de routing Thread**
- **Ubicación:** `02MarcoTeorico.tex` línea 332
- **Caption actual:** "Ejemplo de tabla de routing Thread para Smart Energy"
- **Estado:** ⚠️ Falta descripción de campos
- **Mejora sugerida:** "Ejemplo de tabla de routing Thread para red Smart Energy. Campos: Destination (nodo destino), Next Hop (próximo salto), Path Cost (métrica LQI), LQI (Link Quality Indicator 0-255), Age (segundos desde última actualización MLE)."

**Tabla 2.6: Comparación protocolos mesh 2.4 GHz**
- **Ubicación:** `02MarcoTeorico.tex` línea 363
- **Caption actual:** "Comparación de protocolos mesh 2.4 GHz para Smart Energy"
- **Estado:** ⚠️ Duplicado con Cap 1, consolidar
- **Mejora sugerida:** "Comparación técnica protocolos mesh 2.4 GHz: Thread 1.3.1, Zigbee 3.0, Bluetooth Mesh. Criterios: stack routing (IPv6 vs propietario), hop limit, route repair (proactive vs reactive), commissioning, border router, compatibilidad Matter."

**Tabla 2.7: Comparación CoAP vs HTTP**
- **Ubicación:** `02MarcoTeorico.tex` línea 411
- **Caption actual:** "Comparación CoAP vs HTTP para dispositivos constrained"
- **Estado:** ✅ Adecuado
- **Mejora sugerida:** "Comparación overhead CoAP/UDP vs HTTP/TCP para dispositivos IoT constrained. Reducción: header mínimo 4 bytes vs 100+ bytes (96% reducción), latencia conexión 0 ms vs 50-150 ms (eliminación 3-way handshake TCP)."

**Tabla 2.8: Objetos LwM2M Smart Energy**
- **Ubicación:** `02MarcoTeorico.tex` línea 466
- **Caption actual:** "Objetos LwM2M relevantes para Smart Energy IoT"
- **Estado:** ⚠️ Falta descripción de notación
- **Mejora sugerida:** "Objetos LwM2M (OMA SpecWorks) para Smart Energy IoT. Notación /ObjectID/InstanceID/ResourceID. Objetos críticos: 0 (Security), 1 (Server), 3303 (Temperature), 3305 (Power Measurement), 3331 (Voltage Measurement)."

**Tabla 2.9: Bindings de Transporte LwM2M**
- **Ubicación:** `02MarcoTeorico.tex` línea 584
- **Caption actual:** "Bindings de Transporte LwM2M para Smart Energy IoT"
- **Estado:** ⚠️ Falta recomendaciones
- **Mejora sugerida:** "Bindings de transporte LwM2M según conectividad: U (UDP+CoAP, preferido para Thread/HaLow), T (TCP+CoAP, LTE Cat-M1), S (SMS, fallback), N (Non-IP NB-IoT), Q (MQTT, brokers existentes)."

**Tabla 2.10: Comparación LwM2M vs alternativas**
- **Ubicación:** `02MarcoTeorico.tex` línea 616
- **Caption actual:** "Comparación LwM2M vs protocolos alternativos para gestión dispositivos Smart Energy"
- **Estado:** ⚠️ Falta especificación de alternativas
- **Mejora sugerida:** "Comparación LwM2M vs protocolos de gestión IoT: MQTT/JSON, TR-069, OMA-DM. Métricas: overhead de mensaje (bytes), estandarización objetos, soporte OTA firmware, autenticación DTLS."

**Tabla 2.11: Mapeo ISO/IEC 30141**
- **Ubicación:** `02MarcoTeorico.tex` línea 756
- **Caption actual:** "Mapeo arquitectura propuesta a estándar ISO/IEC 30141:2024 IoT Reference"
- **Estado:** ✅ Específico y técnico
- **Mejora sugerida:** (Mantener, es adecuado)

**Tabla 2.12: Comparación Arquitecturas Edge Gateway**
- **Ubicación:** `02MarcoTeorico.tex` línea 1021
- **Caption actual:** "Comparación Arquitecturas Edge Gateway"
- **Estado:** ⚠️ Falta contexto de comparación
- **Mejora sugerida:** "Comparación arquitecturas edge gateway para Smart Energy: propuesta (Raspberry Pi 4 + OpenWRT + ThingsBoard Edge) vs comerciales (Cisco IR829, Dell EG3000, MultiTech Conduit). Criterios: Thread/HaLow support, IEEE 2030.5, costo, potencia."

**Tablas adicionales Cap 2:** (no listadas por brevedad, total 13 tablas)

---

### Capítulo 3: Gateway (14+ tablas, 2 figuras)

**Figura 3.1: Vista de despliegue ISO/IEC 30141**
- **Ubicación:** `03Gateway.tex` línea 170 (placeholder figura vacía)
- **Caption actual:** "Vista de despliegue ISO/IEC 30141 del gateway"
- **Estado:** ❌ FIGURA FALTANTE - PLACEHOLDER
- **Acción requerida:** Exportar de tesis.drawio, incluir: Nodos Thread → OTBR → ThingsBoard Edge → HaLow AP → Cloud
- **Mejora caption:** "Vista de despliegue conforme a ISO/IEC 30141:2024. Componentes: OpenThread Border Router (RCP nRF52840), ThingsBoard Edge (contenedor Docker), TimescaleDB (hypertables), HaLow AP (Morse Micro MM6108), multi-WAN failover (Ethernet Gigabit + LTE Cat-20)."

**Figura 3.2: Arquitectura de contenedores Docker**
- **Ubicación:** `03Gateway.tex` línea 363 (placeholder figura vacía)
- **Caption actual:** "Arquitectura de contenedores del gateway OpenWRT"
- **Estado:** ❌ FIGURA FALTANTE - PLACEHOLDER
- **Acción requerida:** Crear diagrama con 7 servicios: OTBR, ThingsBoard Edge, PostgreSQL, TimescaleDB, Mosquitto MQTT, Bridge CoAP→MQTT, Ollama LLM
- **Mejora caption:** "Arquitectura de contenedores Docker del gateway (7 servicios orquestados con Docker Compose). Stack: OTBR (nRF52840 RCP), ThingsBoard Edge 3.6.4, PostgreSQL 14 + TimescaleDB 2.11, Mosquitto 2.0, Bridge CoAP→MQTT, Ollama (Mistral 7B). Aislamiento de recursos con limits CPU/RAM."

**Tabla 3.1: Comparación Raspberry Pi 4 vs Router OpenWRT**
- **Ubicación:** `03Gateway.tex` línea 736
- **Caption actual:** "Comparación Raspberry Pi 4 vs Router OpenWRT tradicional"
- **Estado:** ⚠️ Falta criterios
- **Mejora sugerida:** "Comparación plataforma hardware para gateway: Raspberry Pi 4 (BCM2711 ARM Cortex-A72 @ 1.5 GHz, 4 GB RAM) vs Router OpenWRT tradicional (MIPS @ 580 MHz, 128 MB RAM). Criterios: soporte Docker, performance, extensibilidad, costo."

**Tabla 3.2: Comparación almacenamiento gateway**
- **Ubicación:** `03Gateway.tex` línea 922
- **Caption actual:** "Comparación almacenamiento para gateway IoT"
- **Estado:** ⚠️ Falta especificaciones técnicas
- **Mejora sugerida:** "Comparación soluciones de almacenamiento para gateway: SD Card (32 GB, 90 MB/s read), eMMC (64 GB, 200 MB/s), NVMe SSD (128 GB, 1 GB/s). Criterios: IOPS, confiabilidad (MTBF), resistencia a escrituras (TBW), costo."

**Tabla 3.3: Consumo energético y throughput HaLow**
- **Ubicación:** `03Gateway_NEW.tex` línea 1452
- **Caption actual:** "Consumo energético y throughput por escenario HaLow ($n=1,440$ mediciones/escenario, 24h @ 1 medición/minuto)"
- **Estado:** ✅ Excelente, incluye tamaño muestral y metodología
- **Mejora sugerida:** (Mantener, caption bien estructurado con variables experimentales)

**Tabla 3.4: Comparación arquitectura propuesta vs baseline**
- **Ubicación:** `03Gateway_NEW.tex` línea 1499
- **Caption actual:** "Comparación estadística arquitectura propuesta vs baseline (media $\pm$ desviación estándar)"
- **Estado:** ✅ Incluye estadísticas descriptivas
- **Mejora sugerida:** (Mantener, agregar test estadístico usado: "Comparación mediante t-test de Student bilateral, α=0.05, n=100 muestras/arquitectura")

**Tabla 3.5: Comparativa IA Local vs Cloud**
- **Ubicación:** `03Gateway_NEW.tex` línea 1865
- **Caption actual:** "Comparativa IA Local (Gateway Ollama) vs IA Cloud (GPT-4/Claude)"
- **Estado:** ⚠️ Falta métricas específicas
- **Mejora sugerida:** "Comparativa inferencia LLM: local (Ollama Mistral 7B en Raspberry Pi 4) vs cloud (GPT-4 Turbo, Claude 3). Métricas: latencia (ms), privacidad (datos sensibles), costos ($/1M tokens), disponibilidad offline."

**Tablas adicionales Cap 3:** (14 tablas totales identificadas, incluyen protocolos IoT, resiliencia, gestión, IA local/cloud, HaLow modes)

---

### Capítulo 4: Arquitectura (4 tablas, 1 figura)

**Figura 4.1: Arquitectura completa del sistema**
- **Ubicación:** `04Arquitectura_NEW.tex` línea 23
- **Caption actual:** "Arquitectura completa del sistema de telemetría"
- **Estado:** ❌ FIGURA FALTANTE - TODO COMENTADO
- **Acción requerida:** Integrar diagrama de tesis.drawio, mostrar 3 capas: Field Network (Thread mesh) → Backhaul (HaLow) → Cloud (ThingsBoard)
- **Mejora caption:** "Arquitectura completa del sistema de telemetría Smart Energy conforme a ISO/IEC 30141:2024. Capa de Campo: nodos adaptadores RS-485+ESP32C6+Thread. Capa de Agregación: DCUs (Data Concentrator Units) con Thread Border Router + HaLow. Gateway Edge: Raspberry Pi 4 + OpenWRT + ThingsBoard Edge. Cloud: ThingsBoard Server 3.6 con TimescaleDB y Kafka."

**Tabla 4.1: Seguridad por capa**
- **Ubicación:** `04Arquitectura_NEW.tex` línea 158
- **Caption actual:** "Seguridad por capa"
- **Estado:** ⚠️ Genérico, falta detalles
- **Mejora sugerida:** "Seguridad end-to-end por capa arquitectónica. Campo: AES-128 CCM (802.15.4 MAC), DTLS-PSK (CoAP/LwM2M). Backhaul: WPA3-SAE (HaLow). Gateway: TLS 1.3 mutual auth (MQTT), RBAC ThingsBoard. Defense in Depth."

**Tabla 4.2: Costos de implementación**
- **Ubicación:** `04Arquitectura_NEW.tex` línea 180
- **Caption actual:** "Costos de implementación"
- **Estado:** ⚠️ Falta escenario y período
- **Mejora sugerida:** "Costos de implementación para 300 medidores Smart Energy (escenario piloto). Desglose: nodos adaptadores ESP32C6 (300× $15), DCUs (3× $180), gateway Raspberry Pi 4 ($200), módulos HaLow (4× $120). CAPEX total: ~$6,500. Comparación vs AMI tradicional."

**Tabla 4.3: Comparación arquitecturas edge gateway**
- **Ubicación:** `04Arquitectura_NEW.tex` línea 188
- **Caption actual:** "Comparación arquitecturas edge gateway para Smart Energy IoT"
- **Estado:** ⚠️ Falta criterios específicos
- **Mejora sugerida:** "Comparación arquitecturas edge gateway Smart Energy: propuesta vs Cisco IR829 vs AWS IoT Greengrass. Criterios: conformidad estándares (IEEE 2030.5, ISO/IEC 30141), soporte Thread/HaLow, costo TCO 5 años, autonomía offline, open-source."

---

### Capítulo 5: Conclusiones (4 tablas)

**Tabla 5.1: Resumen de Validación de Hipótesis**
- **Ubicación:** `05Conclusiones.tex` línea 64
- **Caption actual:** "Resumen de Validación de Hipótesis Específicas"
- **Estado:** ✅ Clara y específica
- **Mejora sugerida:** "Resumen de validación de las 8 hipótesis específicas (H1-H8). Mapeo: Hipótesis → Objetivo Específico → Experimento → Resultado Cuantitativo → Estado de Validación. Cobertura: 100% (7 completas + 1 parcial)."

**Tabla 5.2: Matriz de Trazabilidad Completa**
- **Ubicación:** `05Conclusiones.tex` línea 98
- **Caption actual:** "Matriz de Trazabilidad Completa: Hipótesis → Objetivos → Experimentos → Validación"
- **Estado:** ✅ Excelente, título explicativo
- **Mejora sugerida:** (Mantener, es adecuado para trazabilidad académica)

**Tabla 5.3: TimescaleDB vs Cassandra en Edge**
- **Ubicación:** `05Conclusiones.tex` línea 223
- **Caption actual:** "TimescaleDB vs Cassandra en Edge (Raspberry Pi 4)"
- **Estado:** ⚠️ Falta métricas comparadas
- **Mejora sugerida:** "Comparación bases de datos tiempo-real en edge (Raspberry Pi 4): TimescaleDB vs Apache Cassandra. Métricas: throughput ingesta (inserts/s), latencia query agregaciones, overhead memoria (MB), complejidad operacional. Telemetría: 1M samples, granularidad 1 min."

**Tabla 5.4: Análisis Costos Conectividad**
- **Ubicación:** `05Conclusiones.tex` línea 271
- **Caption actual:** "Análisis Costos Conectividad - Cloud vs Edge"
- **Estado:** ⚠️ Falta período y escala
- **Mejora sugerida:** "Análisis TCO (Total Cost of Ownership) conectividad 5 años para 1000 dispositivos. Cloud-only (AWS IoT Core + LTE): $69k. Edge-first (ThingsBoard Edge + HaLow): $45k. Ahorro: 35%. Desglose: CAPEX, OPEX conectividad, licencias SW."

---

## 🔧 Acciones Prioritarias

### Críticas (Bloquean compilación)
1. **Integrar Figura 4.1** - Arquitectura completa desde tesis.drawio
2. **Integrar Figura 3.1** - Vista de despliegue ISO/IEC 30141
3. **Crear Figura 3.2** - Diagrama contenedores Docker

### Importantes (Mejoran calidad)
4. Mejorar 20 captions más descriptivos (Cap 2 y 3)
5. Crear gráfico latencia experimental (matplotlib)
6. Crear gráfico consumo energético HaLow (barras con error bars)
7. Validar numeración todas las figuras/tablas

### Deseables (Pulido final)
8. Añadir referencias cruzadas en texto narrativo
9. Generar lista de figuras (LOF) y lista de tablas (LOT)
10. Revisar formato captions (punto final, capitalización)

---

## 📝 Convenciones de Mejora de Captions

### Estructura recomendada para captions descriptivos:
```
[Tipo de visualización] [Variable(s) medida(s)] [Contexto/escenario]. 
[Condiciones experimentales: n=X, método, herramienta]. 
[Resultado clave o conclusión principal].
```

### Ejemplo aplicado:
**Antes:**  
"Comparación de protocolos IoT"

**Después:**  
"Comparación de protocolos IoT para Smart Energy: Thread, Zigbee, LoRaWAN, NB-IoT. Criterios: latencia (ms), throughput (kbps), alcance (m), consumo energético (mAh). Escenario: red piloto 100 nodos, mediciones 24h. Resultado: Thread óptimo para mesh local (<100 m), HaLow para backhaul (>1 km)."

---

## ✅ Checklist de Validación Final

- [ ] Todas las figuras tienen archivo de imagen (PNG/PDF 300 DPI)
- [ ] Todas las tablas tienen caption descriptivo con contexto
- [ ] Numeración secuencial correcta (Cap.Num: 1.1, 1.2, 2.1, 2.2...)
- [ ] Referencias cruzadas funcionan (\ref{fig:X}, \ref{tab:Y})
- [ ] LOF (List of Figures) y LOT (List of Tables) generan correctamente
- [ ] Captions incluyen variables medidas y condiciones experimentales
- [ ] Gráficos experimentales incluyen barras de error y leyenda
- [ ] Todas las figuras referenciadas en texto narrativo
- [ ] Formato LaTeX consistente (\caption{} después de \centering)

---

## 📎 Recursos

- **Diagramas fuente:** `tesis.drawio`
- **Scripts generación gráficos:** (Por crear en Python/matplotlib)
- **Guía de estilo figuras:** IEEE Transactions format
- **Resolución mínima:** 300 DPI para impresión
- **Formatos aceptados:** PNG (figuras), PDF (diagramas vectoriales)

---

**Última actualización:** 2025-11-13  
**Siguiente revisión:** Tras integración de Figs 3.1, 3.2, 4.1
