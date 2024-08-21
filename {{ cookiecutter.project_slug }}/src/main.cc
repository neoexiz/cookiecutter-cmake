#include <iostream>
#include "module.h"
#include "asio.hpp"
#include "glog/logging.h"
#include "gflags/gflags.h"

int main(int argc, char* argv[]) {
    FLAGS_minloglevel = 0;
    FLAGS_alsologtostderr = true;
    gflags::ParseCommandLineFlags(&argc, &argv, true);

    google::InitGoogleLogging("cookiecuttercmake");
    asio::io_context ioc;

    LOG(INFO) << "Hello World!";

    asio::steady_timer timer(ioc, asio::chrono::seconds(1));
    timer.async_wait([](const asio::error_code&){
        module_init();
    });

    ioc.run();
    return 0;
}

