if(${PROJECT_NAME}_ENABLE_SPHINX)
    find_program(SPHINX_EXECUTABLE
            NAMES sphinx-build
            HINTS $ENV{SPHINX_DIR}
            HINTS ${SPHINX_ROOT}/bin
            PATH_SUFFIXES bin
            DOC "Sphinx documentation generator"
            )

    include(FindPackageHandleStandardArgs)

    find_package_handle_standard_args(Sphinx DEFAULT_MSG
            SPHINX_EXECUTABLE
            )

    mark_as_advanced(
            SPHINX_EXECUTABLE
    )

    message(STATUS "Sphinx has been setup and documentation is now available.")

    set(DOC_LANGUAGE "html")

    configure_file(
            ${PROJECT_SOURCE_DIR}/docs/conf.py.in
            ${PROJECT_BINARY_DIR}/conf.py
    )

    add_custom_target(
            ${PROJECT_NAME}_sphinx
            COMMAND ${SPHINX_EXECUTABLE} -b html -c ${PROJECT_BINARY_DIR} ${PROJECT_SOURCE_DIR}/docs ${PROJECT_BINARY_DIR}/sphinx
            COMMENT "Generate doxygen documentation"
    )
endif()
