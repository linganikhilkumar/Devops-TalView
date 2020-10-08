# Minikube local development
################################################################################
minikube-up: minikube-install minikube-start minikube-install
minikube-down: minikube-uninstall minikube-delete

minikube-install: 
	@choco install minikube

minikube-start:
	minikube start -p  k8-local
	minikube addons enable ingress -p  k8-local

minikube-delete:
	@minikube delete -p  k8-local

minikube-ip:
	@minikube ip -p  k8-local

minikube-stop:
	@minikube stop -p  k8-local

install-helm: 
	@choco install kubernetes-helm

setup-application: minikube-up install-helm uninstall-application
	@helm install mailtrain-application mailtrain-application --values mailtrain-application/values.yaml

uninstall-application:
	@helm delete mailtrain-application

