cmake_minimum_required(VERSION 3.20)

project(TestCMake
        VERSION 0.1.0
        LANGUAGES C CXX)

include(GNUInstallDirs)

set(CMAKE_C_STANDARD 11)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Dependency

include(cmake/DefaultSettings.cmake)
include(cmake/StaticAnalyzers.cmake)
include(cmake/Conan.cmake)
include(cmake/Vcpkg.cmake)
include(cmake/Doxygen.cmake)

message(STATUS "Started CMake for ${PROJECT_NAME} v${PROJECT_VERSION}...\n")

find_package(GTest CONFIG REQUIRED)

list(APPEND ${PROJECT_NAME}_LIB_SOURCES
        src/module.c
        )

add_library(${PROJECT_NAME}_LIB ${${PROJECT_NAME}_LIB_SOURCES})
target_include_directories(${PROJECT_NAME}_LIB PUBLIC .)

list(APPEND ${PROJECT_NAME}_SOURCES
        src/main.cc
        )

if(${PROJECT_NAME}_BUILD_EXECUTABLE)
    add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_SOURCES})
    target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME}_LIB)
endif()

# Test
if(${PROJECT_NAME}_ENABLE_UNIT_TESTING)
    enable_testing()
    message(STATUS "Build unit tests for the project. Tests should always be found in the test folder\n")
    add_subdirectory(test)
endif()

# INSTALL
if (${PROJECT_NAME}_INSTALL)
    include(module_install)
endif ()

# PACK
if (${PROJECT_NAME}_PACK)
    set(CPACK_GENERATOR WIX) # Windows GUI pack
    #    set(CPACK_GENERATOR "ZIP") # Compressor Pack
    include(CPACK)
endif ()

