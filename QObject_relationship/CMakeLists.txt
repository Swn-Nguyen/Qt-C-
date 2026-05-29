cmake_minimum_required(VERSION 3.19)
project(QObject_relationship LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(QObject_relationship
    main.cpp

    server.h server.cpp
    client.h client.cpp
    myobject.h myobject.cpp
)

target_link_libraries(QObject_relationship
    PRIVATE
        Qt::Core
)

install(TARGETS QObject_relationship
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
