################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/STM32N6570-DK/stm32n6570_discovery_bus.c \
../Drivers/STM32N6570-DK/stm32n6570_discovery_lcd.c \
../Drivers/STM32N6570-DK/stm32n6570_discovery_xspi.c 

OBJS += \
./Drivers/STM32N6570-DK/stm32n6570_discovery_bus.o \
./Drivers/STM32N6570-DK/stm32n6570_discovery_lcd.o \
./Drivers/STM32N6570-DK/stm32n6570_discovery_xspi.o 

C_DEPS += \
./Drivers/STM32N6570-DK/stm32n6570_discovery_bus.d \
./Drivers/STM32N6570-DK/stm32n6570_discovery_lcd.d \
./Drivers/STM32N6570-DK/stm32n6570_discovery_xspi.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32N6570-DK/%.o Drivers/STM32N6570-DK/%.su Drivers/STM32N6570-DK/%.cyclo: ../Drivers/STM32N6570-DK/%.c Drivers/STM32N6570-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N657xx -c -I../../../FSBL/Core/Inc -I../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../Middlewares/ST/STM32_ExtMem_Manager -I../../../Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../Middlewares/ST/STM32_ExtMem_Manager/user -I../../../Drivers/CMSIS/Include -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Drivers/Common" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Drivers/STM32N6570-DK" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Utilities/lcd" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/imx335" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/vd6g" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/vd55g1" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/ISP_Library/evision/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/ISP_Library/isp/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware" -I"C:/Users/Lenovo/STM32Cube/Repository/STM32Cube_FW_N6_V1.2.0/Drivers/CMSIS/DSP/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-STM32N6570-2d-DK

clean-Drivers-2f-STM32N6570-2d-DK:
	-$(RM) ./Drivers/STM32N6570-DK/stm32n6570_discovery_bus.cyclo ./Drivers/STM32N6570-DK/stm32n6570_discovery_bus.d ./Drivers/STM32N6570-DK/stm32n6570_discovery_bus.o ./Drivers/STM32N6570-DK/stm32n6570_discovery_bus.su ./Drivers/STM32N6570-DK/stm32n6570_discovery_lcd.cyclo ./Drivers/STM32N6570-DK/stm32n6570_discovery_lcd.d ./Drivers/STM32N6570-DK/stm32n6570_discovery_lcd.o ./Drivers/STM32N6570-DK/stm32n6570_discovery_lcd.su ./Drivers/STM32N6570-DK/stm32n6570_discovery_xspi.cyclo ./Drivers/STM32N6570-DK/stm32n6570_discovery_xspi.d ./Drivers/STM32N6570-DK/stm32n6570_discovery_xspi.o ./Drivers/STM32N6570-DK/stm32n6570_discovery_xspi.su

.PHONY: clean-Drivers-2f-STM32N6570-2d-DK

