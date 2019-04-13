docker build -t example/recommendation:v2 ../src/recommendation/java/vertx-v2-timeout

istioctl create -f ../istiofiles/virtual-service-recommendation-timeout.yml -n demo