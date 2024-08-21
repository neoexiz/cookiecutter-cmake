from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, cmake_layout


class ExampleRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    def requirements(self):
        self.requires("gtest/1.14.0")
        self.requires("glog/0.7.1")
        self.requires("gflags/2.2.2")

    def layout(self):
        cmake_layout(self)

    def configure(self):
        self.options["gflags"].shared = True
        self.options["gflags"].nothreads = False
        self.options["glog"].shared = True

    def generate(self):
        tc = CMakeToolchain(self)
        tc.generate()
