$webhook = "C:\Users\$env:username\AppData\Roaming\.minecraft\webhook.txt"
$webHookUrl = Get-Content -Path $webhook -Raw

$basicinfo = "C:\Users\$env:username\AppData\Roaming\.minecraft\info.txt"
$basicinfoString = Get-Content -Path $basicinfo -Raw

Write-Output $webHookUrl
Write-Output $basicinfoString
