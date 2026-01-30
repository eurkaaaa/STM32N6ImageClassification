$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

# Target ltdc.c in FSBL/Core/Src
$ltdcPath = Join-Path $root "FSBL\Core\Src\ltdc.c"
if (-not (Test-Path $ltdcPath)) {
  throw "ltdc.c not found at $ltdcPath"
}

$content = Get-Content -Path $ltdcPath -Raw

# 1) Rename CubeMX MX_LTDC_Init(void) -> MX_LTDC_Init_CubeMX(void)
$oldSig = "void MX_LTDC_Init(void)"
$newSig = "void MX_LTDC_Init_CubeMX(void)"
if ($content -match [regex]::Escape($oldSig)) {
  $content = $content -replace [regex]::Escape($oldSig), $newSig
}

# 2) Add BSP-compatible wrapper if missing
# Always remove any previously injected BSP wrapper (good or bad) so the script is idempotent.
# This also repairs the common corruption where the wrapper was injected inside MX_LTDC_Init_CubeMX
# due to matching the '}' in 'LTDC_LayerCfgTypeDef pLayerCfg = {0};'.
$wrapperSigPattern = "HAL_StatusTypeDef\s+MX_LTDC_Init\(LTDC_HandleTypeDef\s*\*hltdc,\s*uint32_t\s+Width,\s*uint32_t\s+Height\)"
$wrapperBodyPattern = "(?ms)\r?\n\s*${wrapperSigPattern}\s*\{[\s\S]*?^\}\s*;?\s*"
$content = [regex]::Replace($content, $wrapperBodyPattern, "`r`n")

# Repair missing semicolon if a previous run split the line.
$content = $content -replace "LTDC_LayerCfgTypeDef\s+pLayerCfg\s*=\s*\{0\}\s*(\r?\n)", "LTDC_LayerCfgTypeDef pLayerCfg = {0};$1"

# (Re)Add BSP-compatible wrapper
$wrapper = @"

HAL_StatusTypeDef MX_LTDC_Init(LTDC_HandleTypeDef *hltdc, uint32_t Width, uint32_t Height)
{
  (void)hltdc;
  (void)Width;
  (void)Height;
  MX_LTDC_Init_CubeMX();
  return HAL_OK;
}
"@

# Insert wrapper immediately after the *end* of MX_LTDC_Init_CubeMX.
# Important: match the function's closing brace at the start of a line (^) to avoid
# stopping at the '}' inside struct initializers like '{0}'.
$pattern = "(?ms)(void\s+MX_LTDC_Init_CubeMX\(void\)\s*\{[\s\S]*?^\}\s*)"
if ($content -match $pattern) {
  $content = [regex]::Replace($content, $pattern, { param($m) $m.Groups[1].Value.TrimEnd() + $wrapper }, 1)
} else {
  # fallback: append at end of file
  $content += $wrapper
}

Set-Content -Path $ltdcPath -Value $content

# Update ltdc.h to match new signatures
$ltdcHeaderPath = Join-Path $root "FSBL\Core\Inc\ltdc.h"
if (-not (Test-Path $ltdcHeaderPath)) {
  throw "ltdc.h not found at $ltdcHeaderPath"
}

$hContent = Get-Content -Path $ltdcHeaderPath -Raw

# Replace old prototype if present
$hContent = $hContent -replace "void\s+MX_LTDC_Init\(void\);", "void MX_LTDC_Init_CubeMX(void);`r`nHAL_StatusTypeDef MX_LTDC_Init(LTDC_HandleTypeDef *hltdc, uint32_t Width, uint32_t Height);"

# Ensure wrapper declarations exist if prototype was missing
if ($hContent -notmatch "MX_LTDC_Init_CubeMX") {
  $hContent = $hContent -replace "void\s+MX_LTDC_Init\(void\);", "void MX_LTDC_Init_CubeMX(void);"
}
if ($hContent -notmatch "HAL_StatusTypeDef\s+MX_LTDC_Init\(LTDC_HandleTypeDef\s*\*hltdc,\s*uint32_t\s+Width,\s*uint32_t\s+Height\)") {
  $hContent = $hContent -replace "void\s+MX_LTDC_Init_CubeMX\(void\);", "void MX_LTDC_Init_CubeMX(void);`r`nHAL_StatusTypeDef MX_LTDC_Init(LTDC_HandleTypeDef *hltdc, uint32_t Width, uint32_t Height);"
}

Set-Content -Path $ltdcHeaderPath -Value $hContent

# Update main.c to use CubeMX init name
$mainPath = Join-Path $root "FSBL\Core\Src\main.c"
if (Test-Path $mainPath) {
  $mContent = Get-Content -Path $mainPath -Raw
  $mContent = $mContent -replace "MX_LTDC_Init\(\);", "MX_LTDC_Init_CubeMX();"
  Set-Content -Path $mainPath -Value $mContent
}
