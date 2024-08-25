cmake_minimum_required(VERSION 3.22)

project({{ cookiecutter.project_slug }}
        VERSION {{ cookiecutter.project_version }}
        LANGUAGES C CXX)

set(CMAKE_C_STANDARD {{ cookiecutter.c_version }})
set(CMAKE_CXX_STANDARD {{ cookiecutter.cxx_version }})

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

## Dependency
include(Settings)
include(Vcpkg)
include(Doxygen)
include(Sphinx)

if (NOT ${PROJECT_NAME}_ENABLE_CONAN AND NOT ${PROJECT_NAME}_ENABLE_VCPKG)
    ## Third ExternalProject
    execute_process(COMMAND ${CMAKE_COMMAND}
            -B ${PROJECT_SOURCE_DIR}/third/build
            -S ${PROJECT_SOURCE_DIR}/third
            -DCMAKE_INSTALL_PREFIX=${PROJECT_BINARY_DIR}
    )
    execute_process(
            COMMAND ${CMAKE_COMMAND}
            --build ${PROJECT_SOURCE_DIR}/third/build
    )
endif ()

list(APPEND CMAKE_PREFIX_PATH ${PROJECT_BINARY_DIR})

set(GFLAGS_USE_TARGET_NAMESPACE ON)
find_package(gflags REQUIRED)
find_package(glog REQUIRED)

## Third FetchContent
include(modules/asio)
include(modules/libevent)

message(STATUS "Started CMake for ${PROJECT_NAME} v${PROJECT_VERSION}...")

## Library
add_library(${PROJECT_NAME}_LIB STATIC)
target_sources(${PROJECT_NAME}_LIB
        PRIVATE
        ${PROJECT_SOURCE_DIR}/src/module.c
)
target_include_directories(${PROJECT_NAME}_LIB
        PRIVATE
        ${LIBEVENT_INCLUDE_DIRS}
)
target_link_libraries(${PROJECT_NAME}_LIB PRIVATE event_core_static)

## Executable
if (${PROJECT_NAME}_BUILD_EXECUTABLE)
    add_executable(${PROJECT_NAME} misc/empty.cc)
    target_sources(${PROJECT_NAME}
            PRIVATE
            ${PROJECT_SOURCE_DIR}/src/main.cc
    )
    target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}_LIB)

    ## Third
    target_include_directories(${PROJECT_NAME}
            PRIVATE
            $<TARGET_PROPERTY:asio,INTERFACE_INCLUDE_DIRECTORIES>
    )
    target_link_directories(${PROJECT_NAME}
            PRIVATE
            ${PROJECT_BINARY_DIR}/lib
    )
    target_link_libraries(${PROJECT_NAME} PRIVATE gflags::gflags glog::glog)
endif ()

# Test
if (${PROJECT_NAME}_ENABLE_UNIT_TESTING)
    enable_testing()
    message(STATUS "Build unit tests for the project. Tests should always be found in the test folder")
    add_subdirectory(test)
endif ()

# INSTALL
if (${PROJECT_NAME}_INSTALL)
    include(scripts/install)
endif ()

# PACK
if (${PROJECT_NAME}_PACK)
    if (UNIX)
        message(STATUS "Current platform: Linux ")
        set(CPACK_GENERATOR "ZIP")
    elseif (WIN32)
        message(STATUS "Current platform: Windows ")
        set(CPACK_GENERATOR WIX) # Windows GUI pack installer
    else ()
        message(STATUS "Current platform: Unknown ")
        set(CPACK_GENERATOR "ZIP")
    endif ()
    include(CPack)
endif ()

