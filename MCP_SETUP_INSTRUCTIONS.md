# 🚀 Configuración MCPs para Tesis

## ✅ MCPs y Herramientas Instaladas

- **@modelcontextprotocol/server-memory** v2025.9.25
- **@modelcontextprotocol/server-filesystem** v2025.8.21
- **@modelcontextprotocol/server-brave-search** v0.6.2
- **@modelcontextprotocol/server-sequential-thinking** v2025.7.1 (Validación arquitectura)
- **@mermaid-js/mermaid-cli** v11.12.0 (Generación diagramas profesionales)

## 📋 Configuración VS Code

### Paso 1: Abrir Settings JSON

1. Presiona `Ctrl + Shift + P`
2. Escribe: `Preferences: Open User Settings (JSON)`
3. Presiona Enter

### Paso 2: Agregar Configuración MCP

Agrega este bloque dentro del objeto principal (después de las llaves `{`):

```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-memory"
      ]
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:\\Users\\Luis Antonio\\Documents\\tesis"
      ]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sequential-thinking"
      ]
    }
  }
}
```

### Paso 3: Reiniciar VS Code

- Cierra completamente VS Code
- Vuelve a abrir tu workspace de tesis
- Los MCPs estarán activos

---

## 🎯 Uso de MCPs en tu Tesis

### 1️⃣ **Memory MCP** - Coherencia Terminológica

**Guardar decisiones de diseño:**
```
@memory store "OTBR significa OpenThread Border Router - siempre usar esta definición"
@memory store "Dispositivos constrained: <256 KB RAM, <1 MB Flash, batería"
@memory store "Formato citas: IEEE 2024+ para papers recientes"
```

**Consultar decisiones:**
```
@memory recall "definición dispositivos constrained"
@memory list  # Ver todas las decisiones guardadas
```

**Casos de uso prioritarios:**
- ✅ Mantener consistencia en 260 páginas
- ✅ Recordar abreviaciones (DER, CEP, IPHC, LwM2M)
- ✅ Trackear decisiones del comité de tesis

---

### 2️⃣ **Filesystem MCP** - Navegación Eficiente

**Buscar archivos LaTeX:**
```
List all .tex files in workspace
```

**Encontrar figuras:**
```
Find all files matching pattern *.png in figures/
```

**Verificar estructura:**
```
Show directory tree for Tesis___Trabajo_final___Maestria___2025/
```

**Casos de uso prioritarios:**
- ✅ Auditoría de referencias cruzadas `\ref{fig:}`, `\ref{tab:}`
- ✅ Verificar que todas las figuras existan
- ✅ Encontrar archivos rápidamente en 50+ archivos .tex

---

### 3️⃣ **Sequential-Thinking MCP** - Tutor Virtual de Tesis

**Actuar como tutor de tesis (rol de evaluador académico):**

```
🎓 PROMPT DE TUTOR VIRTUAL:

"Actúa como mi tutor de tesis de maestría en Ingeniería Eléctrica. 
Analiza el Capítulo 4 (Arquitectura) con razonamiento paso a paso:

1. **Coherencia técnica**: ¿Es lógico usar Thread (2.4 GHz) + HaLow (900 MHz)?
2. **Justificación de decisiones**: ¿Por qué CoAP y no MQTT en nodos IoT?
3. **Trade-offs documentados**: ¿Se explicaron pros/cons de cada tecnología?
4. **Métricas validadas**: ¿Las cifras (72% reducción WAN, 8±2ms latencia) son realistas?
5. **Referencias adecuadas**: ¿Cada claim técnico tiene cita IEEE/ACM?
6. **Escalabilidad**: ¿La arquitectura soporta 1000+ medidores?
7. **Seguridad**: ¿Se justificó mTLS + Thread AES-128-CCM?

Dame un REPORTE CRÍTICO con:
- ✅ Fortalezas (qué está bien justificado)
- ⚠️ Debilidades (argumentos flojos o sin evidencia)
- 🔧 Mejoras específicas (cómo corregir cada problema)
- 📚 Referencias faltantes (papers que deberías citar)
"
```

**Validar consistencia entre capítulos:**

