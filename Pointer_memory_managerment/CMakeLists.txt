cmake_minimum_required(VERSION 3.19)
project(Pointer_memory_managerment LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(Pointer_memory_managerment
    main.cpp
    test.h
    test.cpp
)

target_link_libraries(Pointer_memory_managerment
    PRIVATE
        Qt::Core
)

install(TARGETS Pointer_memory_managerment
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
