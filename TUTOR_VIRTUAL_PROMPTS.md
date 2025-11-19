# 🎓 Prompts de Tutor Virtual de Tesis

**MCP Requerido:** `@modelcontextprotocol/server-sequential-thinking`

---

## 📋 1. REVISIÓN CRÍTICA COMPLETA (JUEZ EVALUADOR)

```
⚖️ Actúa como JUEZ EVALUADOR CRÍTICO de tesis de maestría en Ingeniería Eléctrica (perfil: 20+ años experiencia, revisor IEEE Transactions, miembro comité PhD).

**MENTALIDAD:** Buscar ACTIVAMENTE debilidades, inconsistencias, afirmaciones sin sustento. Ser EXIGENTE pero constructivo.

Lee el archivo [NOMBRE_CAPITULO.tex] con ojo crítico de evaluador:

### Paso 1: Estructura y Narrativa (Evaluación Académica)
- ✅ **Fortalezas:** ¿Qué está bien estructurado?
- ❌ **DEBILIDADES CRÍTICAS:**
  * ¿Saltos lógicos sin transición?
  * ¿Secciones desbalanceadas (muy cortas <1 pág o muy largas >8 pág)?
  * ¿Introducción sin roadmap del capítulo?
  * ¿Conclusión sin síntesis de aportes?
- 🎯 **Puntaje estructura:** [0-10] con justificación

### Paso 2: Rigor Técnico (Red Flag Detection)
- 🚨 **RED FLAGS - Buscar activamente:**
  * Afirmaciones categóricas sin cita ("Thread es mejor que Zigbee")
  * Números "mágicos" sin cálculo ("latencia de 8 ms")
  * Comparaciones sin baseline ("reducción de 72%... ¿vs qué?")
  * Trade-offs no discutidos ("elegimos X" sin mencionar desventajas)
  * Tecnología mencionada sin especificación de versión (Thread sin indicar 1.3.0)
- 📊 **Cada claim técnico DEBE tener:**
  * Justificación cuantitativa (con cálculo)
  * Cita a paper/standard reciente (2020-2025)
  * Contexto de aplicabilidad (cuándo sí/no aplica)
- 🎯 **Puntaje rigor:** [0-10] con lista de red flags encontrados

### Paso 3: Referencias Bibliográficas (Auditoría Completa)
- 🔍 **Buscar específicamente:**
  * Claims sin \cite{} en últimas 3 líneas
  * Self-citations excesivas (>30% del total)
  * Papers pre-2020 para tecnologías recientes
  * Ausencia de standards oficiales (IEEE, ISO, IEC, RFC)
  * Datasheets como única fuente vs papers académicos
  * Blogs/Medium/Wikipedia en lugar de fuentes primarias
- 📚 **Para cada sección técnica:**
  * ¿Hay al menos 1 cita cada 2-3 párrafos?
  * ¿Standards citados son versión actual?
  * ¿Papers son de journals IEEE/ACM Tier 1-2?
- 🎯 **Puntaje referencias:** [0-10] + lista de 10 citas faltantes más críticas

### Paso 4: Coherencia Interna (Detector de Contradicciones)
- 🔎 **Buscar inconsistencias:**
  * Métricas que cambian entre capítulos ("latencia 8 ms" en Cap.3, "10 ms" en Cap.5)
  * Arquitectura descrita diferente en Cap.1 vs Cap.4
  * Números de dispositivos inconsistentes (¿100 o 200 medidores?)
  * Protocolos mencionados pero no explicados previamente
  * Definiciones duplicadas o contradictorias
- 🎯 **Puntaje coherencia:** [0-10] + lista de contradicciones encontradas

### Paso 5: Profundidad Técnica (Nivel Maestría)
- 📐 **Evaluar si alcanza nivel de MAESTRÍA:**
  * ¿Solo describe tecnologías existentes (nivel BSc)?
  * ¿Compara alternativas con análisis crítico (nivel MSc)?
  * ¿Propone mejoras/adaptaciones originales (nivel MSc avanzado)?
  * ¿Demuestra dominio del estado del arte (papers <2 años)?
- 🎯 **Puntaje profundidad:** [0-10] con gaps identificados

### Paso 6: Validación Experimental (Credibilidad)
- 🧪 **Para cada métrica claimed:**
  * ¿Hay datos experimentales propios?
  * ¿Hay simulaciones con herramientas nombradas?
  * ¿Solo citas a papers de otros?
  * ¿Métricas son extrapolaciones sin validación?
- 🎯 **Puntaje validación:** [0-10] + credibilidad de claims

---

## 🎯 REPORTE FINAL DE EVALUACIÓN CRÍTICA

### 📊 PUNTAJE GLOBAL: [0-100]
- Estructura: [X/10]
- Rigor técnico: [X/10] ⚠️
- Referencias: [X/10] ⚠️
- Coherencia: [X/10]
- Profundidad: [X/10]
- Validación: [X/10]

### 🚨 TOP 10 PROBLEMAS CRÍTICOS (Prioridad Alta)
1. **[Línea XXX]** Claim "reducción 72%" sin cálculo mostrado
2. **[Línea YYY]** Thread mencionado sin especificar versión 1.3.0
3. **[Sección Z]** Comparación Thread vs Zigbee sin citar papers
4. ...

### ⚠️ DEBILIDADES MODERADAS (Prioridad Media)
1. Transición abrupta entre §2.3 y §2.4
2. Tabla X.Y sin caption explicativo
3. ...

### ✅ FORTALEZAS DESTACABLES (Para defensa)
1. Análisis cuantitativo de overhead (Tabla 2.3)
2. Justificación técnica de arquitectura multicapa
3. ...

### 📚 REFERENCIAS CRÍTICAS FALTANTES (Agregar urgente)
1. **IEEE 2030.5-2023** (Standard Smart Energy Profile 2.0)
2. **Thread Group Specification 1.3.0** (2022)
3. **Paper sobre HaLow performance** (autor X, IEEE Trans, 2024)
4. ...

### 🔧 ACCIONES CORRECTIVAS ESPECÍFICAS
1. **Línea 234:** Cambiar "Thread es mejor" → "Thread ofrece ventajas en... [cita]"
2. **§2.4:** Agregar tabla comparativa Thread vs Zigbee (5 criterios mínimo)
3. **Línea 567:** Mostrar cálculo completo de reducción 72%
4. ...

### 🎓 NIVEL DE MADUREZ: [Inicial/Aceptable/Bueno/Excelente]
**Justificación:** [2-3 líneas explicando por qué]

### ⏰ TIEMPO ESTIMADO DE CORRECCIÓN: [X horas]
- Problemas críticos: X horas
- Debilidades moderadas: Y horas
- Referencias faltantes: Z horas
```

