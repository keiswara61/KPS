param ([string]$Scale, [int]$HeightZoomPercentage, [string]$OutputName)

[int]$ScaleWidth = ($Scale -split "x")[0]
[int]$ScaleHeight = ($Scale -split "x")[1]
[int]$ZoomScale = $ScaleHeight * $HeightZoomPercentage / 100
[string]$LeafBase = ($OutputName -split "\.")[0]
[string]$Extension = ($OutputName -split "\.")[1]

magick -size 5x5 xc:snow -fill skyblue4 -draw "point 1,1 point 3,1 point 1,2 point 2,2 point 1,3 point 3,3" -scale "x$($ZoomScale)" "$($LeafBase)-Draw.$($Extension)"
magick "$($LeafBase)-Draw.$($Extension)" -background snow -gravity center -extent $Scale $OutputName
