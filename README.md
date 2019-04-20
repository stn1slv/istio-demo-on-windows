# How to install Istio
See details in the [INSTALL.md](INSTALL.md)
# How to run demo cases
1. Open separate console and run there:
```bash
kubectl proxy
```
2. Open separate console and run script which will call service chain:
```bash
cd bin
call-customer-service.cmd
```
3. Open separate console and use demo scripts in the [script directory](https://github.com/stn1slv/istio-demo-on-windows/tree/master/scripts):
```bash
cd scripts
```
