# oh-my-env

环境配置脚本

## 翻译

* [English](README.md)
* [简体中文](README.zh_CN.md)

## 快速开始

如果你下载安装包或配置信息的流程中连接有问题则你需要代理服务来解决连接问题，
可能的解决方案如下：
1. 在服务器本机上搭建一个http代理服务，比如 http://127.0.0.1:1884
2. ssh客户端连接到服务器的时候使用远程端口转发设置

样例的远程端口转发配置:
```conf
Host myserver
    HostName 192.168.0.101
    User user
    Port 22
    RemoteForward 1884 localhost:1080
```
转发远程服务器（192.168.0.101）的1884端口到本机（ssh客户机器）的本地1080端口，
所以如果你本地的1080端口的http代理服务可以被服务器的1884端口使用起来了。
检查连接可用的命令行指令：
```sh
curl --connect-timeout 15 --max-time 20 -ivs -x http://127.0.0.1:1884 https://httpbin.org/ip
```

命令行一键安装

```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
```

中国国内区域下载加速：

```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
```

## 自定义

如果安装前需要做一些自定义配置则可以下载样例配置并编辑~/.omerc配置文件

下载样例配置文件：
```sh
curl -fsSL -o ~/.omerc.example https://raw.githubusercontent.com/nickfan/oh-my-env/master/.omerc.example
cp -af ~/.omerc.example ~/.omerc
```
中国国内区域下载加速：
```sh
curl -fsSL -o ~/.omerc.example https://gitee.com/nickfan/oh-my-env/raw/master/.omerc.example
cp -af ~/.omerc.example ~/.omerc
```

## 安装

使用curl指令加sudo模式
```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
```

或使用wget指令加sudo模式
```sh
wget -qO- https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
```

或在root管理员权限下使用curl指令
```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | bash -
```
或在root管理员权限下使用wget指令
```sh
wget -qO- https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | bash -
```

中国国内区域下载加速：

使用curl指令加sudo模式
```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
```
或使用wget指令加sudo模式
```sh
wget -qO- https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
```

或在root管理员权限下使用curl指令
```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | bash -
```
或在root管理员权限下使用wget指令
```sh
wget -qO- https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | bash -
```

下载脚本到本地后在本地运行

```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh
```
中国国内区域下载加速：
```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh
```

非交互模式：

```sh
cat setup.sh | sudo -E bash -
```

或在root管理员权限下执行

```sh
cat setup.sh | bash -
```

交互模式：

```sh
sudo bash ./setup.sh
```

或在root管理员权限下执行

```sh
bash ./setup.sh
```

