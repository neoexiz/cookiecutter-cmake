# {{ cookiecutter.project_name }}

## Authors

*  [**{{ cookiecutter.author }}**](https://github.com/{{ cookiecutter.author }})

## Conan

Add `CMAKE_PROJECT_TOP_LEVEL_INCLUDES` definition

```bash
cmake -B build -S . -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=make/conan_provider.cmake
cmake --build build
```

## Version



## License

This project is licensed under the [MIT](https://mit-license.org/) - see the
[LICENSE](LICENSE) file for details
