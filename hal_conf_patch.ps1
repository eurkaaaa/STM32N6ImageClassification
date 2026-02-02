param(
  [string]$FilePath = "Appli/Core/Inc/stm32n6xx_hal_conf.h"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $FilePath)) {
  throw "File not found: $FilePath"
}

$content = Get-Content -LiteralPath $FilePath -Raw

# Idempotency: skip if both typedefs already present
if ($content -match "typedef\s+enum\s*\{[\s\S]*?\}\s*HAL_StatusTypeDef\s*;" -and $content -match "typedef\s+enum\s*\{[\s\S]*?\}\s*HAL_LockTypeDef\s*;") {
  Write-Host "Already contains HAL_StatusTypeDef and HAL_LockTypeDef; no changes." -ForegroundColor Yellow
  exit 0
}

$eol = "`r`n"
if ($content -notmatch "`r`n") {
  $eol = "`n"
}

$insert = @(
  "typedef enum",
  "{",
  "  HAL_OK       = 0x00,",
  "  HAL_ERROR    = 0x01,",
  "  HAL_BUSY     = 0x02,",
  "  HAL_TIMEOUT  = 0x03",
  "} HAL_StatusTypeDef;",
  "",
  "/**",
  "  * @brief  HAL Lock structures definition",
  "  */",
  "typedef enum",
  "{",
  "  HAL_UNLOCKED = 0x00,",
  "  HAL_LOCKED   = 0x01",
  "} HAL_LockTypeDef;"
) -join $eol

$markerA = "/* Exported types ------------------------------------------------------------*/"
$markerB = "/* Exported constants --------------------------------------------------------*/"

$needle = $markerA + $eol + $markerB
if ($content -notlike "*$needle*") {
  throw "Insertion point not found: expected '$markerA' followed by '$markerB'"
}

$replacement = $markerA + $eol + $insert + $eol + $markerB
$newContent = $content.Replace($needle, $replacement)

# Write back without adding an extra newline
Set-Content -LiteralPath $FilePath -Value $newContent -NoNewline

Write-Host "Patched: $FilePath" -ForegroundColor Green
