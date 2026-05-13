cmake_minimum_required(VERSION 3.19)
project(QT_FirstApplication LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(QT_FirstApplication
    main.cpp
    source.h source.cpp
    destination.h destination.cpp
    radio.h radio.cpp
    station.h station.cpp
    test.h test.cpp
    watcher.h watcher.cpp
)

target_link_libraries(QT_FirstApplication
    PRIVATE
        Qt::Core
)

install(TARGETS QT_FirstApplication
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