---

## 🔍 2. VALIDACIÓN DE COHERENCIA TÉCNICA

```
🔬 Analiza paso a paso la coherencia técnica de mi arquitectura:

**ARQUITECTURA PROPUESTA:**
- Capa 1: Medidores DLMS/COSEM → RS-485
- Capa 2: Nodos IoT (ESP32C6 + Thread 1.3.0) → 802.15.4 @ 2.4 GHz
- Capa 3: OTBR (OpenThread Border Router) → 6LoWPAN/IPv6
- Capa 4: Gateway (Raspberry Pi 4 + HaLow 802.11ah) → 902-928 MHz
- Capa 5: ThingsBoard Cloud → MQTT/TLS

### Validar:
1. **Stack de protocolos**: ¿Es compatible DLMS → CoAP → LwM2M → MQTT?
2. **Frecuencias**: ¿Thread (2.4 GHz) + HaLow (900 MHz) coexisten sin interferencia?
3. **Escalabilidad**: ¿100 medidores → 100 nodos → 10 DCUs → 1 Gateway es factible?
4. **Latencia**: ¿El claim de "8±2 ms" en edge processing es realista?
5. **Overhead**: ¿La reducción 78% (100B HTTP → 22B CoAP) está bien calculada?
6. **Seguridad**: ¿mTLS + Thread AES-128-CCM + WPA3-SAE HaLow es suficiente?

**PARA CADA PUNTO:**
- ✅ Si es correcto: explicar por qué
- ❌ Si hay error: mostrar el problema y solución
- ⚠️ Si falta justificación: sugerir qué agregar
```

---

## ⚖️ 3. ANÁLISIS DE TRADE-OFFS (Thread vs Zigbee)

```
📊 Actúa como evaluador técnico. Compara paso a paso:

**DECISIÓN: Usar Thread en lugar de Zigbee**

### Paso 1: Criterios de Evaluación
- Interoperabilidad (IPv6 nativo)
- Consumo energético
- Ecosistema/madurez
- Costo de implementación
- Seguridad
- Facilidad de desarrollo

### Paso 2: Comparación Técnica
Para cada criterio:
- Thread: [ventajas/desventajas]
- Zigbee: [ventajas/desventajas]
- **Ganador**: [justificación cuantitativa]

### Paso 3: Contexto de mi Tesis
¿Por qué Thread es mejor para AMI Smart Energy?
- Gateway necesita IPv6 end-to-end → Thread gana
- Interoperabilidad con IEEE 2030.5 → Thread gana
- Zigbee requiere gateway adicional → Thread más simple

### Paso 4: Validar si esto está en la Tesis
¿En qué sección expliqué este trade-off?
- Si falta: sugerir dónde agregarlo (Cap. 2 o Cap. 4)
- Si existe: revisar si la justificación es suficiente

**RESULTADO:**
- Tabla comparativa Thread vs Zigbee
- Justificación de la decisión para AMI
- Texto sugerido para agregar/mejorar en la tesis
```

