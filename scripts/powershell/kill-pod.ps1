$podName = kubectl get pods -l app=recommendation,version=v2 -n demo  --no-headers -o custom-columns=":metadata.name" | select -First 1
kubectl delete pods $podName -n demo