istioctl delete virtualservice recommendation -n demo
istioctl delete destinationrule recommendation -n demo
istioctl create -f ../istiofiles/destination-rule-recommendation-v1-v2.yml -n demo
istioctl create -f ../istiofiles/virtual-service-recommendation-v1-mirror-v2.yml -n demo