# 脚本及使用方法
## All
```
bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/All.sh)
```
## DD系统ubuntu20.04
```
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -u 20.04 -v 64 -a -firmware -p **
```
上面的**请请替换成自己的密码
## docker换源安装
```
bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/DockerInstallation.sh)
```
## cf穿刺
```
bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/Tunnel.sh)
```
## 安装/更新 最新长期支持版nodejs
```
bash <(curl -L https://raw.githubusercontent.com/YYWO/practical/main/shell/nodejs.sh)
```
## 安装/更新 最新当前发布版nodejs
```
bash <(curl -L https://raw.githubusercontent.com/YYWO/practical/main/shell/nodejs.sh) -l
```
## 安装/更新 指定版本nodejs
```
bash <(curl -L https://raw.githubusercontent.com/YYWO/practical/main/shell/nodejs.sh) -v 14.12.0
``` 
## 强制更新nodejs
默认更新策略是已有版本和最新版本一样就不去更新, 要强制更新添加-f
```
bash <(curl -L https://raw.githubusercontent.com/YYWO/practical/main/shell/nodejs.sh) -f
```
