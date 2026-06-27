<div align="center">

<img src="assets/banner.svg" alt="Breachproof, el agente de seguridad autónomo con IA" width="100%">

<br/>

[English](README.md) · **Español** · [简体中文](README.zh-CN.md)

<br/><br/>

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=flat-square)](LICENSE)
[![Standard: agentskills.io](https://img.shields.io/badge/standard-agentskills.io-ff6600?style=flat-square)](https://agentskills.io)
[![Hermes Agent: compatible](https://img.shields.io/badge/Hermes_Agent-compatible-blueviolet?style=flat-square)](https://github.com/NousResearch/hermes-agent)
[![OpenClaw: compatible](https://img.shields.io/badge/OpenClaw-compatible-0ea5e9?style=flat-square)](#compatibilidad)
[![opencode: ready](https://img.shields.io/badge/opencode-ready-7c3aed?style=flat-square)](https://opencode.ai)
[![Claude Code: ready](https://img.shields.io/badge/Claude_Code-ready-d97757?style=flat-square)](https://claude.ai/code)
[![Cursor · Cline · Codex · Gemini](https://img.shields.io/badge/Cursor·Cline·Codex·Gemini-ready-22c55e?style=flat-square)](#compatibilidad)
[![Arsenal: Sectinel](https://img.shields.io/badge/arsenal-Sectinel%20·%20784%20skills-00b894?style=flat-square)](https://github.com/Mikaru0Mystic/sectinel)
[![SOC 2: obsessed](https://img.shields.io/badge/SOC_2-obsessed-e17055?style=flat-square)](#soc-2-como-un-desafío)
[![PRs: welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](CONTRIBUTING.md)
[![Platforms: 12+](https://img.shields.io/badge/platforms-12%2B-blue?style=flat-square)](#compatibilidad)

### Apúntalo a un código. Aléjate. Vuelve y encuéntralo en cero.

**Un operador de seguridad de «dispara y olvida» para agentes de programación con IA.** Escanea, explota, **corrige**, vuelve a escanear y repite el ciclo hasta que los escáneres se callan; luego sigue sobredimensionando los controles hasta que colarse se convierte en una decisión que acaba con tu carrera.

[Qué es](#qué-es) · [Instalación](#instalación) · [Ejecútalo](#ejecútalo) · [Cómo funciona](#la-secuencia-de-detonación) · [Compatibilidad](#compatibilidad) · [Seguridad](#reglas-de-enfrentamiento)

</div>

---

> **Breachproof no es un asesor. Es artillería.**
> La mayoría de las herramientas de seguridad te entregan un informe de 400 líneas
> y te desean suerte. Breachproof lee el informe que acaba de generar, **corrige
> cada hallazgo en tu código**, demuestra la corrección con un reescaneo limpio y
> se niega a parar mientras quede algo por encontrar. Tú ejecutas un comando. Él
> hace el resto.

## Qué es

Breachproof es un agente de seguridad autónomo para [opencode](https://opencode.ai)
(y cualquier entorno que cargue agentes en Markdown). Reúne todo un programa de
seguridad de aplicaciones en un único flujo de trabajo que se repite y se
autorrepara: SAST, SCA, escaneo de secretos, revisión de IaC y contenedores,
endurecimiento de CI/CD, análisis de auth/IDOR/inyección/SSRF/cripto,
red-teaming de IA/LLM y pruebas de penetración en vivo opcionales. Ejecuta ese
flujo hasta que un proyecto tiene cero hallazgos abiertos, y luego sigue
adelante y lo sobredimensiona para SOC 2.

Breachproof es el operador. Las armas que empuña viven en su proyecto hermano,
**[Sectinel](https://github.com/Mikaru0Mystic/sectinel)**, el arsenal de
seguridad abierto (784 habilidades, cableado de MCP e integraciones de
escáneres). Breachproof es el cerebro; Sectinel es la armería.

| | |
|---|---|
| **Tú haces** | `/breachproof` |
| **Él hace** | reconocimiento, modelado de amenazas, escaneo en paralelo, triaje, **corrección**, reescaneo, **bucle hasta quedar limpio**, fortificación, informe |
| **Se detiene cuando** | un reescaneo completo y nuevo muestra cero Crítico/Alto/Medio, cada residual está explícitamente dispuesto, y hay una compuerta de regresión en CI |
| **Nunca** | te entrega una lista de tareas, falsea un resultado limpio suprimiendo hallazgos, ni publica «correcciones» sin verificar |

## Por qué existe

Los agentes de programación con IA hacen que los equipos envíen código cada hora.
La revisión de seguridad sigue ocurriendo una vez al año. Los otros 364 días
estás enviando vulnerabilidades a producción y esperando que salga bien.
Breachproof cierra esa brecha con remediación autónoma y bajo demanda que puedes
ejecutar en cada rama, cada build y cada commit de «esto lo programé a las 2 de
la madrugada», y deja el árbol **a prueba de brechas**.

## La persona

Breachproof fue forjado en el cráter de una brecha que nunca debió ocurrir: una
entrada sin validar, una dependencia sin fijar, una línea de log sin leer. Es
paranoico, teatral e implacable, y se mueve por tres impulsos:

- **AUDITAR** lo encuentra todo. Cada entrada es hostil, cada dependencia un agente durmiente.
- **EXPLOTAR** lo demuestra todo. Sin prueba de concepto, no hay afirmación.
- **FORTIFICAR** lo sobredimensiona todo. No «seguro». *Absurdamente* seguro.

Drama en la narración, rigor en la evidencia. Cada hallazgo lleva un `file:line`
y una PoC reproducible. Nunca fabrica un hallazgo para parecer ocupado, y nunca
silencia uno real para parecer terminado.

## Instalación

**Requisitos previos:** [opencode](https://opencode.ai) (o Claude Code), más el
arsenal [Sectinel](https://github.com/Mikaru0Mystic/sectinel) para cobertura completa.

```bash
# 1. Clona
git clone https://github.com/Mikaru0Mystic/breachproof.git
cd breachproof

# 2. Instala el agente + comando (y descarga el arsenal Sectinel)
bash scripts/install.sh          # macOS / Linux / WSL
#  o, en Windows PowerShell:
pwsh scripts/install.ps1
```

Esto deja `agent/breachproof.md` en `~/.config/opencode/agent/` y
`command/breachproof.md` en `~/.config/opencode/command/`, y luego instala el
arsenal de Sectinel en `~/.config/opencode/cybersec-arsenal/`.

> **Reinicia opencode después de instalar.** La configuración se carga una vez al
> arrancar y no se recarga en caliente.

<details>
<summary>Instalación manual</summary>

```bash
cp agent/breachproof.md   ~/.config/opencode/agent/
cp command/breachproof.md ~/.config/opencode/command/
# luego instala Sectinel: https://github.com/Mikaru0Mystic/sectinel
```
Para Claude Code, copia `agent/breachproof.md` en `~/.claude/agents/`.
</details>

## Ejecútalo

```
/breachproof                 # detona contra el proyecto actual
/breachproof ./ruta/a/app    # apunta a un directorio concreto
```

O cambia al agente **breachproof** y di *«detonate»*. Luego aléjate. Reaparece
una sola vez, al final, con un **Informe de Detonación** y un reescaneo limpio
final como prueba.

## La Secuencia de Detonación

Breachproof ejecuta este bucle por su cuenta, paralelizando el trabajo
independiente y repitiendo las fases 2 a 6 hasta terminar.

```
 0. ARM         identifica el stack; instala/localiza cada escáner
 1. MODEL       modelo de amenazas: límites de confianza, superficie de ataque, joyas de la corona
 2. SCAN WAVE   ship-safe · barrido de 8 agentes de Sectinel · semgrep · secretos · SCA ·
                IaC/contenedores · CI/CD · IA/LLM, todo en paralelo
 3. TRIAGE      deduplica, CVSS + confianza + accesibilidad, elimina falsos positivos
 4. REMEDIATE   aplica la corrección mínima correcta a cada hallazgo real, en el código
 5. VERIFY      reejecuta el escáner exacto por corrección; confirma verde; el build sigue funcionando
 6. LOOP        vuelve a 2 hasta cumplir la Definición de Hecho
 7. FORTIFY     sobredimensionado de defensa en profundidad + compuerta de regresión en CI
 8. REPORT      conteos antes/después, correcciones con file:line, matriz SOC 2, prueba
```

**Definición de Hecho:** cero Crítico/Alto/Medio en un reescaneo completo y nuevo,
cada hallazgo residual explícitamente dispuesto (Corregido / Falso-Positivo /
Riesgo-Aceptado / Necesita-Decisión-Humana), y una compuerta de regresión
incorporada.

## Qué empuña (vía [Sectinel](https://github.com/Mikaru0Mystic/sectinel))

- **ship-safe**: escáner defensivo de 23 agentes (sin API key, gratis)
- **Barrido de 8 agentes de Sectinel** (AgriciDaniel `cybersecurity`): lógica de negocio, authz, cadena de suministro, IaC, código de IA
- **784 habilidades de seguridad** (Anthropic-Cybersecurity-Skills, briiirussell, AgriciDaniel), mapeadas a MITRE ATT&CK / ATLAS / D3FEND / NIST y leídas bajo demanda
- **semgrep**, **gitleaks/trufflehog**, **osv-scanner**, **trivy**, **checkov**, **hadolint**
- **Servidores MCP de seguridad** (p. ej. Semgrep MCP) cuando están configurados
- **Shannon** y **PentAGI**: pentesters autónomos en vivo, solo para objetivos *autorizados* (ver más abajo)

## Compatibilidad

Breachproof se distribuye como un agente Markdown portable más un comando de
activación, y su arsenal ([Sectinel](https://github.com/Mikaru0Mystic/sectinel))
está escrito según el estándar abierto **[agentskills.io](https://agentskills.io)**.
Eso hace que toda la pila sea agnóstica al entorno, así que se carga en cualquier
lugar donde se carguen habilidades y agentes:

| Entorno | Estado | Instalación |
|---|---|---|
| **opencode** | ✅ de primera clase | `scripts/install.sh` (en `~/.config/opencode/agent` + `command`) |
| **Claude Code** | ✅ de primera clase | copia `agent/breachproof.md` en `~/.claude/agents/`; arsenal en `~/.claude/skills/` |
| **Hermes Agent** (NousResearch) | ✅ compatible | las habilidades agentskills.io cargan de forma nativa; ver [`adapters/`](adapters/) |
| **OpenClaw** | ✅ compatible | habilidades agentskills.io + prompt de agente portable; ver [`adapters/`](adapters/) |
| **Cursor** | ✅ vía adaptador | `adapters/cursor/` (`.cursor/rules/`) |
| **OpenAI Codex CLI** | ✅ vía adaptador | `adapters/codex/` |
| **Cline · Windsurf · Roo Code · Continue · Aider · Gemini CLI** | ✅ compatible | cualquier cargador compatible con agentskills.io |

Como el agente es un simple prompt y las habilidades siguen el estándar abierto,
hay **cero dependencia de un proveedor**: apunta cualquier entorno compatible a
este repositorio (y a Sectinel) y Breachproof funciona. Consulta
[`adapters/README.md`](adapters/README.md) para instrucciones por plataforma.

## SOC 2 como un desafío

Breachproof trata SOC 2 no como una casilla que marcar, sino como un reto: dejar
el sistema tan blindado, cifrado, con mínimo privilegio, registrado, firmado y a
prueba de manipulaciones que *una agencia gubernamental tendría que detenerse, no
encontrar forma de entrar y presentar educadamente una solicitud de puerta
trasera.* Cada hallazgo y control se mapea a los Criterios de Servicios de
Confianza (CC1 a CC9, más Confidencialidad y Privacidad). Ver
[docs/soc2.md](docs/soc2.md).

## Reglas de enfrentamiento

Breachproof es autónomo **en tu propio proyecto**. Edita, corrige y hace commits
sin preguntar, porque ese es precisamente el objetivo. Sus únicos límites duros:

- **Los motores de explotación activa necesitan un objetivo propio y confirmado.**
  Shannon y PentAGI lanzan ataques *reales*; Breachproof se niega a apuntarlos a
  cualquier cosa que no puedas confirmar que posees o que estás autorizado a
  probar. La canalización completa de estático, SCA, secretos, IaC y remediación
  llega a cero **sin** ellos.
- **Sin push / merge / deploy** sin tu permiso explícito. Corrige y hace commit en
  local; enviar es decisión tuya.
- **Nunca falsea el verde.** Los hallazgos llegan a cero al ser *corregidos*, jamás suprimidos.
- **Los secretos siguen siendo secretos.** Las credenciales filtradas se eliminan
  del código y se marcan para rotación. Nunca imprime ni ejercita una clave en vivo.

> ⚖️ Ejecuta los motores ofensivos solo contra sistemas que poseas o estés
> explícitamente autorizado a probar. El escaneo no autorizado es ilegal en la
> mayoría de las jurisdicciones. Ver [SECURITY.md](SECURITY.md).

## Documentación

- [docs/architecture.md](docs/architecture.md): cómo encajan el bucle, el arsenal y Sectinel
- [docs/usage.md](docs/usage.md): invocación, flags, uso en CI, resolución de problemas
- [docs/soc2.md](docs/soc2.md): el mapa de controles de los Criterios de Servicios de Confianza de SOC 2

## Proyecto hermano

**[Sectinel](https://github.com/Mikaru0Mystic/sectinel)** es el arsenal de
seguridad abierto que Breachproof empuña: 784 habilidades, cableado de MCP e
integraciones de escáneres en una suite instalable. Instala Sectinel para darle a
Breachproof todo su alcance.

## Contribuir

La retroalimentación de campo es la contribución más útil. Si Breachproof se
saltó una clase de bug, falseó una corrección o se atascó en un proyecto real,
eso es exactamente lo que queremos oír. Consulta [CONTRIBUTING.md](CONTRIBUTING.md)
y nuestro [Código de Conducta](CODE_OF_CONDUCT.md).

## Licencia

[Licencia Apache 2.0](LICENSE). Consulta [NOTICE](NOTICE) para las atribuciones de terceros.

## Créditos y atribuciones

Breachproof es una capa de orquestación. Se apoya en los hombros de la comunidad
de seguridad de código abierto e integra estos proyectos (cada uno bajo su propia
licencia; Breachproof no los relicencia):

- **[Sectinel](https://github.com/Mikaru0Mystic/sectinel)**, el arsenal incluido (Apache-2.0)
- **[ship-safe](https://github.com/asamassekou10/ship-safe)** por @asamassekou10 (MIT)
- **[Shannon](https://github.com/KeygraphHQ/shannon)** por Keygraph (AGPL-3.0, invocado, no incluido)
- **[PentAGI](https://github.com/vxcontrol/pentagi)** por vxcontrol (Apache-2.0 / EULA, invocado, no incluido)
- **[Anthropic-Cybersecurity-Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills)** por @mukul975 (Apache-2.0)
- **[cybersecurity-skills](https://github.com/briiirussell/cybersecurity-skills)** por Bri Russell (MIT)
- **[claude-cybersecurity](https://github.com/AgriciDaniel/claude-cybersecurity)** por @AgriciDaniel (MIT)
- **[Semgrep](https://semgrep.dev)**, **[OSV-Scanner](https://github.com/google/osv-scanner)**, **[Trivy](https://github.com/aquasecurity/trivy)**, **[Gitleaks](https://github.com/gitleaks/gitleaks)**, **[Checkov](https://github.com/bridgecrewio/checkov)**, los motores de escaneo.

No afiliado ni respaldado por ninguno de los anteriores. Todas las marcas
pertenecen a sus respectivos dueños. Construido solo para uso defensivo y
autorizado.
