FetchContent_Declare(
    glm
    GIT_REPOSITORY https://github.com/g-truc/glm.git                       
    GIT_TAG 1.0.1
    GIT_SHALLOW TRUE
    GIT_PROGRESS TRUE
)                                                                      
FetchContent_MakeAvailable(glm)
include_directories(${glm_SOURCE_DIR})
