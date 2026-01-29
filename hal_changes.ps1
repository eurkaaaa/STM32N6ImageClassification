$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

# 1) Copy stm32n6xx_hal_dma2d.h into Drivers/STM32N6xx_HAL_Driver/Inc/
$src = Join-Path $root "stm32n6xx_hal_dma2d.h"
$dst = Join-Path $root "Drivers\STM32N6xx_HAL_Driver\Inc\stm32n6xx_hal_dma2d.h"
if (Test-Path $src) {
  Copy-Item -Path $src -Destination $dst -Force
}

# 2) Comment out HAL_StatusTypeDef/HAL_LockTypeDef in stm32n6xx_hal_def.h
$halDefPath = Join-Path $root "Drivers\STM32N6xx_HAL_Driver\Inc\stm32n6xx_hal_def.h"
if (Test-Path $halDefPath) {
  $content = Get-Content -Path $halDefPath -Raw
  $wrappedPattern = "(?s)/\* Exported types -+\*/\s*#if\s+0\s*/\*\*\s*\@brief\s+HAL Status structures definition.*?HAL_LockTypeDef;\s*#endif"
  if ($content -notmatch $wrappedPattern) {
    $startMarker = "/* Exported types ------------------------------------------------------------*/"
    $statusMarker = "@brief  HAL Status structures definition"
    $endMarker = "} HAL_LockTypeDef;"

    $startLineIndex = $content.IndexOf($startMarker)
    if ($startLineIndex -ge 0) {
      $statusIndex = $content.IndexOf($statusMarker, $startLineIndex)
      $endIndex = $content.IndexOf($endMarker, $statusIndex)
      if (($statusIndex -ge 0) -and ($endIndex -ge 0)) {
        $endIndex = $endIndex + $endMarker.Length
        $before = $content.Substring(0, $startLineIndex + $startMarker.Length)
        $middle = $content.Substring($startLineIndex + $startMarker.Length, $endIndex - ($startLineIndex + $startMarker.Length))
        $after = $content.Substring($endIndex)

        $middle = $middle.TrimStart("`r", "`n")
        $content = $before + "`r`n#if 0`r`n" + $middle + "`r`n#endif`r`n" + $after
        Set-Content -Path $halDefPath -Value $content
      }
    }
  }
}

# 3) Insert HAL_StatusTypeDef/HAL_LockTypeDef into FSBL/Core/Inc/stm32n6xx_hal_conf.h
$halConfPath = Join-Path $root "FSBL\Core\Inc\stm32n6xx_hal_conf.h"
if (Test-Path $halConfPath) {
  $content = Get-Content -Path $halConfPath -Raw
  if ($content -notmatch "HAL_StatusTypeDef") {
    $insert = @"
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

"@
    $content = [regex]::Replace($content, "/\* Exported types ------------------------------------------------------------\*/\r?\n", "`$0$insert")
    Set-Content -Path $halConfPath -Value $content
  }

  # Enable HAL_DMA2D_MODULE_ENABLED by removing comment markers
  $content = Get-Content -Path $halConfPath -Raw
  $content = $content.Replace("/*#define HAL_DMA2D_MODULE_ENABLED   */", "#define HAL_DMA2D_MODULE_ENABLED")
  Set-Content -Path $halConfPath -Value $content
}
