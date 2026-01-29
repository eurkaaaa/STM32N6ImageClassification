$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

# Target i2c.c in FSBL/Core/Src
$i2cPath = Join-Path $root "FSBL\Core\Src\i2c.c"
if (-not (Test-Path $i2cPath)) {
  throw "i2c.c not found at $i2cPath"
}

$content = Get-Content -Path $i2cPath -Raw

# 1) Rename CubeMX MX_I2C1_Init(void) -> MX_I2C1_Init_CubeMX(void)
$oldSig = "void MX_I2C1_Init(void)"
$newSig = "void MX_I2C1_Init_CubeMX(void)"
if ($content -match [regex]::Escape($oldSig)) {
  $content = $content -replace [regex]::Escape($oldSig), $newSig
}

# 2) Add BSP-compatible wrapper if missing
if ($content -notmatch "HAL_StatusTypeDef\s+MX_I2C1_Init\(I2C_HandleTypeDef\s*\*hI2c,\s*uint32_t\s+timing\)") {
  $wrapper = @"

HAL_StatusTypeDef MX_I2C1_Init(I2C_HandleTypeDef *hI2c, uint32_t timing)
{
  (void)hI2c;
  (void)timing;
  MX_I2C1_Init_CubeMX();
  return HAL_OK;
}
"@

  # insert wrapper after MX_I2C1_Init_CubeMX definition
  $pattern = "(?s)void\s+MX_I2C1_Init_CubeMX\(void\)\s*\{.*?\}\s*"
  if ($content -match $pattern) {
    $content = [regex]::Replace($content, $pattern, { param($m) $m.Value + $wrapper }, 1)
  } else {
    # fallback: append at end of file
    $content += $wrapper
  }
}

Set-Content -Path $i2cPath -Value $content

# Update i2c.h to match new signatures
$i2cHeaderPath = Join-Path $root "FSBL\Core\Inc\i2c.h"
if (-not (Test-Path $i2cHeaderPath)) {
  throw "i2c.h not found at $i2cHeaderPath"
}

$hContent = Get-Content -Path $i2cHeaderPath -Raw

# Replace old prototype if present
$hContent = $hContent -replace "void\s+MX_I2C1_Init\(void\);", "void MX_I2C1_Init_CubeMX(void);`r`nHAL_StatusTypeDef MX_I2C1_Init(I2C_HandleTypeDef *hI2c, uint32_t timing);"

# Ensure wrapper declarations exist if prototype was missing
if ($hContent -notmatch "MX_I2C1_Init_CubeMX") {
  $hContent = $hContent -replace "void\s+MX_I2C1_Init\(void\);", "void MX_I2C1_Init_CubeMX(void);"
}
if ($hContent -notmatch "HAL_StatusTypeDef\s+MX_I2C1_Init\(I2C_HandleTypeDef\s*\*hI2c,\s*uint32_t\s+timing\)") {
  $hContent = $hContent -replace "void\s+MX_I2C1_Init_CubeMX\(void\);", "void MX_I2C1_Init_CubeMX(void);`r`nHAL_StatusTypeDef MX_I2C1_Init(I2C_HandleTypeDef *hI2c, uint32_t timing);"
}

Set-Content -Path $i2cHeaderPath -Value $hContent
