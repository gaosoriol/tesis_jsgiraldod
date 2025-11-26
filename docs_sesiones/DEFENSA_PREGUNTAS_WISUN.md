# Defensa Tesis - Preguntas Anticipadas Wi-SUN

**Documento creado:** 19 noviembre 2025  
**Defensa:** 4 diciembre 2025  
**Contexto:** Preparación de respuestas técnicas ante preguntas del comité sobre Wi-SUN FAN

---

## PREGUNTA 1: ¿Por qué no consideraron Wi-SUN si es estándar IEEE 802.15.4g para utilities?

### Respuesta Preparada (2-3 minutos)

**Inicio directo:** Wi-SUN FAN fue evaluado exhaustivamente como alternativa arquitectónica, pero descartado por cuatro limitaciones técnicas críticas que hacen Thread + HaLow superior para nuestro caso de uso específico.

**Razón 1 - Conflicto Espectral Sub-1 GHz:**
- Wi-SUN opera 868/915 MHz (Europa/Américas)
- HaLow opera 902-928 MHz (Región 2)
- **Problema:** Mismo espectro Sub-1 GHz → interferencia mutua inevitable
- **Solución Thread + HaLow:** Separación espectral clara (2.4 GHz local + 900 MHz backhaul)
- **Referencia:** Tabla comparativa Cap 2, página ~XX (verificar después de compilación)

**Razón 2 - Throughput Insuficiente para Agregación:**
- Wi-SUN FAN: **300 kbps máximo** (IEEE 802.15.4g MR-FSK mejor modo)
- HaLow: **40 Mbps** (802.11ah, 4 MHz channel)
- **Diferencia:** 133× superior HaLow
- **Cálculo pico de tráfico DCU:**
  * 100 meters × 10 KB response × 8 bits / 10 s = **800 kbps burst**
  * Wi-SUN 300 kbps: **Insuficiente** (2.7× sobrecarga)
  * HaLow 40 Mbps: **50× headroom** para QoS
- **Validación:** Gharbieh et al. (2016) "Strategic Bandwidth Allocation for QoS in IoT Networks"

**Razón 3 - Complexity Routing RPL vs MLE:**
- Wi-SUN: RPL (RFC 6550) con DODAG, DIO/DAO/DIS messages, separate upward/downward routing tables
- Thread: MLE unified proactive routing, single ETX metric
- **Impacto práctico:**
  * RPL: 4-8 KB RAM adicional vs Thread
  * Gateway integration: Wi-SUN requiere SDK propietario TI border router
  * Thread: OpenThread Border Router = **Docker container nativo** (docker-compose)
- **Diferencia:** OTBR open-source vs vendor lock-in

**Razón 4 - Ecosystem Direction:**
- Matter (CSA 2022): Thread = **mandatory transport layer**
- Wi-SUN: **No roadmap Matter** (Matter 1.0/1.1/1.2 sin 802.15.4g support)
- **Future-proofing:** Smart grid + smart building integration (demand response, V2G, DER management)
- **Trend validation:** PG&E, Duke Energy pilots Thread 2023-2024

**Validación Industria:**
- Radiocrafts (vendor noruego): Reporta migración clientes **DESDE Wi-SUN → RIIM** para solar tracking
- Razón: Limitaciones throughput/latency Wi-SUN (1000-2000 nodos antes de fragmentación)
- **Referencia:** radiocraftsCommissioningLargeSolar2025, Cap 2 líneas 1002-1064

**Conclusión (30 segundos):**
> "Wi-SUN tiene ventajas indiscutibles: propagación Sub-1 GHz superior, ecosystem utilities maduro con millones de meters deployed, costo chipset 25% menor ($2.70 TI CC1312R vs $4 nRF52840). **Pero** para arquitectura AMI con agregación DCU backhaul, separación espectral Thread/HaLow + throughput 133× superior HaLow son **críticos**. Renunciamos a propagación superior Wi-SUN (Thread 2.4 GHz suficiente para 250 m coverage DCU) a cambio de escalabilidad throughput y eliminación de interferencia espectral."

---

## PREGUNTA 2: ¿Wi-SUN no tiene ventaja en penetración Sub-GHz vs Thread 2.4 GHz?

### Respuesta Preparada (1-2 minutos)

**Aceptación parcial + contexto arquitectónico:**

**Sí, Wi-SUN penetración Sub-1 GHz superior:**
- Free-space path loss: **15-20 dB menor** Sub-1 GHz vs 2.4 GHz
- Penetración paredes concreto: **8-12 dB mejor** Sub-1 GHz
- Alcance teórico: Wi-SUN 2-5 km outdoor vs Thread 250-500 m indoor
- **Ventaja real para:** Utility-scale outdoor deployments (smart meters urbanos/rurales)

**PERO arquitectura dual-radio mitiga:**

