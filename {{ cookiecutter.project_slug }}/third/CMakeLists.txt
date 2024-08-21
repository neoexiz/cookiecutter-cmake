cmake_minimum_required(VERSION 3.22)
project(third)

include(ExternalProject)

ExternalProject_Add(gflags
        URL https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.zip
        URL_HASH SHA1=baeb1d19f573a27c45f832be9f0e57fae873948f
        DOWNLOAD_EXTRACT_TIMESTAMP 1724241896
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX} # cmake will find libraries in CMAKE_BINARY_DIR
        CMAKE_ARGS
        -DBUILD_SHARED_LIBS=ON
        -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> #
)

ExternalProject_Add(glog
        URL https://github.com/google/glog/archive/refs/tags/v0.7.1.zip
        URL_HASH SHA1=8ec29681a237045e7ceec92587278c023664f18a
        DOWNLOAD_EXTRACT_TIMESTAMP 1724241896
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX} # cmake will find libraries in CMAKE_BINARY_DIR
        CMAKE_ARGS
        -DBUILD_SHARED_LIBS=ON
        -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
)

ExternalProject_Add(gtest
        URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
        URL_HASH SHA1=0ac421f2ec11af38b0fff0f1992184032731a8bc
        DOWNLOAD_EXTRACT_TIMESTAMP 1724241896
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX} # cmake will find libraries in CMAKE_BINARY_DIR
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
)
