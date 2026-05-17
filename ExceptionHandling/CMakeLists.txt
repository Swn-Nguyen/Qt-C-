cmake_minimum_required(VERSION 3.19)
project(ExceptionHandling LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(ExceptionHandling
    main.cpp
)

target_link_libraries(ExceptionHandling
    PRIVATE
        Qt::Core
)

install(TARGETS ExceptionHandling
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
