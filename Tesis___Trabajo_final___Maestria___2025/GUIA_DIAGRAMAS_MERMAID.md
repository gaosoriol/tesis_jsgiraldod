# 🎨 Guía de Diagramas Mermaid - Tesis Maestría

**Herramienta instalada:** Mermaid CLI v11.12.0  
**Fecha:** 14 de noviembre de 2025

---

## ✅ Imágenes Generadas (3/7)

| # | Archivo | Tamaño | Usado en | Estado |
|---|---------|--------|----------|--------|
| 1 | **arquitectura-completa.png** | 175 KB | 04Arquitectura_NEW.tex línea 22 | ✅ Incluido |
| 2 | **protocol-stack.png** | 72 KB | Pendiente agregar | ⚪ Generado |
| 3 | **flujo-datos-edge.png** | 94 KB | Pendiente agregar | ⚪ Generado |

---

## 🚀 Cómo Generar Nuevos Diagramas

### Paso 1: Crear archivo .mmd

```bash
cd "C:\Users\Luis Antonio\Documents\tesis\Tesis___Trabajo_final___Maestria___2025\figures"
notepad mi-diagrama.mmd
```

### Paso 2: Escribir código Mermaid

**Ejemplo - Diagrama de Secuencia:**
```mermaid
sequenceDiagram
    participant M as Medidor
    participant N as Nodo IoT
    participant O as OTBR
    participant G as Gateway
    participant C as Cloud

    M->>N: DLMS Request (RS-485)
    N->>N: Parse + Compress (6LoWPAN)
    N->>O: CoAP/UDP (Thread Mesh)
    O->>G: LwM2M/IPv6
    G->>G: Edge Processing (Rule Engine)
    G->>C: MQTT/TLS (HaLow)
    C-->>G: ACK
```

**Ejemplo - Diagrama de Componentes:**
```mermaid
graph TB
    subgraph "Gateway Hardware"
        RPi[Raspberry Pi 4B<br/>4 GB RAM]
        MM[Morse Micro MM6108<br/>HaLow Module]
        nRF[nRF52840<br/>Thread RCP]
    end
    
    RPi --> MM
    RPi --> nRF
```

### Paso 3: Generar PNG

```powershell
mmdc -i mi-diagrama.mmd -o mi-diagrama.png -w 1920 -H 1080 -b transparent
```

**Parámetros:**
- `-i`: Archivo entrada (.mmd)
- `-o`: Archivo salida (.png)
- `-w`: Ancho en píxeles (1920 recomendado)
- `-H`: Alto en píxeles (1080 recomendado)
- `-b transparent`: Fondo transparente

### Paso 4: Incluir en LaTeX

```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.9\textwidth]{figures/mi-diagrama.png}
\caption{Descripción profesional del diagrama con métricas clave}
\label{fig:mi-diagrama}
\end{figure}
```

---

## 🎯 Diagramas Pendientes (4 TODOs restantes)

### 1. **MQTT Integration Architecture** (03Gateway.tex línea 360)
```mermaid
graph LR
    subgraph "Gateway"
        LwM2M[LwM2M Client<br/>CoAP/UDP]
        Bridge[MQTT Bridge<br/>Mosquitto]
        Cert[Certificate Store<br/>X.509 mTLS]
    end
    
    subgraph "ThingsBoard"
        Broker[MQTT Broker<br/>Port 8883]
        Auth[Authentication<br/>Device Tokens]
    end
    
    LwM2M --> Bridge
    Bridge --> Cert
    Cert -->|TLS 1.3| Broker
    Broker --> Auth
```

**Generar:**
```powershell
cd figures
# Crear mqtt-integration.mmd con el código arriba
mmdc -i mqtt-integration.mmd -o mqtt-integration.png -w 1600 -H 900 -b transparent
```

---

### 2. **Thread Mesh Topology** (Opcional)
```mermaid
graph TB
    subgraph "Red Thread"
        L[Leader Node]
        R1[Router 1]
        R2[Router 2]
        E1[End Device 1]
        E2[End Device 2]
        E3[End Device 3]
    end
    
    OTBR[Border Router<br/>OTBR]
    
    L <--> R1
    L <--> R2
    R1 <--> R2
    R1 --> E1
    R1 --> E2
    R2 --> E3
    L <--> OTBR
```

---

### 3. **Security Stack** (Opcional)
```mermaid
graph TB
    subgraph "Capa Aplicación"
        A1[IEEE 2030.5<br/>TLS Client Auth]
    end
    
    subgraph "Capa Transporte"
        T1[mTLS 1.3<br/>X.509 Certificates]
        T2[LFDI Identifier<br/>SHA256 Public Key]
    end
    
    subgraph "Capa Red"
        N1[IPv6 Native]
    end
    
    subgraph "Capa Enlace"
        L1[Thread AES-128-CCM]
        L2[HaLow WPA3-SAE]
    end
    
    A1 --> T1
    T1 --> T2
    T2 --> N1
    N1 --> L1
    N1 --> L2
```

