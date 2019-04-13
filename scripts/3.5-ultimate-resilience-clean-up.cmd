istioctl delete virtualservice recommendation -n demo
istioctl delete destinationrule recommendation -n demo
kubectl scale deployment recommendation-v2 --replicas=1 -n demo