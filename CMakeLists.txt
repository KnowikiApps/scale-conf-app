# Generated from scale-conf.pro.

cmake_minimum_required(VERSION 3.16)
project(scale-conf VERSION 1.0 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)

if(NOT DEFINED INSTALL_EXAMPLESDIR)
    set(INSTALL_EXAMPLESDIR "examples")
endif()

set(INSTALL_EXAMPLEDIR "${INSTALL_EXAMPLESDIR}")

find_package(Qt6 6.7 REQUIRED COMPONENTS Core Gui Quick WebView Svg QuickControls2 Multimedia Sql)


qt_standard_project_setup(REQUIRES 6.6)

# find_package(Qt${QT_VERSION_MAJOR} OPTIONAL_COMPONENTS AndroidExtras)

qt_add_executable(scale-conf WIN32 MACOSX_BUNDLE
    cpp/main.cpp
)
qt_add_qml_module(scale-conf
    URI Scaleconf
    VERSION ${PROJECT_VERSION}
    QML_FILES
        qml/Main.qml
        qml/components/modals/ErrorModal.qml
        qml/components/modals/EventAlreadySavedModal.qml
        qml/components/modals/ProgressModal.qml
        qml/components/modals/ScheduleAddedModal.qml
        qml/components/modals/ScheduleDeleteModal.qml
        qml/components/navigation/NavButton.qml
        qml/components/navigation/NavMenu.qml
        qml/components/navigation/TopBar.qml
        qml/pages/components/PresentationDetail/PresentationDetail.qml
        qml/pages/components/ScheduleFilter/ScheduleFilter.qml
        qml/pages/Contacts/Contacts.qml
        qml/pages/Contacts/FilePicker.qml
        qml/pages/Exhibitors/Exhibitors.qml
        qml/pages/Home/AnnouncementsModel.qml
        qml/pages/Home/Home.qml
        qml/pages/Messages/Messages.qml
        qml/pages/MySchedule/MySchedule.qml
        qml/pages/QrScan/QrScan.qml
        qml/pages/Schedule/Schedule.qml
        qml/pages/Speakers/Speakers.qml
        qml/pages/SpecialEvents/SpecialEvents.qml
        qml/components/modals/CSVcopiedModal.qml
        qml/pages/components/JSONListModel/JSONListModel.qml
        qml/pages/Speakers/SpeakersModel.qml
        qml/pages/Speakers/IndividualSpeaker.qml
        qml/pages/Schedule/SignModel.qml
        qml/pages/CampusMap/CampusMap.qml
        qml/pages/QrScan/QrScanLoader.qml
        qml/pages/Contacts/+android/Contacts.qml
        js/database.js
        js/initialize.js
        js/feed.js
        js/nav.js
        js/utils.js
    RESOURCES
         img/navicon.svg
         img/arrow-left.svg
         img/HomePageBanner.svg
         img/SCaLE_icons-01_logo.svg
         img/SCaLE_icons-02_home.svg
         img/SCaLE_icons-03_menu-hamburger.svg
         img/SCaLE_placeholders_speakers_penguin-02.svg
         img/SCaLE_placeholders_speakers_penguin.svg
         img/SCaLE_placeholders_speakers_robot-01.svg
         img/SCaLE_placeholders_speakers_robot-02.svg
         img/SCaLE_placeholders_speakers_robot-03.svg
         img/SCaLE_placeholders_speakers_robot-04.svg
         fonts/AnonymousPro-Regular.ttf
         fonts/AnonymousPro-Bold.ttf
         fonts/SourceCodePro-Black.ttf

    SOURCES
        shareutils.h
        shareutils.cpp
        android/androidshareutils.h
        android/androidshareutils.cpp
        contactexporter.h
        contactexporter.cpp
)

target_link_libraries(scale-conf PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
    Qt::Svg
    Qt::WebView
    PRIVATE
    Qt::Multimedia
    Qt::Sql
)


# Resources:
set(js_resource_files
    "js/database.js"
    "js/initialize.js"
    "js/feed.js"
    "js/nav.js"
    "js/utils.js"
)

qt6_add_resources(scale-conf "js"
    PREFIX
        "/js"
    BASE
        "js"
    FILES
        ${js_resource_files}
)
set(img_resource_files
    "img/HomePageBanner.svg"
    "img/SCaLE_icons-01_logo.svg"
    "img/SCaLE_icons-02_home.svg"
    "img/SCaLE_icons-03_menu-hamburger.svg"
    "img/SCaLE_placeholders_speakers_penguin-02.svg"
    "img/SCaLE_placeholders_speakers_penguin.svg"
    "img/SCaLE_placeholders_speakers_robot-01.svg"
    "img/SCaLE_placeholders_speakers_robot-02.svg"
    "img/SCaLE_placeholders_speakers_robot-03.svg"
    "img/SCaLE_placeholders_speakers_robot-04.svg"
    "img/arrow-left.svg"
)

qt6_add_resources(scale-conf "img"
    PREFIX
        "/img"
    BASE
        "img"
    FILES
        ${img_resource_files}
)
set(fonts_resource_files
    "fonts/AnonymousPro-Bold.ttf"
    "fonts/AnonymousPro-Regular.ttf"
    "fonts/SourceCodePro-Black.ttf"
)

qt6_add_resources(scale-conf "fonts"
    PREFIX
        "/fonts"
    BASE
        "fonts"
    FILES
        ${fonts_resource_files}
)

if(ANDROID)
    set_property(TARGET scale-conf APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
    ${CMAKE_CURRENT_SOURCE_DIR}/android)
    include(android_openssl/android_openssl.cmake)
    add_android_openssl_libraries(scale-conf)

endif()


set(Qt5Core_DIR "$ENV{HOME}/Qt")
message(STATUS "Qt5Core_DIR->${Qt5Core_DIR}")

if(IOS)
    include(${PROJECT_SOURCE_DIR}/FetchQtIosCMake.cmake)

    add_qt_ios_app(scale-conf
        NAME "SCALECONF"
        BUNDLE_IDENTIFIER "com.knowikiapps.scaleconf"
    )
endif()


install(TARGETS scale-conf
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
