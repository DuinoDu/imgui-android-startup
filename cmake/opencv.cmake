# Usage:
# >> include(cmake/opencv.cmake)
# >> "Then you can add `lib_opencv` as link library to your target."
# 
# Be careful: DONT use this if you want to use waterdrop/photoid related libraries.
# You should use opencv_static in waterdrop instead.

if(NOT DEFINED OpencvVersion)
    set(OpencvVersion 4.10.0)
endif()

include(FetchContent)
option(CMAKE_TLS_VERIFY "Verify SSL certificates" ON)

if(NOT BUILD_ANDROID)
    message(FATAL_ERROR "Don't support host building.")
endif()
FetchContent_Declare(
    opencv
    URL https://github.com/opencv/opencv/releases/download/${OpencvVersion}/opencv-${OpencvVersion}-android-sdk.zip
    DOWNLOAD_NO_EXTRACT false
    DOWNLOAD_EXTRACT_TIMESTAMP true
)
FetchContent_MakeAvailable(opencv)
FetchContent_GetProperties(opencv)

set(OpenCV_DIR ${opencv_SOURCE_DIR}/sdk/native)
message("OpenCV_DIR=${OpenCV_DIR}")

include_directories(${OpenCV_DIR}/jni/include)

add_library(lib_opencv STATIC IMPORTED)
set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION
    ${OpenCV_DIR}/libs/arm64-v8a/libopencv_java4.so)
