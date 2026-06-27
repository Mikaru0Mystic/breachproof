# Breachproof installer (Windows / PowerShell) — installs the agent +
# /breachproof command into opencode and pulls the Sectinel arsenal. Idempotent.
$ErrorActionPreference = 'Stop'

$cfg  = if ($env:OPENCODE_CONFIG_DIR) { $env:OPENCODE_CONFIG_DIR } else { Join-Path $HOME ".config\opencode" }
$root = Split-Path -Parent $PSScriptRoot

Write-Host "Installing Breachproof..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path (Join-Path $cfg "agent"), (Join-Path $cfg "command") | Out-Null
Copy-Item -LiteralPath (Join-Path $root "agent\breachproof.md")   -Destination (Join-Path $cfg "agent\breachproof.md")   -Force
Copy-Item -LiteralPath (Join-Path $root "command\breachproof.md") -Destination (Join-Path $cfg "command\breachproof.md") -Force
Write-Host "  ok agent   -> $cfg\agent\breachproof.md"
Write-Host "  ok command -> $cfg\command\breachproof.md  (/breachproof)"

# Claude Code compatibility
$claude = Join-Path $HOME ".claude"
if (Test-Path -LiteralPath $claude) {
  New-Item -ItemType Directory -Force -Path (Join-Path $claude "agents") | Out-Null
  Copy-Item -LiteralPath (Join-Path $root "agent\breachproof.md") -Destination (Join-Path $claude "agents\breachproof.md") -Force
  Write-Host "  ok claude  -> $claude\agents\breachproof.md"
}

# Sectinel arsenal
$arsenal = Join-Path $cfg "cybersec-arsenal"
if (Test-Path -LiteralPath $arsenal) {
  Write-Host "  ok arsenal -> Sectinel already present ($arsenal)"
} else {
  Write-Host "  -> installing the Sectinel arsenal..."
  if (Get-Command git -ErrorAction SilentlyContinue) {
    $tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("sectinel-" + [guid]::NewGuid().ToString('N'))
    try {
      git clone --depth 1 https://github.com/PockySweet/sectinel.git $tmp 2>&1 | Out-Null
      pwsh (Join-Path $tmp "scripts\install.ps1")
    } catch {
      Write-Host "  ! Sectinel install failed - install manually: https://github.com/PockySweet/sectinel" -ForegroundColor Yellow
    }
  } else {
    Write-Host "  ! git not found. Install Sectinel manually: https://github.com/PockySweet/sectinel" -ForegroundColor Yellow
  }
}

Write-Host ""
Write-Host "Done. Restart opencode, then run /breachproof" -ForegroundColor Green
