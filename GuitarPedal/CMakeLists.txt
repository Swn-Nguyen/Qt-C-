cmake_minimum_required(VERSION 3.16)

project(GuitarPedal VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(appGuitarPedal
    main.cpp
)

qt_add_qml_module(appGuitarPedal
    URI GuitarPedal
    QML_FILES
        Main.qml
        RESOURCES
        RESOURCES
        RESOURCES resources.qrc
        RESOURCES 00-Assets/assets/Button-Pedal-Checked.png 00-Assets/assets/Button-Pedal-Checked@2x.png 00-Assets/assets/Button-Pedal.png 00-Assets/assets/Button-Pedal@2x.png 00-Assets/assets/Guitar-Pedal-Background.png 00-Assets/assets/Guitar-Pedal-Background@2x.png 00-Assets/assets/Knob-Dial.png 00-Assets/assets/Knob-Dial@2x.png 00-Assets/assets/Knob-Markings.png 00-Assets/assets/Knob-Markings@2x.png 00-Assets/assets/LED-Checked.png 00-Assets/assets/LED-Checked@2x.png 00-Assets/assets/LED.png 00-Assets/assets/LED@2x.png 00-Assets/assets/Screw.png 00-Assets/assets/Screw@2x.png 00-Assets/assets/Switch-Checked.png 00-Assets/assets/Switch-Checked@2x.png 00-Assets/assets/Switch.png 00-Assets/assets/Switch@2x.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appGuitarPedal PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appGuitarPedal
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appGuitarPedal
    PRIVATE Qt6::Quick
)

install(TARGETS appGuitarPedal
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