---

## 🎯 4. PREPARACIÓN PREGUNTAS DEL COMITÉ

```
🎤 Simula ser el comité evaluador. Genera 10 preguntas DIFÍCILES sobre:

### Arquitectura:
1. ¿Por qué HaLow y no LoRaWAN que tiene >10 km de alcance?
2. ¿Cómo justificas el costo de módulos MM6108 (>$50) vs alternatives (<$10)?
3. ¿Qué pasa si un DCU falla? ¿Hay redundancia?

### Protocolos:
4. ¿Por qué CoAP sobre UDP en lugar de MQTT sobre TCP?
5. ¿Cómo manejas retransmisiones en enlaces Thread multi-hop?
6. ¿LwM2M 1.2 soporta TODOS los objetos DLMS/COSEM?

### Seguridad:
7. ¿Cómo rotas las claves mTLS en 1000 dispositivos?
8. ¿Thread AES-128-CCM es suficiente para infraestructura crítica?
9. ¿Qué certificación de seguridad tiene tu gateway (IEC 62443)?

### Validación:
10. ¿Dónde están los datos experimentales de latencia 8±2 ms?

**PARA CADA PREGUNTA:**
- 📝 **Respuesta técnica correcta** (3-5 líneas)
- 📍 **Dónde está en la tesis** (capítulo + sección)
- 🔧 **Cómo mejorar** (si la respuesta actual es débil)
- 📚 **Referencias adicionales** (papers que apoyen la respuesta)
```

---

## 🧮 5. VALIDACIÓN NUMÉRICA DE MÉTRICAS

```
🔢 Actúa como revisor cuantitativo. Valida PASO A PASO estos cálculos:

### CLAIM 1: "Reducción 72% tráfico WAN"
**Datos de la tesis:**
- Baseline: 24.6 GB/día (100 medidores × 96 lecturas/día × 2.5 KB/lectura)
- Propuesta: 6.9 GB/día (con IPHC + edge processing)

**Validar:**
1. ¿El baseline es correcto? (100 × 96 × 2500 bytes = ?)
2. ¿Qué reducciones se aplicaron?
   - IPHC: 48 bytes → 4.2 bytes (91% reducción headers)
   - Edge filtering: 80% datos no críticos descartados
   - Compresión LwM2M TLV: 40% vs JSON
3. ¿El resultado 6.9 GB es matemáticamente correcto?
4. ¿Falta considerar overhead MAC, retransmisiones, ACKs?

**RESULTADO:**
- ✅ Cálculo correcto: [explicación]
- ❌ Error detectado: [corrección]
- ⚠️ Asumpciones faltantes: [qué agregar]

---

### CLAIM 2: "Latencia edge 8±2 ms"
**Flujo:**
Medidor → RS-485 → Nodo → Thread → OTBR → Gateway → Local DB

**Validar:**
1. RS-485 @ 9600 bps: ¿cuánto tarda 200 bytes DLMS?
2. Thread multi-hop (3 saltos): ¿latencia por salto?
3. Procesamiento gateway (Rule Engine): ¿benchmarks?
4. Write a TimescaleDB local: ¿latencia INSERT?

**RESULTADO:**
- Cálculo detallado de cada componente
- Total esperado vs claim (8±2 ms)
- ¿Es realista o optimista?
```

---

## 🔐 6. ANÁLISIS DE SEGURIDAD (Red Team)

```
🛡️ Actúa como experto en ciberseguridad IoT. Ataca mi arquitectura:

### VECTORES DE ATAQUE:
1. **Nodo IoT comprometido**: ¿Puede inyectar datos falsos en Thread mesh?
2. **OTBR hackeado**: ¿Acceso a toda la red Thread?
3. **Man-in-the-middle HaLow**: ¿WPA3-SAE es suficiente?
4. **Replay attack**: ¿MQTT tiene nonces/timestamps?
5. **Denegación de servicio**: ¿Flooding CoAP satura gateway?
6. **Escalada de privilegios**: ¿ThingsBoard Edge mal configurado?

**PARA CADA ATAQUE:**
- ⚔️ **Descripción del ataque** (técnica específica)
- 🛡️ **Defensas actuales** (qué tiene la arquitectura)
- ⚠️ **Vulnerabilidades** (qué falta o está débil)
- 🔧 **Mitigaciones** (cómo mejorar la seguridad)
- 📚 **Standards** (IEC 62443, NIST Cybersecurity Framework)

**REPORTE FINAL:**
- Nivel de seguridad: [Alto/Medio/Bajo]
- Top 3 vulnerabilidades críticas
- Roadmap de mejoras (corto/mediano/largo plazo)
```

