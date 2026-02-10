param ([string]$Scale, [string]$Name)

[int]$Width = ($Scale -split "x")[0]
[int]$Height = ($Scale -split "x")[1]
[int]$ProfileWidth = $Height
[int]$ProfileCropWidth = $ProfileWidth - ($ProfileWidth * 48 / 100)
[int]$ProfileCropLeft = $ProfileWidth * 24 / 100
[int]$TextWidth = $Width - $ProfileWidth
[string]$LeafBase = ($Name -split "\.")[0]
[string]$Extension = ($Name -split "\.")[1]

magick -size 7x7 xc:snow -fill SkyBlue4 -draw 'point 2,2 point 4,2 point 2,3 point 3,3 point 2,4 point 4,4' -scale "$($ProfileWidth)x$($Height)" "$($LeafBase)-Profile.$($Extension)"
magick "$($LeafBase)-Profile.$($Extension)" -crop "$($ProfileCropWidth)x$($Height)+$($ProfileCropLeft)+0" "$($LeafBase)-Profile-Crop.$($Extension)"
magick -background snow -fill SkyBlue4 -size "$($TextWidth)x$($Height)" -gravity center label:Keiswara "$($LeafBase)-Text.$($Extension)"
magick "$($LeafBase)-Profile-Crop.$($Extension)" "$($LeafBase)-Text.$($Extension)" +append "$($LeafBase)-Append.$($Extension)"
magick "$($LeafBase)-Append.$($Extension)" -background snow -gravity center -extent "$($Width)x$($Height)" $Name
