istioctl delete virtualservice recommendation -n demo
istioctl delete destinationrule recommendation -n demo
powershell -ExecutionPolicy ByPass -File powershell\behave.ps1