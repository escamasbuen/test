$webHookUrl = "https://discord.com/api/webhooks/1117132337411543171/NZpLuZD33Xk3PbDf8DGdAzvZ53agPzB5pTJMLXm0WzG1Shmif-0ZMDu6GfCCQBRIFggR"

#Create embed array
[System.Collections.ArrayList]$embedArray = @()

#Store embed values
$title       = 'gute nacht'
$description = 'working'
$color       = '1'

#Create thumbnail object
$thumbUrl = 'https://cdn.discordapp.com/attachments/1116259304274661398/1116260268549349416/Screenshot_20230602_093638_Instagram.jpg' 
$thumbnailObject = [PSCustomObject]@{

    url = $thumbUrl

}

#Create embed object, also adding thumbnail
$embedObject = [PSCustomObject]@{

    title       = $title
    description = $description
    color       = $color
    thumbnail   = $thumbnailObject

}

#Add embed object to array
$embedArray.Add($embedObject) | Out-Null

#Create the payload
$payload = [PSCustomObject]@{

    embeds = $embedArray

}

#Send over payload, converting it to JSON
Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
