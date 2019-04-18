$podName = kubectl get pods -l app=recommendation,version=v2 -n demo  --no-headers -o custom-columns=":metadata.name" | select -First 1
$response=Invoke-WebRequest -Uri http://localhost:8001/api/v1/namespaces/demo/pods/$podName/proxy/behave
Write-Host $response.Content -ForegroundColor Red