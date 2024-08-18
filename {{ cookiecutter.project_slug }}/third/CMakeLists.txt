cmake_minimum_required(VERSION 3.22)
project(third)

include(ExternalProject)

# This will install libevent when use cmake --build build --target libevent
ExternalProject_Add(gflags
        GIT_REPOSITORY https://github.com/gflags/gflags.git
        GIT_TAG v2.2.2
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX} # cmake will find libraries in CMAKE_BINARY_DIR
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
)

# This will install libevent when use cmake --build build --target libevent
ExternalProject_Add(glog
        GIT_REPOSITORY https://github.com/google/glog.git
        GIT_TAG v0.7.1
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX} # cmake will find libraries in CMAKE_BINARY_DIR
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
)


