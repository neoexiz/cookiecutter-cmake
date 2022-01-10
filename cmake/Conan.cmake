if (${PROJECT_NAME}_ENABLE_CONAN)
    #
    # Setup Conan requires and options here:
    #
    set(${PROJECT_NAME}_CONAN_REQUIRES "")
    set(${PROJECT_NAME}_CONAN_OPTIONS "")

    if (NOT EXISTS "${CMAKE_SOURCE_DIR}/cmake/conan.cmake.in")
        message(FATAL_ERROR "Need conan.cmake from https://github.com/conan-io/cmake-conan")
    endif ()
    include(cmake/conan.cmake.in)

#    list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
#    list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})
#    if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
#        message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
#        file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/v0.17.0/conan.cmake"
#                "${CMAKE_BINARY_DIR}/conan.cmake"
#                EXPECTED_HASH SHA256=e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
#                TLS_VERIFY ON)
#    endif()
#    include(${CMAKE_BINARY_DIR}/conan.cmake)

    conan_add_remote(
            NAME bincrafters
            URL https://api.bintray.com/conan/bincrafters/public-conan
    )

    if(NOT DEFINED CONAN_PROFILE)
        message(STATUS "Missing specified conan profile.")
        set(CONAN_PROFILE default)
    endif(NOT DEFINED CONAN_PROFILE)

    message(STATUS "Conan Profile: ${CONAN_PROFILE}")

    conan_cmake_run(
            CONANFILE ${PROJECT_SOURCE_DIR}/conanfile.txt
            PROFILE ${CONAN_PROFILE}
            REQUIRES ${${PROJECT_NAME}_CONAN_REQUIRES}
            OPTIONS ${${PROJECT_NAME}_CONAN_OPTIONS}
            BASIC_SETUP CMAKE_TARGETS
            BUILD missing
    )

    conan_basic_setup()

    message(STATUS "Conan is setup and all requires have been installed.")
endif ()


