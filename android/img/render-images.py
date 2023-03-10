#!/usr/bin/env python
# -*- coding: utf-8 -*-

import cairosvg
import os, errno, pathlib



# We are in the android/img folder. Get the path to android/res
RES_PATH = os.path.join(pathlib.Path(__file__).parent.parent, 'res')


# import source svg at 20x20px original size
appIcon = cairosvg.svg2svg(bytestring=open("AppIcon.svg").read().encode('utf-8'))

# render for 32x32
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=32.0/20.0)
icon_dir = os.path.join(RES_PATH, "drawable-ldpi")
os.makedirs(icon_dir, exist_ok=True)
cairosvg.svg2png(bytestring=appIcon, write_to=os.path.join(icon_dir,"icon.png"))

# render for 48x48
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=48.0/20.0)
icon_dir = os.path.join(RES_PATH, "drawable-mdpi")
os.makedirs(icon_dir, exist_ok=True)
cairosvg.svg2png(bytestring=appIcon, write_to=os.path.join(icon_dir,"icon.png"))


# render for 72x72
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.5)
icon_dir = os.path.join(RES_PATH, "drawable-hdpi")
os.makedirs(icon_dir, exist_ok=True)
cairosvg.svg2png(bytestring=appIcon, write_to=os.path.join(icon_dir,"icon.png"))

# render for 96x96
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.34)
icon_dir = os.path.join(RES_PATH, "drawable-xhdpi")
os.makedirs(icon_dir, exist_ok=True)
cairosvg.svg2png(bytestring=appIcon, write_to=os.path.join(icon_dir,"icon.png"))

# render for 144x144
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.5)
icon_dir = os.path.join(RES_PATH, "drawable-xxhdpi")
os.makedirs(icon_dir, exist_ok=True)
cairosvg.svg2png(bytestring=appIcon, write_to=os.path.join(icon_dir,"icon.png"))

# render for 192x192
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=1.33)
icon_dir = os.path.join(RES_PATH, "drawable-xxxhdpi")
os.makedirs(icon_dir, exist_ok=True)
cairosvg.svg2png(bytestring=appIcon, write_to=os.path.join(icon_dir,"icon.png"))

# render for 512x512
appIcon = cairosvg.svg2svg(bytestring=appIcon, scale=2.665)
icon_dir = "google-play-store/"
os.makedirs(icon_dir, exist_ok=True)
cairosvg.svg2png(bytestring=appIcon, write_to=icon_dir+"icon.png")

# Feature Graphic
featureGraphic = cairosvg.svg2svg(bytestring=open("FeatureGraphic.svg").read().encode('utf-8'))
cairosvg.svg2png(bytestring=featureGraphic, write_to="feature_graphic.png")
