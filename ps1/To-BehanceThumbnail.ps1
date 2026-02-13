param ([string]$InputName)

[string]$LeafBase = $InputName.Split("\.")[0]
[string]$Extension = $InputName.Split("\.")[1]
[int]$Width = 808
[int]$Height = 632

magick $InputName -resize "x$($Height)" "$($LeafBase)-Resize.$($Extension)"
magick "$($LeafBase)-Resize.$($Extension)" -background snow -gravity center -extent "$($Width)x" "$($LeafBase)-BehanceThumbnail.$($Extension)"