**Thread (2.4 GHz) = LOCAL mesh únicamente:**
- Coverage radius: **250 m DCU-to-meter** (spec requerimiento)
- Escenario: Indoor comercial/residencial (minimizar NLOS penetration challenges)
- Densidad: 100-300 meters por DCU en área concentrada
- **Resultado:** Penetración Sub-1 GHz NO crítica para este alcance corto
- **Validación:** Case studies Victoria (residential), Radiocrafts (solar tracking) operan exitosamente Thread <300 m

**HaLow (900 MHz) = BACKHAUL únicamente:**
- Coverage radius: **2-3 km DCU-to-gateway** (reemplazo celular)
- Escenario: Outdoor point-to-point/point-to-multipoint NLOS
- **TIENE propagación Sub-1 GHz equivalente Wi-SUN** (902-928 MHz vs 868/915 MHz)
- **Ventaja adicional:** 40 Mbps throughput vs 300 kbps Wi-SUN

**Conclusión (20 segundos):**
> "Correcta observación penetración Sub-1 GHz superior. Por eso **HaLow backhaul opera 900 MHz**, obteniendo misma ventaja propagación que Wi-SUN PERO con 133× throughput. Thread @ 2.4 GHz solo para mesh local <250 m donde penetración no es limitante. Arquitectura dual-radio aprovecha **best-of-both-worlds**: Sub-1 GHz backhaul + IPv6 native local mesh."

---

## PREGUNTA 3: ¿Costo Wi-SUN ($2.70) es menor que Thread ($4), por qué no usarlo?

### Respuesta Preparada (1-2 minutos)

**TCO Analysis más allá de chipset cost:**

**Ventaja inicial Wi-SUN chipset:**
- TI CC1312R: **$2.70 USD** (1ku quantities)
- Nordic nRF52840: **$4.00 USD** (1ku quantities)
- **Ahorro unitario:** $1.30 per meter (32.5% menor)
- **Ahorro flota 300 meters:** $1.30 × 300 = **$390 USD total**

**PERO pérdidas arquitectónicas compensan ahorro:**

**1. Gateway Integration Cost:**
- Wi-SUN: Requiere border router vendor-specific (TI SDK propietario, kernel drivers)
- Thread: OTBR open-source Docker container (**$0 licensing**)
- **Diferencia:** Engineering time setup Wi-SUN router ~40 horas ($4,000 @ $100/hr) vs OTBR docker-compose 4 horas ($400)
- **Saving Thread:** $3,600 NRE (non-recurring engineering)

**2. Throughput Limitation Scaling Cost:**
- Wi-SUN 300 kbps: Requiere 1 DCU cada **50-75 meters** (overhead RPL + limited bandwidth)
- HaLow 40 Mbps: Permite 1 DCU cada **100-300 meters** (agregación sin congestión)
- **Resultado:** Deployment Wi-SUN necesita **2-4× más DCUs** para misma coverage
- **Costo adicional:** 3 DCUs extras × $295 = **$885 USD** vs ahorro $390 chipsets

**3. Maintenance TCO (10-year lifecycle):**
- Wi-SUN: Vendor SDK updates propietarios (risk discontinuation, ver SiLabs divestiture)
- Thread: Open-source community (OpenThread GitHub 15K+ stars, Google/Nordic/SiLabs maintainers)
- **Risk mitigation:** Comunidad open-source reduce vendor lock-in risk

**4. Future Upgrade Path:**
- Wi-SUN: No Matter roadmap → isolated ecosystem
- Thread: Matter convergence → interoperability smart home/building/grid
- **Value:** Future integration DER (Distributed Energy Resources), V2G sin protocol bridges

**Conclusión (30 segundos):**
> "Ahorro $390 en chipsets (300 meters × $1.30) **eliminado** por: (1) $3,600 NRE gateway integration propietario, (2) $885 DCUs adicionales por limitación throughput, (3) Risk vendor lock-in vs open-source sustainability. TCO 10-year Thread inferior Wi-SUN incluso con chipset 32% más caro. Decisión optimiza **total cost of ownership**, no solo BOM chipset."

---

## PREGUNTA BONUS: ¿Qué pasaría si utilities exigen Wi-SUN compliance?

### Respuesta Preparada (1 minuto)

**Arquitectura modular permite adaptation:**

**Gateway dual-radio flexible:**
- Current: Thread (nRF52840 USB dongle $10) + HaLow (MM6108 M.2 module $150)
- **Alternative:** Wi-SUN (TI CC1312R LaunchPad $40) + HaLow (MM6108 $150)
- **Swap cost:** $40 - $10 = **$30 adicional per gateway** (10% BOM increase)
- **Integration:** USB interface standardized (nRF52840 vs CC1312R similar setup)

**Trade-offs accepted en scenario Wi-SUN mandatory:**
- Throughput backhaul: Downgrade 40 Mbps → 300 kbps HaLow **eliminado**, Wi-SUN backhaul
- **Resultado:** 1 DCU cada 50-75 meters (vs 100-300 meters Thread/HaLow)
- **Cost impact:** 2-4× más gateways deployed ($295 × 3 extra = $885 additional CAPEX)

