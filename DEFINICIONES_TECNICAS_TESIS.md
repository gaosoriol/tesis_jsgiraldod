# 📚 Definiciones Técnicas de la Tesis - Fuente Única de Verdad

## ✅ Almacenadas en Memory MCP

### 1. Protocolos y Tecnologías Base

**OTBR (OpenThread Border Router)**
- Definición: Gateway que conecta redes Thread 802.15.4 con redes IP externas
- Implementación: nRF52840 RCP v1.3, firmware thread-reference-20230706
- Función: Routing IPv6 nativo, traductor 6LoWPAN ↔ estándar IPv6
- Uso: "OTBR con nRF52840 RCP" (siempre especificar hardware)

**HaLow (IEEE 802.11ah)**
- Definición: Wi-Fi de sub-1 GHz para IoT de largo alcance
- Banda: ISM 902-928 MHz (América), canales 1-26 MHz ancho
- Alcance: >1 km LOS, 150-300 m NLOS urbano
- Throughput: 40 Mbps máximo teórico, 8-15 Mbps práctico
- Uso: "Wi-Fi HaLow 802.11ah" o "HaLow" (nunca solo "802.11ah")

**Dispositivos constrained**
- Definición: Dispositivos con recursos limitados según RFC 7228
- Clase 1 (constrained): <256 KB RAM, <1 MB Flash
- Clase 0 (highly constrained): <10 KB RAM, <100 KB Flash
- Características: Alimentación por batería, CPU <100 MHz
- Uso: "dispositivos constrained (Clase 1: <256 KB RAM, <1 MB Flash)"

**6LoWPAN (IPv6 over Low-Power WPAN)**
- Definición: Adaptación IPv6 para redes IEEE 802.15.4 (RFC 4944, RFC 6282)
- Componentes: Fragmentación L2, IPHC, NHC, Context-based compression
- Función: Comprime headers IPv6 de 48B → 4.2±1.1B (>85% compresión)
- Uso: "6LoWPAN" (siempre mayúsculas, nunca "6lowpan")

**IPHC (IPv6 Header Compression)**
- Definición: Compresión de headers IPv6 según RFC 6282
- Técnica: Context-based compression + elision de campos predecibles
- Resultado: 48 bytes → 4.2±1.1 bytes (reducción 85-91%)
- Uso: "compresión IPHC" o "IPHC (6LoWPAN)"

**CoAP (Constrained Application Protocol)**
- Definición: Protocolo RESTful sobre UDP para dispositivos IoT (RFC 7252)
- Características: 4 bytes header, confirmable/non-confirmable messages
- Latencia: <30 ms típica (vs 78±12 ms HTTP/REST)
- Overhead: 22B promedio (vs 100B HTTP/REST)
- Uso: "CoAP/UDP" cuando se enfatiza transporte

**LwM2M (Lightweight M2M)**
- Definición: Protocolo gestión dispositivos IoT sobre CoAP (OMA SpecWorks)
- Componentes: Objects (Security 0, Server 1, Device 3, Connectivity 4)
- Operaciones: Read, Write, Execute, Observe, Discover
- Transporte: CoAP/UDP (default), CoAP/TCP, CoAP/SMS
- Uso: "LwM2M v1.2" o "LwM2M sobre CoAP"

**Thread 1.3.0**
- Definición: Protocolo mesh networking IPv6 nativo para IoT (Thread Group)
- Base: IEEE 802.15.4 PHY/MAC, 6LoWPAN, CoAP
- Topología: Mesh auto-configurable, roles Leader/Router/End Device
- Latencia: 50-150 ms típica en redes de 20-50 nodos
- Uso: "Thread 1.3.0" (especificar versión) o "red Thread"

---

### 2. Arquitectura y Edge Computing

**CEP (Complex Event Processing)**
- Definición: Procesamiento de eventos en tiempo real en edge gateway
- Función: Detección de patrones, agregación temporal, alertas locales
- Implementación: ThingsBoard rule engine con nodos JavaScript
- Latencia: 8±2 ms processing time local
- Uso: "CEP local" o "motor CEP edge"

**DER (Distributed Energy Resources)**
- Definición: Recursos energéticos distribuidos en smart grid
- Incluye: Paneles solares, baterías, vehículos eléctricos (EVs)
- Gestión: DERMS (DER Management System)
- Estándar: IEEE 2030.5 Function Set DER
- Uso: "DER" o "recursos DER" (nunca expandir sin contexto)

**RTO (Recovery Time Objective)**
- Definición: Tiempo máximo tolerado para restaurar servicio tras falla
- Niveles arquitectura: L1 Hardware (<1 min), L2 OS (<2 min), L3 Containers (<30 s)
- Medición: Desde detección falla hasta servicio operacional
- Uso: "RTO <30 segundos" (siempre especificar valor numérico)

**ThingsBoard Edge**
- Definición: Plataforma edge computing con rule engine local y sync cloud
- Componentes: Rule engine, Dashboards locales, Time-series DB local
- Modo offline: Funcionalidad completa sin conectividad WAN
- Sync: Bidireccional automática al restaurar WAN
- Uso: "ThingsBoard Edge" (nunca "TB Edge" en texto formal)

