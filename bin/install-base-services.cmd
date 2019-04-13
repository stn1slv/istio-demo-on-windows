mvn clean package -DskipTests -f ../src/customer/java/springboot/pom.xml
mvn clean package -DskipTests -f ../src/preference/java/springboot/pom.xml
mvn clean package -DskipTests -f ../src/recommendation/java/vertx-v1/pom.xml
mvn clean package -DskipTests -f ../src/recommendation/java/vertx-v2/pom.xml
mvn clean package -DskipTests -f ../src/recommendation/java/vertx-v2-timeout/pom.xml

docker build -t example/customer ../src/customer/java/springboot
docker build -t example/preference:v1 ../src/preference/java/springboot
docker build -t example/recommendation:v1 ../src/recommendation/java/vertx-v1
docker build -t example/recommendation:v2 ../src/recommendation/java/vertx-v2

istioctl kube-inject  -f ../src/customer/kubernetes/Deployment.yml > ../tmp/customer-deployment-injected.yml
istioctl kube-inject  -f ../src/preference/kubernetes/Deployment.yml > ../tmp/preference-deployment-injected.yml
istioctl kube-inject  -f ../src/recommendation/kubernetes/Deployment.yml > ../tmp/recommendation-deployment-v1-injected.yml
istioctl kube-inject  -f ../src/recommendation/kubernetes/Deployment-v2.yml > ../tmp/recommendation-deployment-v2-injected.yml

kubectl create namespace demo

kubectl apply -f ../tmp/customer-deployment-injected.yml -n demo
kubectl apply -f ../tmp/preference-deployment-injected.yml -n demo
kubectl apply -f ../tmp/recommendation-deployment-v1-injected.yml -n demo
kubectl apply -f ../tmp/recommendation-deployment-v2-injected.yml -n demo

kubectl create -f ../src/customer/kubernetes/Service.yml -n demo
kubectl create -f ../src/preference/kubernetes/Service.yml -n demo
kubectl create -f ../src/recommendation/kubernetes/Service.yml -n demo