**Recommendation pragmática:**
- **Escenario actual (libre elección):** Thread + HaLow = optimal TCO
- **Escenario regulatory Wi-SUN:** Modular design allows swap USB dongle Thread → CC1312R ($30)
- **Escenario hybrid:** Wi-SUN local + HaLow backhaul (spectrum conflict risk manageable con frequency planning)

**Conclusión (20 segundos):**
> "Arquitectura no está locked-in Thread. Modular design permite adaptation. Si utility exige Wi-SUN, gateway soporta swap Thread → CC1312R con $30 BOM delta. **Pero** recomendación técnica permanece Thread + HaLow por razones expuestas. Compliance regulatory manejable con diseño modular."

---

## Datos Clave para Memorizar

### Especificaciones Wi-SUN FAN
- **PHY:** IEEE 802.15.4g Sub-1 GHz (≠ 802.15.4 standard Thread)
- **Frecuencias:** 868 MHz Europa, 915 MHz Américas
- **Throughput:** 50-300 kbps (MR-FSK modes)
- **Routing:** RPL (RFC 6550) DODAG
- **IPv6:** Sí (6LoWPAN, igual que Thread)
- **Chipset líder:** TI CC1312R ($2.70 USD)

### Especificaciones Thread 1.3.1
- **PHY:** IEEE 802.15.4 @ 2.4 GHz
- **Throughput:** 250 kbps
- **Routing:** MLE (Mesh Link Establishment) proactive
- **IPv6:** Nativo 6LoWPAN
- **Chipset líder:** Nordic nRF52840 ($4.00 USD)
- **Gateway:** OpenThread Border Router (OTBR) open-source

### Especificaciones HaLow 802.11ah
- **PHY:** IEEE 802.11ah @ 900 MHz
- **Frecuencias:** 902-928 MHz (Región 2)
- **Throughput:** 40 Mbps (4 MHz channel, MCS10)
- **Routing:** 802.11s HWMP mesh / AP-STA
- **Chipset:** Morse Micro MM6108 ($12 USD)

### Comparación Numérica Rápida
| Criterio | Thread | Wi-SUN | HaLow | Decisión |
|----------|--------|---------|--------|----------|
| **Frecuencia** | 2.4 GHz | 868/915 MHz | 902-928 MHz | Thread/HaLow **separados** |
| **Throughput** | 250 kbps | 300 kbps | **40 Mbps** | HaLow **133× superior** |
| **Costo chip** | $4 | **$2.70** | $12 | Wi-SUN más barato |
| **Gateway** | **OTBR OSS** | Vendor SDK | AP estándar | Thread open-source |
| **Matter** | **Sí nativo** | No | Futuro | Thread convergence |

### Referencias Bibliográficas Clave
1. **tiCC1312RWiSUN2024:** Texas Instruments CC1312R product page (specs Wi-SUN)
2. **radiocraftsCommissioningLargeSolar2025:** Migración DESDE Wi-SUN → RIIM (validación)
3. **gharbiehStrategicBandwidthAllocation2016:** QoS throughput requirements AMI
4. **threadMatterConvergence2024:** Thread + Matter ecosystem analysis

---

## Lenguaje Corporal y Estrategia Defensa

### Tone para Respuestas Wi-SUN
- **Respetuoso:** Wi-SUN es tecnología válida, deployments globales exitosos
- **Técnico:** Decisión basada en análisis cuantitativo (números concretos)
- **Pragmático:** TCO, not just chipset BOM cost
- **Confident:** Validación industria (Radiocrafts migration, PG&E pilots)

### Si Insisten en Wi-SUN
1. **Reiterar:** Arquitectura modular permite adaptation
2. **Ofrecer:** Anexo comparativo adicional (si solicitan profundización)
3. **Validar:** Reconocer expertise comité en utilities (muchos usan Wi-SUN actualmente)
4. **Defender:** Pero mantener posición técnica Thread + HaLow superior para **este caso específico**

### Red Flags Evitar
- ❌ "Wi-SUN es obsoleto" → Falso, millions deployed
- ❌ "Wi-SUN es inferior" → Simplificación excesiva
- ✅ "Wi-SUN excelente para X, pero Thread + HaLow mejor para Y (nuestro caso)"
- ✅ "Trade-off consciente: renunciamos Z (propagación) por A+B (throughput + separación)"

---

## Tiempo Estimado Respuestas
- **Pregunta 1 (¿Por qué no Wi-SUN?):** 2-3 minutos (respuesta completa)
- **Pregunta 2 (Penetración Sub-GHz):** 1-2 minutos (contexto dual-radio)
- **Pregunta 3 (Costo chipset):** 1-2 minutos (TCO analysis)
- **Total máximo:** 7 minutos (si las 3 preguntas aparecen)

**Estrategia:** Si comité profundiza más de 7 minutos en Wi-SUN, ofrecer revisar documentación adicional post-defensa (no consumir tiempo excesivo en single topic).

---

**ÚLTIMA ACTUALIZACIÓN:** 19 noviembre 2025, 15:45  
**PRÓXIMA ACCIÓN:** Revisar este documento 1-2 días antes de defensa (2 diciembre), practicar respuestas con colega/amigo simulando comité.
