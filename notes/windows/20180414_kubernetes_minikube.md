### 2018-04-14: Kubernetes Minikube

[Minikube](https://github.com/kubernetes/minikube) is a local kubernetes environment. The following snippet shows the installation via Chocolatey and requires Virtualbox or Hyper-V installed on your computer.

```bash
#: Start Powershell as administrator

#: Install Minikube and kubernetes-cli
choco install minikube --version 0.25.2

#: Start Minikube (starts a VM in Virtualbox with pre-installed Kubernetes)
minikube start

#: Start and open Kubernetes Dashboard in webbrowser
minikube dashboard # wait a few minutes if it doesn't work at the first try

#: Stop Minikube (stops the VM in Virtualbox)
minikube stop
```
