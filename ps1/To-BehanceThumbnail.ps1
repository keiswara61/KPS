param ([string]$InputName, [string]$RGBPalletes)

[string]$LeafBase = $InputName.Split("\.")[0]
[string]$Extension = $InputName.Split("\.")[1]
[int]$Width = 808
[int]$Height = 632
[int]$PalletesCount = $RGBPalletes.Split(",").Count
[int]$DrawWidth = $Width - $Height

$RGBPalletes.Split(",").Trim() | ForEach-Object -Begin {[string]$Draw = $Null; [int]$Index = 0} -Process {$Draw += "fill rgb($($_.Replace(" ", ", "))) point 0,$($Index) "; $Index++}

magick $InputName -resize "x$($Height)" "$($LeafBase)-Resize.$($Extension)"
magick -size "1x$($PalletesCount)" xc:snow -draw $Draw -scale "$($DrawWidth)x$($Height)!" "$($LeafBase)-Draw.$($Extension)"
magick "$($LeafBase)-Resize.$($Extension)" "$($LeafBase)-Draw.$($Extension)" +append "$($LeafBase)-Thumbnail.$($Extension)"
