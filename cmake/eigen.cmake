include(ExternalProject)
set(EIGEN_BUILD_DIR   ${CMAKE_BINARY_DIR}/external/eigen_download)
set(EIGEN_INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/external/eigen/include/eigen3)
set(EIGEN_INCLUDE_DIR ${EIGEN_INSTALL_DIR})

ExternalProject_Add(
    eigen
    URL https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz
    PREFIX ${EIGEN_BUILD_DIR}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND
    ${CMAKE_COMMAND} -E copy_directory ${EIGEN_BUILD_DIR}/src/eigen/Eigen ${EIGEN_INCLUDE_DIR}/Eigen 
    && ${CMAKE_COMMAND} -E copy_directory ${EIGEN_BUILD_DIR}/src/eigen/unsupported ${EIGEN_INCLUDE_DIR}/unsupported
    TEST_COMMAND ""
)
include_directories(SYSTEM ${EIGEN_INCLUDE_DIR})
