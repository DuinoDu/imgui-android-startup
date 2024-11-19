#
# Add in your CMakeLists.txt
# >> include("cmake/imgui.cmake")
# >> add_library(
#       ...
#       ${IMGUI_SRCS}
#    )

include(FetchContent)
FetchContent_Populate(imgui
  URL https://github.com/ocornut/imgui/archive/docking.zip
  SOURCE_DIR ${CMAKE_BINARY_DIR}/imgui
)

set(IMGUI_SRCS
  ${CMAKE_BINARY_DIR}/imgui/imgui.cpp
  ${CMAKE_BINARY_DIR}/imgui/imgui_demo.cpp
  ${CMAKE_BINARY_DIR}/imgui/imgui_draw.cpp
  ${CMAKE_BINARY_DIR}/imgui/imgui_tables.cpp
  ${CMAKE_BINARY_DIR}/imgui/imgui_widgets.cpp
  ${CMAKE_BINARY_DIR}/imgui/backends/imgui_impl_android.cpp
  ${CMAKE_BINARY_DIR}/imgui/backends/imgui_impl_opengl3.cpp
)

include_directories(${CMAKE_BINARY_DIR}/imgui)
include_directories(${CMAKE_BINARY_DIR}/imgui/backends)