**Edge Computing**
- Definición: Procesamiento de datos cerca de la fuente (gateway/local)
- Beneficios: Latencia reducida, tráfico WAN reducido, operación offline
- Arquitectura: Gateway con CPU/RAM suficiente (RPi 5: 8 GB RAM, 4 cores)
- Uso: "edge computing" o "procesamiento edge" (minúsculas en español)

---

### 3. Estándares y Modelos de Referencia

**NIST Smart Grid**
- Definición: Modelo de referencia para Smart Grid del NIST (USA)
- Componentes: 7 dominios interconectados
- Dominios: Generation, Transmission, Distribution, Customer, Markets, Operations, Service Provider
- Uso: "modelo NIST Smart Grid" o "arquitectura NIST" (nunca solo "NIST")

**IEEE 2030.5-2023 (Smart Energy Profile 2.0)**
- Definición: Estándar interoperabilidad Smart Energy (ex-ZigBee SEP 2.0)
- Arquitectura: RESTful sobre HTTP/TLS
- Function Sets: DCAP, TM, MM, MSG, ED, DER, DRLC
- Mandatorio: California SB-2030 para DR programs
- Uso: "IEEE 2030.5" o "SEP 2.0" (ambos válidos)

**ISO/IEC 30141:2024 (IoT Reference Architecture)**
- Definición: Estándar internacional de arquitectura de referencia IoT
- Vistas: 4 complementarias (Funcional, Información, Despliegue, Operacional)
- Entidades funcionales: Sensing, Actuation, Processing, Storage, Communication, Security, Management, Application Support
- Actualización: 2024 (segunda edición)
- Uso: "ISO/IEC 30141:2024" (siempre con año)

---

### 4. Valores Experimentales Clave

**Overhead reducido: -78%**
- Baseline: HTTP/REST 100B promedio (headers + JSON)
- Propuesta: CoAP 22B promedio (binary + CBOR)
- Medición: Promedio 1000 transacciones telemetría
- Contexto: Capítulo 3, validación protocolo stack

**Tráfico WAN reducido: -72%**
- Baseline: 24.6 GB/día (cloud-only processing)
- Propuesta: 6.9 GB/día (edge computing con CEP local)
- Ahorro: 17.7 GB/día por gateway
- Contexto: Capítulo 4, impacto edge computing

**Latencia CoAP: 23±8 ms**
- Medición: End-to-end desde nodo Thread hasta gateway CoAP endpoint
- Red: Thread 802.15.4 (20 nodos, 3 hops máximo)
- Comparación: HTTP/REST 78±12 ms (baseline)
- Reducción: 65% vs baseline
- Contexto: Capítulo 3, benchmark protocolos

**Headers 6LoWPAN comprimidos: 4.2±1.1 bytes**
- Sin compresión: IPv6 40B + UDP 8B = 48 bytes
- Con IPHC: 2B dispatch + 2B inline fields promedio = 4.2B
- Compresión: >85% (best case: 91% con context)
- Desviación: ±1.1 bytes según campos elided
- Contexto: Capítulo 2, análisis 6LoWPAN

**Alcance HaLow: >1 km LOS**
- Line-of-Sight: >1 km medido (campo abierto, antena 3 dBi)
- NLOS urbano: 150-300 m (depende de obstrucciones)
- Comparación: WiFi 2.4 GHz ~50 m NLOS
- Banda: 902-928 MHz, mejor penetración que 2.4/5 GHz
- Contexto: Capítulo 3, evaluación HaLow

---

### 5. Formato y Convenciones

**Citas bibliográficas**
- Papers 2024+: Formato IEEE completo con DOI
- Papers pre-2024: Formato IEEE estándar
- Estándares: Incluir año y número de revisión
- Ejemplo: ~\cite{kumariEdgeComputingData2024}

**Abreviaciones primera mención**
- Formato: Término completo (Abreviación)
- Ejemplo: "OpenThread Border Router (OTBR)"
- Posteriores: Solo abreviación "OTBR"

**Valores numéricos con unidades**
- Formato: Número ± desviación unidad
- Ejemplo: "23±8 ms" o "4.2±1.1 bytes"
- Siempre: Espacio entre número y unidad

---

## 🎯 Uso de estas definiciones

**Para Copilot:**
- Consultar: "¿Cuál es la definición de OTBR?"
- Verificar: "¿Estoy usando correctamente el término HaLow?"
- Validar: "¿Este valor de latencia CoAP es correcto?"

**Para revisión de texto:**
- Buscar inconsistencias con grep
- Validar que todos los términos técnicos coincidan
- Verificar primera mención con expansión completa

**Para nuevas secciones:**
- Consultar definiciones antes de escribir
- Mantener formato y valores consistentes
- Usar abreviaciones correctas

---

**Archivo generado:** 2025-11-14
**Propósito:** Fuente única de verdad para coherencia terminológica en tesis de 260 páginas
**Almacenamiento:** Memory MCP + este archivo de respaldo
