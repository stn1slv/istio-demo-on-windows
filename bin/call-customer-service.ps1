$Url = "http://127.0.0.1:8001/api/v1/namespaces/demo/services/customer:8080/proxy/"
$colorsForPods = @{}
$availableColors = @('Red','DarkRed','DarkMagenta','Magenta','Yellow','DarkYellow','DarkCyan','Cyan','Gray','White','DarkGray')
$currentColor = 0
while ($true) {
    $responseTime = Measure-Command -Expression {
        $response = Invoke-WebRequest -Uri $Url
    }
    $milliseconds = [Math]::Round($responseTime.TotalMilliseconds, 0)
    if ($response.Content -Match 'v1') { 
        Write-Host [$milliseconds 'ms'] "`t" $response.Content -ForegroundColor Green -NoNewline 
    }  ElseIf ($response.Content -Match 'v2') { 
         $podID=$response.Content.split("'")[1]
         if ($colorsForPods.ContainsKey($podID)){
            $color=$colorsForPods[$podID]
         } Else {
            $color=$availableColors[$currentColor]
            $currentColor+=1
            $colorsForPods.Add($podID,$color)
         }
         Write-Host [$milliseconds 'ms'] "`t" $response.Content -ForegroundColor $color -BackgroundColor Gray -NoNewline 
    } else {
         Write-Host [$milliseconds 'ms'] "`t" $response.Content -ForegroundColor Black -NoNewline 
    } 
    Start-Sleep -Seconds 1
}