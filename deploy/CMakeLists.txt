cmake_minimum_required(VERSION 3.0)

include(ExternalProject)

set(INSTALL_PATH ${CMAKE_BINARY_DIR}/output)
set(COMMON_OPTIONS -D CMAKE_C_COMPILER=${CMAKE_C_COMPILER} -D CMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -D CMAKE_INSTALL_PREFIX=${INSTALL_PATH})

# libupm relies on libmraa
SET(ENV{PKG_CONFIG_PATH} "${INSTALL_PATH}/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")

# build libraries and put them under ~/output
# TODO: decide if we want statc build
ExternalProject_Add(
    mraa 
    GIT_REPOSITORY https://github.com/intel-iot-devkit/mraa
    GIT_TAG v1.7.0
    CMAKE_ARGS ${COMMON_OPTIONS} -D BUILDSWIG=OFF -D BUILDARCH=arm
)

# TODO: enable libupm
# ExternalProject_Add(
#     upm
#     GIT_REPOSITORY https://github.com/intel-iot-devkit/upm
#     GIT_TAG v1.3.0
#     CMAKE_ARGS ${COMMON_OPTIONS} -D BUILDSWIGNODE=OFF -D BUILDSWIGPYTHON=OFF -D BUILDARCH=arm
# )

ExternalProject_Add(
    opencv
    GIT_REPOSITORY https://github.com/opencv/opencv
    GIT_TAG 3.2.0
    CMAKE_ARGS ${COMMON_OPTIONS} -D CMAKE_BUILD_TYPE=Release -D CMAKE_TOOLCHAIN_FILE=${CMAKE_BINARY_DIR}/opencv-prefix/src/opencv/platforms/linux/aarch64-gnu.toolchain.cmake 
    -D WITH_CUDA=OFF -D BUILD_DOCS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF
)