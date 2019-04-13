istioctl delete -f ../istiofiles/destination-rule-recommendation-v1-v2.yml -n demo
istioctl create -f ../istiofiles/destination-rule-recommendation_lb_policy_app.yml -n demo