```
"Analiza paso a paso si hay inconsistencias entre:
- Cap. 2 (Marco Teórico): Dice que CoAP tiene overhead de 4-10 bytes
- Cap. 4 (Arquitectura): Usa 22 bytes de overhead CoAP
- Cap. 5 (Conclusiones): Menciona 78% reducción overhead

¿Cuál es la cifra correcta? ¿Hay error de cálculo o contexto diferente?"
```

**Preparación para preguntas del comité:**

```
"Simula 10 preguntas difíciles que haría un comité de tesis sobre:
1. Por qué no usar Zigbee en lugar de Thread
2. Costo de HaLow vs alternativas (LoRaWAN, NB-IoT)
3. Seguridad end-to-end con mTLS
4. Escalabilidad a 10,000 medidores
5. Comparación con soluciones comerciales (Cisco, HPE)

Para cada pregunta:
- Dame la respuesta técnica correcta
- Indica dónde está (o falta) en la tesis
- Sugiere cómo mejorar la argumentación"
```

**Análisis de métricas (validación numérica):**

```
"Valida estos cálculos paso a paso:

Claim: 'Reducción 72% tráfico WAN'
Datos:
- Baseline: 24.6 GB/día (100 medidores × 15 min × 100 bytes)
- Propuesta: 6.9 GB/día (con IPHC + edge processing)

¿Es correcto el cálculo? ¿Qué asumpciones se hicieron?
¿Falta algún factor (retransmisiones, overhead MAC, fragmentación)?"
```

**Casos de uso prioritarios:**
- 🎓 **Revisión pre-defensa**: Detectar huecos argumentativos
- 🔍 **Validación técnica**: Verificar coherencia de cifras/protocolos
- 📊 **Análisis comparativo**: Thread vs Zigbee, HaLow vs LoRaWAN
- 🛡️ **Seguridad**: Validar stack de protección (mTLS, AES-128-CCM)
- 📚 **Referencias**: Identificar claims sin cita o mal justificados
- ⚖️ **Trade-offs**: Explicar decisiones de diseño con pros/cons

---

## 🔥 Siguiente Paso: Brave Search MCP

### Instalación (para búsqueda académica)

```powershell
npm install -g @modelcontextprotocol/server-brave-search
```

**Requiere:** API Key de Brave Search (gratis, 2000 búsquedas/mes)
1. Regístrate en: https://brave.com/search/api/
2. Obtén tu API key
3. Agregar a `settings.json`:

```json
{
  "mcpServers": {
    "brave-search": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-brave-search"
      ],
      "env": {
        "BRAVE_API_KEY": "TU_API_KEY_AQUI"
      }
    }
  }
}
```

**Utilidad crítica:**
- Buscar papers recientes "HaLow IoT 2024"
- Completar 47 referencias undefined en tu .bib
- Validar claims técnicos en tiempo real

---

## 📊 Prioridades Inmediatas

### ✅ HECHO
- [x] Instalar Memory MCP
- [x] Instalar Filesystem MCP

### 🔄 SIGUIENTE (5 minutos)
- [ ] Configurar MCPs en VS Code settings.json
- [ ] Reiniciar VS Code
- [ ] Probar Memory: guardar definiciones clave
- [ ] Probar Filesystem: listar todos los .tex

### 🎯 URGENTE (Para referencias)
- [ ] Registrarse en Brave Search API
- [ ] Instalar Brave Search MCP
- [ ] Buscar 47 referencias undefined
- [ ] Completar bibliografía .bib

---

## 🆘 Troubleshooting

**Error: "MCP server not found"**
- Verifica que `npx` esté en PATH: `where.exe npx`
- Reinstala: `npm install -g @modelcontextprotocol/server-memory`

**Error: "Permission denied"**
- Ejecuta PowerShell como Administrador
- Reinstala paquetes globales

**MCPs no aparecen en Copilot:**
- Reinicia VS Code completamente
- Verifica `settings.json` sin errores de sintaxis JSON
- Chequea logs: `Ctrl+Shift+P` → "Developer: Show Logs"

---

## 📚 Documentación Oficial

- Memory MCP: https://github.com/modelcontextprotocol/servers/tree/main/src/memory
- Filesystem MCP: https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem
- MCP Specification: https://modelcontextprotocol.io/

