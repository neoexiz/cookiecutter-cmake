#include <iostream>
#include "module.h"
#include "asio.hpp"
#include "glog/logging.h"

int main() {
    google::InitGoogleLogging("{{ cookiecutter.project_slug }}");
    FLAGS_minloglevel = -1;
    FLAGS_alsologtostderr = true;

    asio::io_context ioc;

    LOG(INFO) << "Hello World!";

    asio::steady_timer timer(ioc, asio::chrono::seconds(1));
    timer.async_wait([](const asio::error_code&){
        module_init();
    });

    ioc.run();
    return 0;
}

