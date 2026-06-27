<div align="center">

<img src="assets/banner.svg" alt="Breachproof，自主式 AI 安全代理" width="100%">

<br/>

[English](README.md) · [Español](README.es.md) · **简体中文**

<br/><br/>

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=flat-square)](LICENSE)
[![Standard: agentskills.io](https://img.shields.io/badge/standard-agentskills.io-ff6600?style=flat-square)](https://agentskills.io)
[![Hermes Agent: compatible](https://img.shields.io/badge/Hermes_Agent-compatible-blueviolet?style=flat-square)](https://github.com/NousResearch/hermes-agent)
[![OpenClaw: compatible](https://img.shields.io/badge/OpenClaw-compatible-0ea5e9?style=flat-square)](#兼容性)
[![opencode: ready](https://img.shields.io/badge/opencode-ready-7c3aed?style=flat-square)](https://opencode.ai)
[![Claude Code: ready](https://img.shields.io/badge/Claude_Code-ready-d97757?style=flat-square)](https://claude.ai/code)
[![Cursor · Cline · Codex · Gemini](https://img.shields.io/badge/Cursor·Cline·Codex·Gemini-ready-22c55e?style=flat-square)](#兼容性)
[![Arsenal: Sectinel](https://img.shields.io/badge/arsenal-Sectinel%20·%20784%20skills-00b894?style=flat-square)](https://github.com/Mikaru0Mystic/sectinel)
[![SOC 2: obsessed](https://img.shields.io/badge/SOC_2-obsessed-e17055?style=flat-square)](README.md#soc-2-as-a-dare)
[![PRs: welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](CONTRIBUTING.md)
[![Platforms: 12+](https://img.shields.io/badge/platforms-12%2B-blue?style=flat-square)](#兼容性)

### 把它对准一个代码库。走开。回来时归零。

**面向 AI 编程代理的「发射后不管」安全操作员。** 它扫描、利用、**修复**、再扫描，不断循环，直到扫描器安静下来；然后持续过度加固各项控制，直到强行闯入成为一个断送职业生涯的决定。

[这是什么](#这是什么) · [安装](#安装) · [运行](#运行) · [工作原理](#引爆序列) · [兼容性](#兼容性) · [安全](#交战规则)

</div>

---

> **Breachproof 不是顾问。它是军火。**
> 大多数安全工具丢给你一份 400 行的报告，然后祝你好运。Breachproof 会阅读它刚刚
> 生成的报告，**在你的代码中修复每一项发现**，用一次干净的重新扫描来证明修复，
> 并且只要还有任何东西可找，就拒绝停止。你运行一个命令。其余的它全包了。

## 这是什么

Breachproof 是一个面向 [opencode](https://opencode.ai)（以及任何能加载 Markdown
代理的运行时）的自主式安全代理。它把一整套应用安全计划整合进一个不断循环、可自
我修复的工作流中：SAST、SCA、密钥扫描、IaC 与容器审查、CI/CD 加固、
auth/IDOR/注入/SSRF/加密分析、AI/LLM 红队演练，以及可选的实时渗透测试。它持续运
行该工作流，直到项目零开放发现，然后继续推进，为 SOC 2 过度加固。

Breachproof 是操作员。它所挥舞的武器存放在其姊妹项目
**[Sectinel](https://github.com/Mikaru0Mystic/sectinel)** 中，那是开放的安全武器库
（784 项技能、MCP 接线与扫描器集成）。Breachproof 是大脑，Sectinel 是军械库。

| | |
|---|---|
| **你做** | `/breachproof` |
| **它做** | 侦察、威胁建模、并行扫描、分诊、**修复**、重新扫描、**循环至干净**、加固、报告 |
| **它停止于** | 一次全新的完整重扫显示零严重/高/中风险，每个残留项都被明确处置，并且 CI 中已设置回归门禁 |
| **它从不** | 丢给你一份待办清单、靠压制发现来伪造干净结果，或交付未经验证的「修复」 |

## 为什么存在

AI 编程代理让团队每小时都在发布代码。而安全评审仍然大约一年才发生一次。其余的
364 天，你都在把漏洞推向生产环境，并祈祷不出事。Breachproof 用按需、自主的修复
来弥合这一鸿沟，你可以对每个分支、每次构建、每个「我凌晨两点灵感来了写的」提交
运行它，让代码树变得**坚不可破**。

## 角色设定

Breachproof 诞生于一场本不该发生的入侵的弹坑之中：一个未经校验的输入、一个未锁定
版本的依赖、一行没人读的日志。它偏执、戏剧化且不屈不挠，由三股驱动力推动：

- **审计（AUDIT）** 找出一切。每个输入都是敌意的，每个依赖都是潜伏特工。
- **利用（EXPLOIT）** 证明一切。没有概念验证，就没有结论。
- **加固（FORTIFY）** 过度强化一切。不是「安全」，而是*荒谬地*安全。

叙述中充满戏剧性，证据上严谨。每一项发现都附带 `file:line` 和可复现的 PoC。它从
不为了显得忙碌而编造发现，也从不为了显得完成而消音真实问题。

## 安装

**前置条件：** [opencode](https://opencode.ai)（或 Claude Code），以及用于完整覆盖
的 [Sectinel](https://github.com/Mikaru0Mystic/sectinel) 武器库。

```bash
# 1. 克隆
git clone https://github.com/Mikaru0Mystic/breachproof.git
cd breachproof

# 2. 安装代理 + 命令（并拉取 Sectinel 武器库）
bash scripts/install.sh          # macOS / Linux / WSL
#  或在 Windows PowerShell 上：
pwsh scripts/install.ps1
```

这会把 `agent/breachproof.md` 放入 `~/.config/opencode/agent/`，把
`command/breachproof.md` 放入 `~/.config/opencode/command/`，然后把 Sectinel 的
武器库安装到 `~/.config/opencode/cybersec-arsenal/`。

> **安装后请重启 opencode。** 配置在启动时加载一次，不会热重载。

<details>
<summary>手动安装</summary>

```bash
cp agent/breachproof.md   ~/.config/opencode/agent/
cp command/breachproof.md ~/.config/opencode/command/
# 然后安装 Sectinel：https://github.com/Mikaru0Mystic/sectinel
```
对于 Claude Code，请改为把 `agent/breachproof.md` 复制到 `~/.claude/agents/`。
</details>

## 运行

```
/breachproof                 # 对当前项目引爆
/breachproof ./path/to/app   # 指定某个目录
```

或者切换到 **breachproof** 代理并说 *“detonate”*。然后走开。它只会在最后出现一次，
带着一份**引爆报告**和一次干净的最终重扫作为证明。

## 引爆序列

Breachproof 自行运行这个循环，并行处理相互独立的工作，并重复第 2 至 6 阶段直到完成。

```
 0. ARM         对技术栈进行指纹识别；安装/定位每个扫描器
 1. MODEL       威胁建模：信任边界、攻击面、皇冠明珠
 2. SCAN WAVE   ship-safe · Sectinel 8 代理扫荡 · semgrep · 密钥 · SCA ·
                IaC/容器 · CI/CD · AI/LLM，全部并行
 3. TRIAGE      去重，CVSS + 置信度 + 可达性，剔除误报
 4. REMEDIATE   对每个真实发现在代码中应用最小且正确的修复
 5. VERIFY      为每个修复重跑对应扫描器；确认绿色；构建仍可用
 6. LOOP        回到第 2 步，直到满足「完成定义」
 7. FORTIFY     纵深防御的过度加固 + 一道回归 CI 门禁
 8. REPORT      前后计数、带 file:line 的修复、SOC 2 矩阵、证据
```

**完成定义：** 一次全新完整重扫为零严重/高/中风险，每个残留发现均被明确处置
（已修复 / 误报 / 已接受风险 / 需人工决策），并已提交一道回归门禁。

## 它所挥舞的武器（通过 [Sectinel](https://github.com/Mikaru0Mystic/sectinel)）

- **ship-safe**：23 代理防御性扫描器（无需 API 密钥，免费运行）
- **Sectinel 8 代理扫荡**（AgriciDaniel 的 `cybersecurity`）：业务逻辑、授权、供应链、IaC、AI 代码
- **784 项安全技能**（Anthropic-Cybersecurity-Skills、briiirussell、AgriciDaniel），映射到 MITRE ATT&CK / ATLAS / D3FEND / NIST，并按需读取
- **semgrep**、**gitleaks/trufflehog**、**osv-scanner**、**trivy**、**checkov**、**hadolint**
- **安全类 MCP 服务器**（例如 Semgrep MCP），在已配置时
- **Shannon** 与 **PentAGI**：自主实时渗透测试器，仅用于*已授权*目标（见下文）

## 兼容性

Breachproof 以可移植的 Markdown 代理加上一个触发命令的形式分发，其武器库
（[Sectinel](https://github.com/Mikaru0Mystic/sectinel)）依据开放的
**[agentskills.io](https://agentskills.io)** 标准编写。这让整套体系与运行时无关，
因此在任何能加载技能与代理的地方都能运行：

| 运行时 | 状态 | 安装 |
|---|---|---|
| **opencode** | ✅ 一等支持 | `scripts/install.sh`（装入 `~/.config/opencode/agent` + `command`） |
| **Claude Code** | ✅ 一等支持 | 把 `agent/breachproof.md` 复制到 `~/.claude/agents/`；武器库到 `~/.claude/skills/` |
| **Hermes Agent**（NousResearch） | ✅ 兼容 | agentskills.io 技能原生加载；见 [`adapters/`](adapters/) |
| **OpenClaw** | ✅ 兼容 | agentskills.io 技能 + 可移植代理提示词；见 [`adapters/`](adapters/) |
| **Cursor** | ✅ 通过适配器 | `adapters/cursor/`（`.cursor/rules/`） |
| **OpenAI Codex CLI** | ✅ 通过适配器 | `adapters/codex/` |
| **Cline · Windsurf · Roo Code · Continue · Aider · Gemini CLI** | ✅ 兼容 | 任何兼容 agentskills.io 的加载器 |

由于代理只是一段纯提示词，技能又遵循开放标准，因此**零锁定**：把任何兼容的运行时
指向这个仓库（以及 Sectinel），Breachproof 就能工作。每个平台的说明见
[`adapters/README.md`](adapters/README.md)。

## 把 SOC 2 当作一种挑战

Breachproof 不把 SOC 2 当作一个打勾项，而是当作一种挑战：让系统被锁得如此严密、
加密、最小权限、有完整日志、签名且防篡改，以至于*一个政府机构都不得不止步、找不到
进入的途径，最后只能礼貌地提交一份后门申请。* 每一项发现和控制都映射到信任服务
准则（CC1 至 CC9，外加保密性与隐私性）。见 [docs/soc2.md](docs/soc2.md)。

## 交战规则

Breachproof 在**你自己的项目上**是自主的。它会不经询问地编辑、修复并提交，因为这
正是它的全部意义。它仅有的硬性限制：

- **主动利用引擎需要一个你拥有且已确认的目标。** Shannon 与 PentAGI 会发起*真实*
  攻击；对于任何你无法确认拥有或已获授权测试的对象，Breachproof 拒绝将它们对准。
  完整的静态、SCA、密钥、IaC 与修复流水线**无需**它们即可归零。
- **未经你明确许可，绝不 push / merge / deploy。** 它在本地修复并提交；是否发布由你决定。
- **绝不伪造绿色。** 发现归零靠的是被*修复*，而非被压制。
- **秘密始终保密。** 泄露的凭据会从代码中移除并标记为需轮换。它从不打印或动用任何实时密钥。

> ⚖️ 仅对你拥有或已获明确授权测试的系统运行进攻性引擎。未经授权的扫描在大多数
> 司法管辖区都是违法的。见 [SECURITY.md](SECURITY.md)。

## 文档

- [docs/architecture.md](docs/architecture.md)：循环、武器库与 Sectinel 如何协同
- [docs/usage.md](docs/usage.md)：调用、参数、CI 用法、故障排查
- [docs/soc2.md](docs/soc2.md)：SOC 2 信任服务准则控制映射

## 姊妹项目

**[Sectinel](https://github.com/Mikaru0Mystic/sectinel)** 是 Breachproof 所挥舞的
开放安全武器库：784 项技能、MCP 接线与扫描器集成，集于一个可安装的套件。安装
Sectinel，让 Breachproof 发挥全部威力。

## 贡献

来自实战的反馈是最有用的贡献。如果 Breachproof 漏掉了一类漏洞、伪造了修复，或在真实
项目上卡住了，这正是我们想听到的。见 [CONTRIBUTING.md](CONTRIBUTING.md) 与我们的
[行为准则](CODE_OF_CONDUCT.md)。

## 许可证

[Apache License 2.0](LICENSE)。第三方署名见 [NOTICE](NOTICE)。

## 鸣谢与署名

Breachproof 是一个编排层。它站在开源安全社区的肩膀上，并集成了以下项目（各自遵循
其自身许可证；Breachproof 不对它们重新许可）：

- **[Sectinel](https://github.com/Mikaru0Mystic/sectinel)**，捆绑的武器库（Apache-2.0）
- **[ship-safe](https://github.com/asamassekou10/ship-safe)** 作者 @asamassekou10（MIT）
- **[Shannon](https://github.com/KeygraphHQ/shannon)** 作者 Keygraph（AGPL-3.0，调用而非捆绑）
- **[PentAGI](https://github.com/vxcontrol/pentagi)** 作者 vxcontrol（Apache-2.0 / EULA，调用而非捆绑）
- **[Anthropic-Cybersecurity-Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills)** 作者 @mukul975（Apache-2.0）
- **[cybersecurity-skills](https://github.com/briiirussell/cybersecurity-skills)** 作者 Bri Russell（MIT）
- **[claude-cybersecurity](https://github.com/AgriciDaniel/claude-cybersecurity)** 作者 @AgriciDaniel（MIT）
- **[Semgrep](https://semgrep.dev)**、**[OSV-Scanner](https://github.com/google/osv-scanner)**、**[Trivy](https://github.com/aquasecurity/trivy)**、**[Gitleaks](https://github.com/gitleaks/gitleaks)**、**[Checkov](https://github.com/bridgecrewio/checkov)**，扫描引擎。

不隶属于上述任何一方，也未获其背书。所有商标归各自所有者所有。仅为已授权的防御性
用途而构建。
