# {{ cookiecutter.project_name }}

## Authors

*  [**{{ cookiecutter.author }}**](https://github.com/{{ cookiecutter.author }})

## Conan

Add `CMAKE_PROJECT_TOP_LEVEL_INCLUDES` definition

```bash
cmake -B build -S . -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=make/conan.cmake
cmake --build build
```

You could update `conan.cmake` from https://github.com/conan-io/cmake-conan/tree/develop2

## Version



## License

This project is licensed under the [MIT](https://mit-license.org/) - see the
[LICENSE](LICENSE) file for details
