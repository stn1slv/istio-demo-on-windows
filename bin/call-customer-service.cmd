@echo off
:begin
	
curl http://127.0.0.1:8001/api/v1/namespaces/demo/services/customer:8080/proxy/
powershell Start-Sleep -m 500
	
goto begin