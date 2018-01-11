#!/usr/bin/env python
# -*- coding: utf-8 -*-

import cairosvg

# import source svg at 20x20px original size
appIcon = cairosvg.svg2svg(bytestring=open("AppIcon.svg").read().encode('utf-8'))

# convert for 20x20
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon20x20~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon20x20@2x~ipad.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon20x20@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon20x20@3x.png", scale=3)

# convert for 29x29
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.45)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon29x29@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon29x29@3x.png", scale=3)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon29x29~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon29x29@2x~ipad.png", scale=2)

# convert for 40x40
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.38)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon40x40@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon40x40@3x.png", scale=3)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon40x40~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon40x40@2x~ipad.png", scale=2)

# convert for 60x60
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.5)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon60x60@2x.png", scale=2)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon60x60@3x.png", scale=3)


# convert for 76x76
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.27)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon76x76~ipad.png")
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon76x76@2x~ipad.png", scale=2)

# convert for 83.5x83.5
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.09868)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon83.5x83.5@2x~ipad.png", scale=2)

# convert for 1024x1024
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=12.23)
cairosvg.svg2png(bytestring=appIcon, write_to="AppIcon1024x1024~ipad.png")


# ------------ LAUNCH IMAGES ------------
# render for 320x480
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage320x480.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage320x480.png")
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage320x480@2x.png", scale=2)

# render for 640x1136
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage640x1136.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage640x1136.png")

# render for 750x1334
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage750x1334.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage750x1334.png")

# render for 768x1004
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage768x1004.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage768x1004@2x~ipad.png", scale=2)
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage768x1004~ipad.png")

# render for 768x1024
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage768x1024.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage768x1024@2x~ipad.png", scale=2)
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage768x1024~ipad.png")

# render for 1024x748
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage1024x748.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage1024x748@2x~ipad.png", scale=2)
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage1024x748~ipad.png")

# render for 1024x768
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage1024x768.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage1024x768@2x~ipad.png", scale=2)
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage1024x768~ipad.png")

# render for 1242x2208
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage1242x2208.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage1242x2208.png")

# render for 2208x1242
launchImage = cairosvg.svg2svg(bytestring=open("LaunchImage2208x1242.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=launchImage, write_to="LaunchImage2208x1242.png")

