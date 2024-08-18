include(ExternalProject)

# This will install libevent when use cmake --build build --target libevent
FetchContent_Declare(libevent
        GIT_REPOSITORY https://github.com/libevent/libevent.git
        GIT_TAG release-2.1.12-stable
        INSTALL_DIR ${CMAKE_BINARY_DIR} # cmake will find libraries in CMAKE_BINARY_DIR
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
)

FetchContent_MakeAvailable(libevent)
