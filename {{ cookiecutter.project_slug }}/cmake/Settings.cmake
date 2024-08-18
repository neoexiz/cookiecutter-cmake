option(${PROJECT_NAME}_BUILD_EXECUTABLE "Build the project as an executable, rather than a library." ON)

option(${PROJECT_NAME}_INSTALL "Create installation target for oat++" ON)
option(${PROJECT_NAME}_PACK "Create package target for oat++" ON)

option(${PROJECT_NAME}_ENABLE_VCPKG "Use Vcpkg" OFF)
option(${PROJECT_NAME}_ENABLE_CONAN "Use Conan" ON)

option(${PROJECT_NAME}_ENABLE_UNIT_TESTING "Enable unit tests for the projects (from the `test` subfolder)." ON)
option(${PROJECT_NAME}_USE_GTEST "Use the GoogleTest project for creating unit tests." ON)
option(${PROJECT_NAME}_USE_GOOGLE_MOCK "Use the GoogleMock project for extending the unit tests." OFF)
option(${PROJECT_NAME}_USE_CATCH2 "Use the Catch2 project for creating unit tests." OFF)

option(${PROJECT_NAME}_ENABLE_CODE_COVERAGE "Enable code coverage through GCC." OFF)

option(${PROJECT_NAME}_ENABLE_CLANG_TIDY "Enable static analysis with Clang-Tidy." OFF)
option(${PROJECT_NAME}_ENABLE_CPPCHECK "Enable static analysis with Cppcheck." ON)

option(${PROJECT_NAME}_ENABLE_DOXYGEN "Enable Doxygen documentation builds of source." ON)
