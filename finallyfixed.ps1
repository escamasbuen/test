Add-Type @"
using System;
using System.Runtime.InteropServices;
public class PInvoke {
    [DllImport("user32.dll")] public static extern IntPtr GetDC(IntPtr hwnd);
    [DllImport("gdi32.dll")] public static extern int GetDeviceCaps(IntPtr hdc, int nIndex);
}
"@
$hdc = [PInvoke]::GetDC([IntPtr]::Zero)
$w = [PInvoke]::GetDeviceCaps($hdc, 118) 
$h = [PInvoke]::GetDeviceCaps($hdc, 117)


Add-Type -AssemblyName System.Drawing

$filename = "$env:tmp\foo.jpg" 
$bmp = new-object System.Drawing.Bitmap $w,$h 
$font = new-object System.Drawing.Font Consolas,18 
$brushBg = [System.Drawing.Brushes]::White 
$brushFg = [System.Drawing.Brushes]::Black 
$graphics = [System.Drawing.Graphics]::FromImage($bmp) 
$graphics.FillRectangle($brushBg,0,0,$bmp.Width,$bmp.Height) 
$graphics.DrawString($content,$font,$brushFg,500,100) 
$graphics.Dispose() 
$bmp.Save($filename) 




cmd.exe /c copy /b "$Env:temp\foo.jpg" + "$Env:temp\foo.txt" "$Env:USERPROFILE\Desktop\coolimage.jpg"

rm $env:TEMP\foo.txt,$env:TEMP\foo.jpg -r -Force -ErrorAction SilentlyContinue



Function Set-WallPaper {

 
param (
    [parameter(Mandatory=$True)]
    [string]$Image,
    [parameter(Mandatory=$False)]
    [ValidateSet('Fill', 'Fit', 'Stretch', 'Tile', 'Center', 'Span')]
    [string]$Style
)
 
$WallpaperStyle = Switch ($Style) {
  
    "Fill" {"10"}
    "Fit" {"6"}
    "Stretch" {"2"}
    "Tile" {"0"}
    "Center" {"0"}
    "Span" {"22"}
  
}
 
If($Style -eq "Tile") {
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 1 -Force
 
}
Else {
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force
 
}
 
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
  
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
  
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02
  
    $fWinIni = $UpdateIniFile -bor $SendChangeEvent
  
    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}

#----------------------------------------------------------------------------------------------------
 
Set-WallPaper -Image "C:\Users\$env:username\Downloads\newimagewhodis.png"
