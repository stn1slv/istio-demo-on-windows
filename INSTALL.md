# Installation guide
## Prerequisite
1. Istio 1.0.6
2. Docker for Windows
3. Maven
## Install Istio
1. Set environment variable ISTIO_HOME. For example:
```bash
set ISTIO_HOME=C:\Apps\OSS\k8s\istio-1.0.6
```
2. Go to the bin directory
```bash
cd bin
```
3. Run install script
```bash
install-istio.cmd
```
## Install demo business apps
```bash
install-base-services.cmd
```
