cmake_minimum_required(VERSION 3.9)
project( CallCppFromC)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_VERBOSE_MAKEFILE ON)

add_executable(main main.c codecpp.cpp codecpp.h)
