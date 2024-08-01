set(DLIB_CONFIG "\"${TOOLCHAIN_PREFIX}\\inc\\c\\Dlib_Config_Normal.h\"")

set(CMAKE_C_FLAGS
        "${CMAKE_C_FLAGS} -Oh --debug --endian=little --cpu=Cortex-M0+ -e --fpu=None --dlib_config ${DLIB_CONFIG}")

set(CMAKE_ASM_FLAGS
        "${CMAKE_ASM_FLAGS} --cpu ${auto_cpu} --fpu None")

set(CMAKE_EXE_LINKER_FLAGS
        "${CMAKE_EXE_LINKER_FLAGS} --config ${LINKER_SCRIPT} --map ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.map \
        --entry __iar_program_start --vfe --enable_stack_usage --text_out locale --no_out_extension")



