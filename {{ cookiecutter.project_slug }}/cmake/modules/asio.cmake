include(FetchContent)

FetchContent_Declare(asio
        GIT_REPOSITORY https://github.com/chriskohlhoff/asio.git
        GIT_TAG asio-1-30-2
)
FetchContent_MakeAvailable(asio)

FetchContent_GetProperties(asio)
if(NOT asio_POPULATED)
    message(STATUS "Populating asio...")
    # Fetch the content using previously declared details
    FetchContent_Populate(asio)
endif()

add_library(asio INTERFACE)
target_include_directories(asio INTERFACE ${asio_SOURCE_DIR}/asio/include)
