if (${PROJECT_NAME}_ENABLE_VCPKG)
    if (NOT DEFINED VCPKG_ROOT)
        if (NOT DEFINED ENV{VCPKG_ROOT})
            message(FATAL_ERROR "Env {VCPKG_ROOT} is not found or defined")
        else ()
            set(VCPKG_ROOT $ENV{VCPKG_ROOT})
        endif ()
    endif ()

    if (NOT DEFINED ${CMAKE_TOOLCHAIN_FILE})
        # We know this wasn't set before so we need point the toolchain file to the newly found VCPKG_ROOT
        set(CMAKE_TOOLCHAIN_FILE ${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake CACHE STRING "")

        # Just setting vcpkg.cmake as toolchain file does not seem to actually pull in the code
        include(${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake)
    else ()
        message(SEND_ERROR "VCPKG Can't replace ${CMAKE_TOOLCHAIN_FILE}")
    endif ()
endif ()


