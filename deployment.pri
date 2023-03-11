ios {
    #custom plist file for bundle
    QMAKE_INFO_PLIST = ios/Info.plist

    #copy custom plist file into build directory
    copydata.commands = $(COPY_DIR) $$PWD/ios/Info.plist $$OUT_PWD
    first.depends = $(first) copydata
    export(first.depends)
    export(copydata.commands)
    QMAKE_EXTRA_TARGETS += first copydata

    #add image assets to bundle
    QMAKE_ASSET_CATALOGS = $$PWD/ios/Images.xcassets
    QMAKE_ASSET_CATALOGS_APP_ICON = "AppIcon"
    QMAKE_ASSET_CATALOGS_LAUNCH_IMAGE = "LaunchImage"
    QMAKE_ASSET_CATALOGS_LAUNCH_SCREEN = ""
    QMAKE_TARGET_BUNDLE_PREFIX = "com.knowikiapps.SCaLE"
}
