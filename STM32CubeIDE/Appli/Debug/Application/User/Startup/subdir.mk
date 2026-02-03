################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Application/User/Startup/startup_stm32n657x0hxq.s 

OBJS += \
./Application/User/Startup/startup_stm32n657x0hxq.o 

S_DEPS += \
./Application/User/Startup/startup_stm32n657x0hxq.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/Startup/%.o: ../Application/User/Startup/%.s Application/User/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -c -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Drivers/aps256xx" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Drivers/Common" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Drivers/STM32N6570-DK" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Utilities/lcd" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors/imx335" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors/vd6g" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/sensors/vd55g1" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/ISP_Library/evision/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware/ISP_Library/isp/Inc" -I"D:/STM32/STM32CubeIDE/STM32N6DK3/STM32CubeIDE/Appli/Middlewares/Camera_Middleware" -I"C:/Users/Lenovo/STM32Cube/Repository/STM32Cube_FW_N6_V1.2.0/Drivers/CMSIS/DSP/Include" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Application-2f-User-2f-Startup

clean-Application-2f-User-2f-Startup:
	-$(RM) ./Application/User/Startup/startup_stm32n657x0hxq.d ./Application/User/Startup/startup_stm32n657x0hxq.o

.PHONY: clean-Application-2f-User-2f-Startup

