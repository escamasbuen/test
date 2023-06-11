Function Set-WallPaper {

param (
    [parameter(Mandatory=$True)]
    [string]$Image
)

    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name 10 -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force
 
}

Set-WallPaper -Image "C:\Users\$env:username\Downloads\images\aw.png" -Style Center
