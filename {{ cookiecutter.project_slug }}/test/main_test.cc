#include <iostream>

#include <gtest/gtest.h>

using namespace std;
using namespace testing;

class ModuleTest : public testing::Test {
public:

    void SetUp() override {
        cout << "SetUp" << endl;
    }

    void TearDown() override {
        cout << "TearDown" << endl;
    }
};

TEST_F(ModuleTest, ble_packet_data) {
    ASSERT_EQ(0, 0);
}

class GlobalTest : public testing::Environment {
public:
    void SetUp() override {
        cout << "Global SetUp" << endl;
    }

    void TearDown() override {
        cout << "Global TearDown" << endl;
    }
};

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    ::testing::Environment *env = new GlobalTest();
    ::testing::AddGlobalTestEnvironment(env);
    return RUN_ALL_TESTS();
}


