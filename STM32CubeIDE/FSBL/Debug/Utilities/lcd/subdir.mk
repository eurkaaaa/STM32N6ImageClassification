################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Utilities/lcd/stm32_lcd.c 

OBJS += \
./Utilities/lcd/stm32_lcd.o 

C_DEPS += \
./Utilities/lcd/stm32_lcd.d 


# Each subdirectory must supply rules for building sources it contributes
Utilities/lcd/%.o Utilities/lcd/%.su Utilities/lcd/%.cyclo: ../Utilities/lcd/%.c Utilities/lcd/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N657xx -c -I../../../FSBL/Core/Inc -I../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../Middlewares/ST/STM32_ExtMem_Manager -I../../../Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../Middlewares/ST/STM32_ExtMem_Manager/user -I../../../Drivers/CMSIS/Include -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Drivers/Common" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Drivers/STM32N6570-DK" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Utilities/lcd" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/imx335" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/vd6g" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/vd55g1" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/ISP_Library/evision/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/ISP_Library/isp/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware" -I"C:/Users/Lenovo/STM32Cube/Repository/STM32Cube_FW_N6_V1.2.0/Drivers/CMSIS/DSP/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Utilities-2f-lcd

clean-Utilities-2f-lcd:
	-$(RM) ./Utilities/lcd/stm32_lcd.cyclo ./Utilities/lcd/stm32_lcd.d ./Utilities/lcd/stm32_lcd.o ./Utilities/lcd/stm32_lcd.su

.PHONY: clean-Utilities-2f-lcd

