[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$True)]
    [string]$hookurl,
    [parameter(Position=1,Mandatory=$True)]
    [string]$text,
    [parameter(Position=2,Mandatory=$False)]
    [string]$username 
)

#Create embed array
[System.Collections.ArrayList]$embedArray = @()

#Store embed values
$title       = 'gute nacht'
$description = $text
$color       = '1'

#Create thumbnail object
$thumbUrl = 'https://minotar.net/helm/'+$username+'/600.png' 
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
