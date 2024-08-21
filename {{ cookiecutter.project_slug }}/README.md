# {{ cookiecutter.project_name }}

## Third-party

### FetchContent

For CMake build tree's projects, user could indexing sources and use targets in project.

* If the project is CMake project, it's almost rarely to do things.

* If the project is not CMake project, or user want to configure, build by costumed commands, refer to `ExternalProject` argument inherited by `FetchContent`.

### ExternalProject

For any project configure / build / install in any where.

Usually, they should be build and intalled first, before CMake script processing the `find_package` or finding other dependencies. 

```cmake
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
```

## Conan

### Method 1

General configuration

Add `CMAKE_PROJECT_TOP_LEVEL_INCLUDES` definition

```bash
cmake -B build -S . -D{{ cookiecutter.project_slug }}_ENABLE_CONAN=ON -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=cmake/Conan.cmake
cmake --build build
```

You could update `cmake/Conan.cmake` from https://github.com/conan-io/cmake-conan/tree/develop2

### Method 2

Use presets configurations

```bash
cmake --prefix "default" -B build -S .
```

## License

This project is licensed under the [MIT](https://mit-license.org/) - see the
[LICENSE](LICENSE) file for details
