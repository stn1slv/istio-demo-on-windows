istioctl delete virtualservice recommendation -n demo
istioctl delete destinationrule recommendation -n demo
istioctl create -f ../istiofiles/destination-rule-recommendation-v1-v2.yml -n demo
istioctl create -f ../istiofiles/virtual-service-recommendation-v1_and_v2_50_50.yml -n demo

kubectl scale deployment recommendation-v2 --replicas=2 -n demo

# Add misbehave

istioctl replace -f  ../istiofiles/destination-rule-recommendation_cb_policy_pool_ejection.yml -n demo