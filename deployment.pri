ios {
    #custom plist file for bundle
    QMAKE_INFO_PLIST = ios/Info.plist

#    #icon files
#    ios_icon.files = $$files($$PWD/ios/AppIcon*.png)
#    QMAKE_BUNDLE_DATA += ios_icon

#    #app launch images
#    app_launch_images.files = $$files($$PWD/ios/LaunchImage*.png)
#    QMAKE_BUNDLE_DATA += app_launch_images

    #copy custom plist file into build directory
    copydata.commands = $(COPY_DIR) $$PWD/ios/Info.plist $$OUT_PWD
    first.depends = $(first) copydata
    export(first.depends)
    export(copydata.commands)
    QMAKE_EXTRA_TARGETS += first copydata
}
