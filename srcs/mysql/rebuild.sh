eval $(minikube docker-env)
kubectl delete deploy mysql-deployment
kubectl delete svc mysql-svc
docker rmi -f mysql_image
docker build -t mysql_image ./mysql/
kubectl apply -f ./mysql/mysql.yaml