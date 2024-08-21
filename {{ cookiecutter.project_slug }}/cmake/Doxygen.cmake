if(${PROJECT_NAME}_ENABLE_DOXYGEN)
    set(DOXYGEN_CALLER_GRAPH YES)
    set(DOXYGEN_CALL_GRAPH YES)
    set(DOXYGEN_EXTRACT_ALL YES)
    set(DOXYGEN_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/doxygen)

    find_package(Doxygen
            REQUIRED COMPONENTS dot
            OPTIONAL_COMPONENTS mscgen dia)
    doxygen_add_docs(doxygen
            ${PROJECT_SOURCE_DIR}/src
            COMMENT "Generate doxygen documentation"
            WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
    )

    message(STATUS "Doxygen has been setup and documentation is now available.")
endif()