---

## 📚 7. VERIFICACIÓN DE REFERENCIAS BIBLIOGRÁFICAS

```
📖 Actúa como bibliotecario académico especializado en IoT.

Revisa el archivo Referencias.bib y TODOS los capítulos .tex:

### Paso 1: Claims sin Cita
Busca afirmaciones técnicas sin `\cite{}`:
- "Thread reduce latencia 65% vs Zigbee" → ¿Tiene cita?
- "HaLow alcanza >1 km en urban environments" → ¿Tiene cita?
- "mTLS overhead es 15% vs DTLS 1.2" → ¿Tiene cita?

### Paso 2: Referencias Desactualizadas
- Papers pre-2020 para tecnologías nuevas (Thread 1.3, HaLow)
- Standards obsoletos (IEEE 2030.5-2018 vs 2030.5-2023)

### Paso 3: Referencias Faltantes
Para cada tecnología clave:
- Thread 1.3.0: ¿Se cita el spec oficial?
- IEEE 802.11ah: ¿Se cita el standard?
- DLMS/COSEM: ¿Se cita IEC 62056?
- LwM2M 1.2: ¿Se cita OMA SpecWorks?

### Paso 4: Calidad de Fuentes
- ¿Blogs/Medium vs IEEE/ACM?
- ¿Preprints sin peer-review?
- ¿Datasheets vs papers académicos?

**RESULTADO:**
- Lista de 20 claims sin cita (con línea del .tex)
- 10 referencias a actualizar (paper viejo → paper nuevo)
- 15 referencias a agregar (tecnología sin cita)
- BibTeX entries sugeridos para agregar
```

---

## 🚀 8. ESCALABILIDAD Y PERFORMANCE

```
📈 Analiza si la arquitectura escala de 100 a 10,000 medidores:

### Paso 1: Cuellos de Botella
- **Thread mesh**: ¿Máximo nodos por red? (¿500-1000 según OpenThread?)
- **OTBR**: ¿Cuántos DCUs puede manejar un nRF52840?
- **Gateway**: ¿Raspberry Pi 4 soporta 100 DCUs simultáneos?
- **HaLow uplink**: ¿Throughput máximo 802.11ah? (¿150 kbps efectivo?)
- **ThingsBoard**: ¿MQTT broker soporta 10K conexiones?

### Paso 2: Cálculos de Capacidad
**Escenario: 10,000 medidores**
- Nodos: 10,000 (1:1 con medidores)
- DCUs: 100 (100 medidores/DCU)
- Gateways: 10 (10 DCUs/Gateway)
- Uplink HaLow: 10 conexiones simultáneas

**Validar:**
- Throughput total: 10K × 96 lecturas/día × 2.5 KB = ?
- ¿HaLow soporta ese tráfico?
- ¿Gateway CPU/RAM suficiente?
- ¿TimescaleDB write rate adecuado?

### Paso 3: Plan de Escalabilidad
- ¿Qué se debe cambiar para 10K medidores?
- ¿Cuándo se necesita cluster de gateways?
- ¿Load balancing MQTT necesario?

**RESULTADO:**
- Límites actuales de la arquitectura
- Modificaciones para escalar 10x
- Costos estimados (hardware adicional)
```

---

## 🎯 CÓMO USAR ESTOS PROMPTS

### Opción 1: Copiar/Pegar Directo
```
1. Selecciona el prompt que necesitas
2. Reemplaza [NOMBRE_CAPITULO.tex] con tu archivo
3. Pégalo en Copilot Chat
4. Espera análisis detallado (puede tardar 30-60 segundos)
```

### Opción 2: Combinar Múltiples Prompts
```
"Combina los prompts #2 (Coherencia Técnica) + #5 (Validación Numérica) 
para analizar el Capítulo 4 completo"
```

### Opción 3: Pre-Defensa Completa
```
"Ejecuta TODOS los prompts (#1 al #8) sobre mi tesis completa.
Dame un REPORTE EJECUTIVO de 2 páginas con:
- Top 10 problemas críticos a corregir ANTES de la defensa
- Top 5 fortalezas a destacar DURANTE la defensa
- 20 preguntas probables del comité (con respuestas preparadas)"
```

---

## 📊 RESULTADO ESPERADO

Después de usar el tutor virtual, tendrás:

✅ **Lista concreta de problemas** (no genéricos, sino línea específica del .tex)  
✅ **Texto corregido** (copiar/pegar directo)  
✅ **Referencias a agregar** (BibTeX entries listos)  
✅ **Respuestas preparadas** (para preguntas del comité)  
✅ **Confianza técnica** (validación de cada decisión de diseño)

---

**Última actualización:** 14 de noviembre de 2025  
**MCP requerido:** `@modelcontextprotocol/server-sequential-thinking` v2025.7.1
