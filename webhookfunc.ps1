function webhookmessage
{
$hookUrl = "https://discord.com/api/webhooks/1117132337411543171/NZpLuZD33Xk3PbDf8DGdAzvZ53agPzB5pTJMLXm0WzG1Shmif-0ZMDu6GfCCQBRIFggR"
$content = @"
ahhh @everyone
"@

$payload = [PSCustomObject]@{

    content = $content

}

Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json)
}
