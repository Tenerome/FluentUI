﻿cmake_minimum_required(VERSION 3.16)
project(FluentUI)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS Core Quick Svg REQUIRED)
set(QT_INSTALL_QML ${Qt6Core_DIR}/../../../qml)
set(TARGET_TYPE SHARED)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/FluentUI)

if(WIN32)
	set(CMAKE_SHARED_LIBRARY_PREFIX "")
endif()

set(TARGET_RESOURCES res.qrc)
set(TARGET_SOURCES
    Def.cpp
    FluApp.cpp
    FluColorSet.cpp
    FluColors.cpp
    FluRegister.cpp
    FluTheme.cpp
    Fluent.cpp
    FluentUI.cpp
    NativeEventFilter.cpp
    WindowHelper.cpp
    qml_plugin.cpp
)

set(TARGET_HEADERS
    Def.h
    FluApp.h
    FluColorSet.h
    FluColors.h
    FluRegister.h
    FluTheme.h
    Fluent.h
    FluentUI.h
    NativeEventFilter.h
    WindowHelper.h
    qml_plugin.h
    stdafx.h
)

add_definitions(-DVERSION_IN="1.0.0")
add_definitions(-DVURI_STR="FluentUI")

add_library(${PROJECT_NAME} ${TARGET_TYPE} ${TARGET_SOURCES} ${TARGET_HEADERS} ${TARGET_RESOURCES})

set_target_properties(${PROJECT_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/FluentUI)

if(WIN32)
    target_link_libraries(${PROJECT_NAME} PRIVATE dwmapi user32)
else()
endif()

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick Qt5::Svg)

if(WIN32)
    include(build_windows.cmake)
else()
    include(build_macos.cmake)
endif()
