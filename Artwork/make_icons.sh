#!/bin/bash

convert -geometry   20x20 logo_full_res.png logo-20-1x.png
convert -geometry   40x40 logo_full_res.png logo-20-2x.png
convert -geometry   60x60 logo_full_res.png logo-20-3x.png

convert -geometry   29x29 logo_full_res.png logo-29-1x.png
convert -geometry   58x58 logo_full_res.png logo-29-2x.png
convert -geometry   87x87 logo_full_res.png logo-29-3x.png

convert -geometry   40x40 logo_full_res.png logo-40-1x.png
convert -geometry   80x80 logo_full_res.png logo-40-2x.png
convert -geometry 120x120 logo_full_res.png logo-40-3x.png

convert -geometry 120x120 logo_full_res.png logo-60-2x.png
convert -geometry 180x180 logo_full_res.png logo-60-3x.png

convert -geometry   76x76 logo_full_res.png logo-76-1x.png
convert -geometry 152x152 logo_full_res.png logo-76-2x.png

convert -geometry 167x167 logo_full_res.png logo-84-2x.png


