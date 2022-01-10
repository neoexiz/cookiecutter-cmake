//
// Created by zhanghongwei on 2022/1/7.
//

#include <gtest/gtest.h>
#include <iostream>

using namespace std;
using namespace testing;

class ModuleTest : public testing::Test {
public:

    virtual void SetUp() {
        cout << "SetUp" << endl;
    }

    virtual void TearDown() {
        cout << "TearDown" << endl;
    }
};

TEST_F(ModuleTest, ble_packet_data) {
    ASSERT_EQ(0, 0);
}

class GlobalTest : public testing::Environment {
public:
    virtual void SetUp() {
        cout << "Global SetUp" << endl;
    }

    virtual void TearDown() {
        cout << "Global TearDown" << endl;
    }
};

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    ::testing::Environment *env = new GlobalTest();
    ::testing::AddGlobalTestEnvironment(env);
    return RUN_ALL_TESTS();
}


