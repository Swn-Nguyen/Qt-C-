cmake_minimum_required(VERSION 3.19)
project(Assignment_Casting LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(Assignment_Casting
    main.cpp
    consumer.h consumer.cpp
    producer.h producer.cpp
)

target_link_libraries(Assignment_Casting
    PRIVATE
        Qt::Core
)

install(TARGETS Assignment_Casting
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
