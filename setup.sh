echo -e "\033[37;1;41m MINIKUBE START \033[0m"
minikube start --vm-driver=virtualbox --memory 4096
echo -e "\033[37;1;41m MINIKUBE METALLB ENABLED \033[0m"
minikube addons enable metallb
echo -e "\033[37;1;41m MINIKUBE CONFIGMAP APPLIED \033[0m"
kubectl apply -f ./srcs/configmap.yaml
echo -e "\033[37;1;41m MINIKUBE DOCKER ENVIRONMENT ENABLED \033[0m"
eval $(minikube docker-env)
echo -e "\033[37;1;41m NGINX IMAGE BUILD \033[0m"
docker build -t nginx_image ./srcs/nginx
echo -e "\033[37;1;41m WP IMAGE BUILD \033[0m"
docker build -t wp_image ./srcs/wordpress
echo -e "\033[37;1;41m PHP MY ADMIN IMAGE BUILD \033[0m"
docker build -t php_image ./srcs/phpmyadmin/
echo -e "\033[37;1;41m MYSQL IMAGE BUILD \033[0m"
docker build -t mysql_image ./srcs/mysql
echo -e "\033[37;1;41m GRAFANA IMAGE BUILD \033[0m"
docker build -t grafana_image ./srcs/grafana
echo -e "\033[37;1;41m INFLUX IMAGE BUILD \033[0m"
docker build -t influx_image ./srcs/influx
echo -e "\033[37;1;41m FTPS IMAGE BUILD \033[0m"
docker build -t ftps_image ./srcs/ftps/
echo -e "\033[37;1;41m INFLUX SVC DEPLOY PersistantVolume START \033[0m"
kubectl apply -f ./srcs/influx/
echo -e "\033[37;1;41m MYSQL PersistantVolume START \033[0m"
kubectl apply -f ./srcs/mysql/pv.yaml
echo -e "\033[37;1;41m FTPS START \033[0m"
kubectl apply -f ./srcs/ftps/
echo -e "\033[37;1;41m MYSQL START \033[0m"
kubectl apply -f ./srcs/mysql/mysql.yaml
echo -e "\033[37;1;41m NGINX START \033[0m"
kubectl apply -f ./srcs/nginx/nginx.yaml
echo -e "\033[37;1;41m WP START \033[0m"
kubectl apply -f ./srcs/wordpress/wp.yaml
echo -e "\033[37;1;41m PHP MY ADMIN START \033[0m"
kubectl apply -f ./srcs/phpmyadmin/phpadmin.yaml
echo -e "\033[37;1;41m GRAFANA START \033[0m"
kubectl apply -f ./srcs/grafana/grafana.yaml
echo -e "\033[37;1;41m SUCCESS! \033[0m"
kubectl get svc
kubectl get pods
sed -i.bak '5d' /Users/mlorette/.ssh/known_hosts