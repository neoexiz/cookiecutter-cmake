option(${PROJECT_NAME}_BUILD_EXECUTABLE "Build the project as an executable, rather than a library." ON)

option(${PROJECT_NAME}_INSTALL "Create installation target for oat++" ON)
option(${PROJECT_NAME}_PACK "Create package target for oat++" ON)

option(${PROJECT_NAME}_ENABLE_VCPKG "Use Vcpkg" ON)
option(${PROJECT_NAME}_ENABLE_CONAN "Use Conan" ON)

option(${PROJECT_NAME}_ENABLE_UNIT_TESTING "Enable unit tests for the projects (from the `test` subfolder)." ON)
option(${PROJECT_NAME}_USE_GTEST "Use the GoogleTest project for creating unit tests." ON)
option(${PROJECT_NAME}_USE_GOOGLE_MOCK "Use the GoogleMock project for extending the unit tests." OFF)
option(${PROJECT_NAME}_USE_CATCH2 "Use the Catch2 project for creating unit tests." OFF)

option(${PROJECT_NAME}_ENABLE_CODE_COVERAGE "Enable code coverage through GCC." OFF)

option(${PROJECT_NAME}_ENABLE_CLANG_TIDY "Enable static analysis with Clang-Tidy." OFF)
option(${PROJECT_NAME}_ENABLE_CPPCHECK "Enable static analysis with Cppcheck." ON)

option(${PROJECT_NAME}_ENABLE_DOXYGEN "Enable Doxygen documentation builds of source." ON)

option(${PROJECT_NAME}_ENABLE_LTO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." ON)
if (${PROJECT_NAME}_ENABLE_LTO)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)
    if (result)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
        message("LTO finished setting up.")
    else ()
        message(SEND_ERROR "IPO is not supported: ${output}.")
    endif ()
endif ()


option(${PROJECT_NAME}_ENABLE_CCACHE "Enable the usage of Ccache, in order to speed up rebuild times." ON)
if (${PROJECT_NAME}_ENABLE_CCACHE)
    find_program(CCACHE_FOUND ccache)
    if (CCACHE_FOUND)
        set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
        set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
        message("CCache finished setting up.")
    else ()
        message(SEND_ERROR "CCache is not found.")
    endif ()
endif ()

