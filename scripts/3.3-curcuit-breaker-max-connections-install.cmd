istioctl create -f ../istiofiles/destination-rule-recommendation-v1-v2.yml -n demo
istioctl create -f ../istiofiles/virtual-service-recommendation-v1_and_v2_50_50.yml -n demo

istioctl replace -f ../istiofiles/destination-rule-recommendation_cb_policy_version_v2.yml -n demo