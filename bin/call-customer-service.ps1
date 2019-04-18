$Url = "http://127.0.0.1:8001/api/v1/namespaces/demo/services/customer:8080/proxy/"
$colorsForPods = @{}
$availableColors = @('Red','DarkMagenta','DarkRed','Magenta','Yellow','DarkYellow','DarkCyan','Cyan','Gray','White','DarkGray')
$currentColor = 0
while ($true) {
    $responseTime = Measure-Command -Expression {
       try {
            $response = Invoke-WebRequest -Uri $Url
            $responseText = $response.Content
       } catch {
            $responseText = $_
       } 
    }
    $milliseconds = [Math]::Round($responseTime.TotalMilliseconds, 0)
    if ($responseText -Match 'v1') { 
        Write-Host [$milliseconds 'ms'] "`t" $responseText -ForegroundColor Green -NoNewline 
    }  ElseIf ($responseText -Match 'v2') { 
         $podID=$responseText.split("'")[1]
         if ($colorsForPods.ContainsKey($podID)){
            $color=$colorsForPods[$podID]
         } Else {
            $color=$availableColors[$currentColor]
            $currentColor+=1
            $colorsForPods.Add($podID,$color)
         }
         Write-Host [$milliseconds 'ms'] "`t" $responseText -ForegroundColor $color -BackgroundColor Gray -NoNewline 
    } else {
         Write-Host [$milliseconds 'ms'] "`t" $responseText -ForegroundColor White
    } 
    Start-Sleep -Seconds 1
}