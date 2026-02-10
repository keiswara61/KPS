param ($Scale, $Name)
magick -size 7x7 xc:snow -fill SkyBlue4 -draw 'point 2,2 point 4,2 point 2,3 point 3,3 point 2,4 point 4,4' -scale $Scale $Name
