param(
  [string]$RepoRoot = (Split-Path -Parent $PSCommandPath)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$target = Join-Path $RepoRoot 'ExtMemLoader\Core\Inc\stm32n6xx_hal_conf.h'
if (-not (Test-Path $target)) {
  throw "Target file not found: $target"
}

$content = Get-Content -LiteralPath $target -Raw

if ($content -match '\bHAL_StatusTypeDef\b' -or $content -match '\bHAL_LockTypeDef\b') {
  Write-Host 'Already patched: HAL_StatusTypeDef / HAL_LockTypeDef found.'
  exit 0
}

$needle = "/* Exported types ------------------------------------------------------------*/`r`n/* Exported constants --------------------------------------------------------*/"
$insert = @"
/* Exported types ------------------------------------------------------------*/
typedef enum
{
  HAL_OK       = 0x00,
  HAL_ERROR    = 0x01,
  HAL_BUSY     = 0x02,
  HAL_TIMEOUT  = 0x03
} HAL_StatusTypeDef;

/**
  * @brief  HAL Lock structures definition
  */
typedef enum
{
  HAL_UNLOCKED = 0x00,
  HAL_LOCKED   = 0x01
} HAL_LockTypeDef;

/* Exported constants --------------------------------------------------------*/
"@

if ($content -notlike "*$needle*") {
  throw 'Insertion point not found (expected the two comment lines back-to-back).'
}

$content = $content.Replace($needle, $insert)
Set-Content -LiteralPath $target -Value $content -Encoding UTF8

Write-Host "Patched: $target"