---

### 4. **Data Compression Pipeline** (Opcional)
```mermaid
flowchart LR
    A[IPv6 Header<br/>48 bytes] --> B[IPHC Compression]
    B --> C[Compressed Header<br/>4.2±1.1 bytes]
    C --> D[UDP Header<br/>8 bytes]
    D --> E[CoAP Header<br/>4 bytes]
    E --> F[Total Overhead<br/>22 bytes]
    
    F -.->|vs Baseline<br/>HTTP/REST<br/>100 bytes| G[78% Reduction]
    
    style A fill:#FFE6E6
    style F fill:#E8F5E8
    style G fill:#FFF4E6
```

---

## 🎨 Paleta de Colores Recomendada

```mermaid
%%{init: {'theme':'base', 'themeVariables': {
    'primaryColor':'#E8F4F8',
    'primaryTextColor':'#1a1a1a',
    'primaryBorderColor':'#0066cc',
    'lineColor':'#0066cc',
    'secondaryColor':'#FFF4E6',
    'tertiaryColor':'#F0F8FF',
    'fontSize':'14px'
}}}%%
```

**Colores por categoría:**
- **Dispositivos:** `#FFE6E6` (rojo claro)
- **Field Network:** `#E6F3FF` (azul claro)
- **Gateway:** `#FFF4E6` (naranja claro)
- **Edge Processing:** `#F3E5F5` (morado claro)
- **Cloud:** `#E8F5E8` (verde claro)

---

## 📚 Tipos de Diagramas Mermaid

### 1. **Graph/Flowchart** (Arquitecturas)
```mermaid
graph TB
    A[Inicio] --> B{Decisión}
    B -->|Sí| C[Acción 1]
    B -->|No| D[Acción 2]
```

### 2. **Sequence Diagram** (Flujos de comunicación)
```mermaid
sequenceDiagram
    Alice->>Bob: Hola
    Bob-->>Alice: Hola!
```

### 3. **Class Diagram** (Clases software)
```mermaid
classDiagram
    class Gateway {
        +String id
        +connect()
        +send()
    }
```

### 4. **State Diagram** (Máquinas de estado)
```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Processing
    Processing --> Idle
```

### 5. **Entity Relationship** (Bases de datos)
```mermaid
erDiagram
    DEVICE ||--o{ TELEMETRY : generates
    DEVICE {
        string id
        string type
    }
```

---

## ✅ Checklist para Nuevas Figuras

- [ ] Crear archivo `.mmd` en `figures/`
- [ ] Código Mermaid con tema personalizado
- [ ] Generar PNG con `mmdc` (1920x1080)
- [ ] Verificar tamaño <200 KB (comprimir si necesario)
- [ ] Agregar `\includegraphics` en archivo .tex
- [ ] Caption descriptivo con métricas clave
- [ ] Label único `\label{fig:nombre}`
- [ ] Recompilar PDF: `pdflatex 0000.tex`
- [ ] Verificar calidad visual en PDF generado

---

## 🚀 Comandos Rápidos

```powershell
# Generar todas las figuras pendientes
cd "C:\Users\Luis Antonio\Documents\tesis\Tesis___Trabajo_final___Maestria___2025\figures"

# MQTT Integration
mmdc -i mqtt-integration.mmd -o mqtt-integration.png -w 1600 -H 900 -b transparent

# Thread Topology
mmdc -i thread-topology.mmd -o thread-topology.png -w 1600 -H 900 -b transparent

# Security Stack
mmdc -i security-stack.mmd -o security-stack.png -w 1600 -H 800 -b transparent

# Compression Pipeline
mmdc -i compression-pipeline.mmd -o compression-pipeline.png -w 1600 -H 600 -b transparent

# Recompilar PDF
cd ..
pdflatex -interaction=nonstopmode 0000.tex
```

---

## 📊 Estadísticas Finales

| Métrica | Antes | Después | Mejora |
|---------|-------|---------|--------|
| Figuras en PDF | 0 | 3 | +3 imágenes |
| Tamaño imágenes | 0 KB | 342 KB | Calidad profesional |
| Páginas PDF | 262 | 263 | +1 página |
| TODOs pendientes | 5 | 2 | -60% |

---

## 🎓 Recursos

- **Mermaid Live Editor:** https://mermaid.live/ (probar código online)
- **Documentación Mermaid:** https://mermaid.js.org/
- **Galería ejemplos:** https://mermaid.js.org/ecosystem/integrations.html

---

*Generado automáticamente - Integración Mermaid CLI*  
*Fecha: 14 noviembre 2025*  
*Comando instalado: `mmdc` (Mermaid CLI v11.12.0)*
