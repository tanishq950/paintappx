cmake_minimum_required(VERSION 3.16)
project(PaintOpenGL LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(PaintOpenGL WIN32 src/main.cpp)

if(WIN32)
    set(VCPKG_ROOT "C:/vcpkg")
    set(SDL2_ROOT "${VCPKG_ROOT}/installed/x64-windows")

    find_path(SDL2_INCLUDE_DIR
        NAMES SDL2/SDL.h
        PATHS "${SDL2_ROOT}/include"
        NO_DEFAULT_PATH
    )
    find_library(SDL2_LIBRARY
        NAMES SDL2
        PATHS "${SDL2_ROOT}/lib"
        NO_DEFAULT_PATH
    )

    if(NOT SDL2_INCLUDE_DIR OR NOT SDL2_LIBRARY)
        message(FATAL_ERROR "SDL2 was not found in ${SDL2_ROOT}. Install SDL2 with vcpkg first.")
    endif()

    target_include_directories(PaintOpenGL PRIVATE "${SDL2_INCLUDE_DIR}")
    target_link_libraries(PaintOpenGL PRIVATE "${SDL2_LIBRARY}" opengl32)

elseif(UNIX)
    find_path(SDL2_INCLUDE_DIR NAMES SDL2/SDL.h
        PATHS /usr/include /usr/local/include
        NO_DEFAULT_PATH
    )
    find_library(SDL2_LIBRARY
        NAMES SDL2 SDL2-2.0 SDL2-2.0.so.0
        PATHS /lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
        NO_DEFAULT_PATH
    )
    find_library(OPENGL_LIBRARY
        NAMES GL OpenGL libGL.so.1
        PATHS /lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
        NO_DEFAULT_PATH
    )

    if(NOT SDL2_INCLUDE_DIR OR NOT SDL2_LIBRARY OR NOT OPENGL_LIBRARY)
        message(FATAL_ERROR "SDL2/OpenGL development/runtime libraries were not found")
    endif()

    target_include_directories(PaintOpenGL PRIVATE "${SDL2_INCLUDE_DIR}")
    target_link_libraries(PaintOpenGL PRIVATE "${SDL2_LIBRARY}" "${OPENGL_LIBRARY}" dl pthread)
endif()
