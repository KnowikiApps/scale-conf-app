#!/usr/bin/env python
# -*- coding: utf-8 -*-

import cairosvg

# import source svg at 20x20px original size
appIcon = cairosvg.svg2svg(bytestring=open("AppIcon.svg").read().encode('utf-8'))
icon_dir = "Images.xcassets/AppIcon.appiconset/"

# convert for 20x20
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon20x20~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon20x20@2x~ipad.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon20x20@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon20x20@3x.png", scale=3)

# convert for 29x29
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.45)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon29x29@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon29x29@3x.png", scale=3)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon29x29~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon29x29@2x~ipad.png", scale=2)

# convert for 40x40
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.38)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon40x40@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon40x40@3x.png", scale=3)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon40x40~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon40x40@2x~ipad.png", scale=2)

# convert for 60x60
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.5)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon60x60@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon60x60@3x.png", scale=3)


# convert for 76x76
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.27)
# cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon76x76~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon76x76@2x~ipad.png", scale=2)

# convert for 83.5x83.5
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.09868)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon83.5x83.5@2x~ipad.png", scale=2)

# convert for 1024x1024
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=12.23)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"AppIcon1024x1024~ipad.png")


# ------------ LAUNCH IMAGES ------------
names = [
    "LaunchImage_iPad_iOS7@2x~landscape",
    "LaunchImage_iPad_iOS7@2x~portrait",
    "LaunchImage_iPad_iOS7~landscape",
    "LaunchImage_iPad_iOS7~portrait",
    "LaunchImage_iPhone_iOS7@2x~portrait",
    "LaunchImage_iPhoneRetina4_iOS7~portrait",
]
launch_image_dir = "Images.xcassets/LaunchImage.launchimage/"

for name in names:
    launchImage = cairosvg.svg2svg(bytestring=open(name+".svg").read().encode('utf-8'))
    cairosvg.svg2png(bytestring=launchImage, write_to=(launch_image_dir+name+".png"))
