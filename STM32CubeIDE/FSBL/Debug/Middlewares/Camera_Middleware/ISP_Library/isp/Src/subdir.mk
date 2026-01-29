################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_algo.c \
../Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_cmd_parser.c \
../Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_core.c \
../Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_services.c \
../Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_tool_com.c 

OBJS += \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_algo.o \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_cmd_parser.o \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_core.o \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_services.o \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_tool_com.o 

C_DEPS += \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_algo.d \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_cmd_parser.d \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_core.d \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_services.d \
./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_tool_com.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Camera_Middleware/ISP_Library/isp/Src/%.o Middlewares/Camera_Middleware/ISP_Library/isp/Src/%.su Middlewares/Camera_Middleware/ISP_Library/isp/Src/%.cyclo: ../Middlewares/Camera_Middleware/ISP_Library/isp/Src/%.c Middlewares/Camera_Middleware/ISP_Library/isp/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N657xx -c -I../../../FSBL/Core/Inc -I../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../Middlewares/ST/STM32_ExtMem_Manager -I../../../Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../Middlewares/ST/STM32_ExtMem_Manager/user -I../../../Drivers/CMSIS/Include -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Drivers/Common" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Drivers/STM32N6570-DK" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Utilities/lcd" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/imx335" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/vd6g" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/sensors/vd55g1" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/ISP_Library/evision/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware/ISP_Library/isp/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK2/STM32CubeIDE/FSBL/Middlewares/Camera_Middleware" -I"C:/Users/Lenovo/STM32Cube/Repository/STM32Cube_FW_N6_V1.2.0/Drivers/CMSIS/DSP/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Camera_Middleware-2f-ISP_Library-2f-isp-2f-Src

clean-Middlewares-2f-Camera_Middleware-2f-ISP_Library-2f-isp-2f-Src:
	-$(RM) ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_algo.cyclo ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_algo.d ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_algo.o ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_algo.su ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_cmd_parser.cyclo ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_cmd_parser.d ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_cmd_parser.o ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_cmd_parser.su ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_core.cyclo ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_core.d ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_core.o ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_core.su ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_services.cyclo ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_services.d ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_services.o ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_services.su ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_tool_com.cyclo ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_tool_com.d ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_tool_com.o ./Middlewares/Camera_Middleware/ISP_Library/isp/Src/isp_tool_com.su

.PHONY: clean-Middlewares-2f-Camera_Middleware-2f-ISP_Library-2f-isp-2f-Src

