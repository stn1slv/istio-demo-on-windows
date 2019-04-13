kubectl scale deployment recommendation-v2 --replicas=1 -n demo
istioctl delete -f ../istiofiles/destination-rule-recommendation_lb_policy_app.yml -n demo