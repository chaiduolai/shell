!/bin/sh
#duoduo
#cduolai@163.com
### 更新 ###
yum -y update
#移除旧版本docker
yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine
clear
echo "+------------------------------------------------------------------------+"
echo "       EffiAR Server Installer Linux Docker Server         "
echo "+------------------------------------------------------------------------+"
echo "|         A tool to auto-compile & install EffiAR inspection on Linux          |"
echo "+------------------------------------------------------------------------+"
echo "|                         Auth: duoduo                                |"
echo "+------------------------------------------------------------------------+"
#安装一些必要的系统工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

#添加软件源信息
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

#更新 yum 缓存
sudo yum makecache fast

#安装 Docker-ce
sudo yum -y install docker-ce
#docker加入开机自启动
systemctl enable docker

#启动 Docker 后台服务
systemctl start docker
# 替换docker为国内源 配置加速器
echo '{"registry-mirrors": ["https://registry.docker-cn.com"] }' > /etc/docker/daemon.json

sudo systemctl daemon-reload
sudo systemctl restart docker

#下载docket-compose
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
#修改权限
chmod +x /usr/local/bin/docker-compose
# 安装命令补全工具
sudo yum -y install bash-completion
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
docker-compose --version
echo "docker install succeed!! **Thanks** !!!! "
### 安装docker结束 ###