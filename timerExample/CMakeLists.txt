cmake_minimum_required(VERSION 3.19)
project(timerExample LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core LinguistTools)

qt_standard_project_setup()

qt_add_executable(timerExample
    main.cpp
    test.h test.cpp
)

qt_add_translations(
    TARGETS timerExample
    TS_FILES timerExample_vi_VN.ts
)

target_link_libraries(timerExample
    PRIVATE
        Qt::Core
)

install(TARGETS timerExample
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
