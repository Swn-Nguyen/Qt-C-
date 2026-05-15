cmake_minimum_required(VERSION 3.19)
project(cast LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(cast
    main.cpp
    samsungproduct.h samsungproduct.cpp
    samsungwatch.h samsungwatch.cpp
    iphone.h iphone.cpp

)

target_link_libraries(cast
    PRIVATE
        Qt::Core
)

install(TARGETS cast
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
