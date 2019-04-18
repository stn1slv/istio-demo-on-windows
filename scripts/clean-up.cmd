istioctl delete virtualservice recommendation -n demo
istioctl delete destinationrule recommendation -n demo
powershell -ExecutionPolicy ByPass -File powershell\behave.ps1
kubectl scale deployment recommendation-v2 --replicas=1 -n demo