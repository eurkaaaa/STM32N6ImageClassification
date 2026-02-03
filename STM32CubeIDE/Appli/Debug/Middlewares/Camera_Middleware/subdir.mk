################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Camera_Middleware/cmw_camera.c \
../Middlewares/Camera_Middleware/cmw_utils.c 

OBJS += \
./Middlewares/Camera_Middleware/cmw_camera.o \
./Middlewares/Camera_Middleware/cmw_utils.o 

C_DEPS += \
./Middlewares/Camera_Middleware/cmw_camera.d \
./Middlewares/Camera_Middleware/cmw_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Camera_Middleware/%.o Middlewares/Camera_Middleware/%.su Middlewares/Camera_Middleware/%.cyclo: ../Middlewares/Camera_Middleware/%.c Middlewares/Camera_Middleware/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N657xx -c -I../../../Appli/Core/Inc -I../../../Secure_nsclib -I../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../Drivers/CMSIS/Include -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Drivers/Common" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Drivers/STM32N6570-DK" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Utilities/lcd" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors/imx335" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors/vd6g" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors/vd55g1" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/ISP_Library/evision/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/ISP_Library/isp/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware" -I"C:/Users/Lenovo/STM32Cube/Repository/STM32Cube_FW_N6_V1.2.0/Drivers/CMSIS/DSP/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Camera_Middleware

clean-Middlewares-2f-Camera_Middleware:
	-$(RM) ./Middlewares/Camera_Middleware/cmw_camera.cyclo ./Middlewares/Camera_Middleware/cmw_camera.d ./Middlewares/Camera_Middleware/cmw_camera.o ./Middlewares/Camera_Middleware/cmw_camera.su ./Middlewares/Camera_Middleware/cmw_utils.cyclo ./Middlewares/Camera_Middleware/cmw_utils.d ./Middlewares/Camera_Middleware/cmw_utils.o ./Middlewares/Camera_Middleware/cmw_utils.su

.PHONY: clean-Middlewares-2f-Camera_Middleware

