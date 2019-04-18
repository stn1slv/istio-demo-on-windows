istioctl replace -f istiofiles/virtual-service-recommendation-v1_and_v2_retry.yml -n demo
powershell -ExecutionPolicy ByPass -File powershell\misbehave.ps1