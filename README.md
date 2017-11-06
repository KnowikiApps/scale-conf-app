# SCaLE Mobile App
Mobile App for Southern California Linux Expo.

# Getting Started
Qt is a cross-platform software development kit written in C++. This project uses Qt Quick which allows us to write an application that can run on any desktop and mobile platform. You'll need to have Qt installed as well as the mobile SDKs in order to compile for mobile. Windows and Linux users can compile for Android and desktop only because iOS SDK is not available for those platforms. OSX users can compile for all platforms.

## Installing Qt
You willl need to install Qt SDK and Qt Creator. This project uses Qt SDK version 5.8

### For Windows
http://doc.qt.io/qt-5/windows-support.html

### For OSX
http://doc.qt.io/qt-5/osx.html

### For Linux
http://doc.qt.io/qt-5/linux.html

### For Android
In order to compile for Android you will need to set up the Android development tools.
http://doc.qt.io/qt-5/androidgs.html

### For iOS (OSX Users Only)
http://doc.qt.io/qt-5/ios-support.html

## Building and running
Everything you need is in the Qt Creator IDE. It has a built in compiler and debugger, and a ton of other tools.

http://doc.qt.io/qtcreator/

Project settings are defined in a `.pro` file in the project root. Open the file with Qt Creator to import the project.

### Configuring the project
Depending on what OS you're using, and if you have all of the dependencies, you will be prompted to choose a list of kits for compile and run.

Qt Versioning is pretty specific, so it's important to use the correct Qt version. We're using version 5.8 for this project.

#### Android
If you have installed the Android SDK and tools necessary, you should have an option that looks something like this:
`Android for armeabi_v7a (GCC 4.9, Qt 5.8.0)`

#### Desktop
For most development work, you can get away with not using a mobile virtual device or simulator. The app should run basically the same as a desktop app. You should at least have this option, if you dont have any others. 
`Desktop Qt 5.8.0 <compiler>`

#### iOS
If you're using Mac OS, then you should be able to run the app on the iOS simulator or an actual iOS device.

`iphonesimulator-clang Qt 5.8.0 for iOS3`
`iphoneos-clang Qt 5.8.0 for iOS3`


# Qt Documentation

Qt Quick has changed a lot over the years. With so many versions floating out there, you'll need to be sure that you're looking at the proper documentation. If you're doing Google searches be sure to check the version of Qt Quick Controls. An example of a search that will give you want you want:
`QtQuick.Controls 2 ApplicationWindow`
Prefacing your search with "QtQuick.Controls 2" will help make sure you're getting the right version of the docs. Previous versions of QtQuick Controls are very different. The example above illustrates this, previous versions of ApplicationWindow have properties that v2 doesnt have.

# Javascript

QML uses javascript to manipulate the graphical objects. This implementation of ECMAScript is not exactly the same as javascript for browsers, but it's close. Here's more info:

http://doc.qt.io/qt-5/qtqml-javascript-expressions.html

http://doc.qt.io/qt-5/qtqml-javascript-resources.html

http://doc.qt.io/qt-5/qtqml-javascript-imports.html

http://doc.qt.io/qt-5/qtqml-javascript-qmlglobalobject.html

https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest

# QZXing

This library is included to provide QR Code scanning capability.

https://github.com/ftylitak/qzxing

# SVG Icons	

Icons for this project are from this open source project:

https://github.com/encharm/Font-Awesome-SVG-PNG

# Intended Features

The following is an incomplete list of features that need to be worked on.

## In progress

* [x] Read QR code from attendee badge and store
* [x] Display the schedule
* [x] Schedule builder to allow user to save items from schedule

## To Do

* [ ] Push capabilities
	* [ ] alert users of schedule updates
	* [ ] send direct message from organizers
* [ ] Compile for Android
* [ ] Compile for iOS
* [ ] Exhibitor mode
	* [ ] contacts exportable to csv
* [ ] Map of venue and exhibit hall.

## Ready to deploy

* [x] Locally store schedule data on device for offline access