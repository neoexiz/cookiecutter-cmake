project(${CMAKE_PROJECT_NAME}Tests LANGUAGES CXX)

message(STATUS "Adding tests under ${CMAKE_PROJECT_NAME}Tests...")

message(STATUS "Under ${PROJECT_NAME}")

file(GLOB_RECURSE ${PROJECT_NAME}TestsSources
        *.cc
        )

add_executable(${PROJECT_NAME} ${${PROJECT_NAME}TestsSources})

#
# Setup code coverage if enabled
#
if (${CMAKE_PROJECT_NAME}_ENABLE_CODE_COVERAGE)
    target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC -O0 -g -fprofile-arcs -ftest-coverage)
    target_link_options(${CMAKE_PROJECT_NAME} PUBLIC -fprofile-arcs -ftest-coverage)
    message("Code coverage is enabled and provided with GCC.")
endif ()

#
# Load the desired unit testing framework
#
# Currently supported: GoogleTest (and GoogleMock), Catch2.

if (${CMAKE_PROJECT_NAME}_BUILD_EXECUTABLE)
    set(${CMAKE_PROJECT_NAME}_TEST_LIB ${CMAKE_PROJECT_NAME}_LIB)
else ()
    set(${CMAKE_PROJECT_NAME}_TEST_LIB ${CMAKE_PROJECT_NAME})
endif ()

if (${CMAKE_PROJECT_NAME}_USE_GTEST)
    find_package(GTest REQUIRED)

    if (${CMAKE_PROJECT_NAME}_USE_GOOGLE_MOCK)
        set(GOOGLE_MOCK_LIBRARIES GTest::gmock GTest::gmock_main)
    endif ()

    target_link_libraries(${PROJECT_NAME} PUBLIC
            GTest::GTest
            GTest::Main
            ${GOOGLE_MOCK_LIBRARIES}
            ${${CMAKE_PROJECT_NAME}_TEST_LIB}
            )
elseif (${CMAKE_PROJECT_NAME}_USE_CATCH2)
    find_package(Catch2 REQUIRED)
    target_link_libraries(${PROJECT_NAME} PUBLIC
            Catch2::Catch2
            ${${CMAKE_PROJECT_NAME}_TEST_LIB}
            )
else ()
    message(FATAL_ERROR "Unknown testing library. Please setup your desired unit testing library by using `target_link_libraries`.")
endif ()

message(STATUS "Finished adding unit tests for ${CMAKE_PROJECT_NAME}.")
