# oh-my-env

my env setup script

## Translations

* [English](README.md)
* [简体中文](README.zh_CN.md)

## Quick Start

if you have issue about connection with software source site then you need your server with proxy support to download package or fetch config from source site,
Solution examples:
1. server host http proxy service at http://127.0.0.1:7890
2. ssh client connect to server with proxy forward.

for example, client ssh config:
```conf
Host myserver
    HostName 192.168.0.101
    User user
    Port 22
    RemoteForward 7890 localhost:1080
```
forward remote server (192.168.0.101) port 7890 to localhost(ssh client machine) port 1080
so, if you host http proxy at local machine port 1080, (proxy address:http://127.0.0.1:1080),then you can use this proxy at remote server port 7890:
check connection via proxy ok at remote server with:
```sh
curl --connect-timeout 15 --max-time 20 -ivs -x http://127.0.0.1:7890 https://httpbin.org/ip
```

quick install this via the command-line

```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
```

For CN region:

```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
```

## Customize

If you want to customize settings before install
you could download and edit ~/.omerc file:
download example file:
```sh
curl -fsSL -o ~/.omerc.example https://raw.githubusercontent.com/nickfan/oh-my-env/master/.omerc.example
cp -af ~/.omerc.example ~/.omerc
```
For CN region:
```sh
curl -fsSL -o ~/.omerc.example https://gitee.com/nickfan/oh-my-env/raw/master/.omerc.example
cp -af ~/.omerc.example ~/.omerc
```

## Install

use curl run with sudo
```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
```
or use wget run with sudo
```sh
wget -qO- https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
```

or use curl run as root
```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | bash -
```
or use wget run as root
```sh
wget -qO- https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | bash -
```

For CN region:

use curl run with sudo
```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
```
or use wget run with sudo
```sh
wget -qO- https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
```

or use curl run as root
```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | bash -
```
or use wget run as root
```sh
wget -qO- https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | bash -
```

download and run at local:

```sh
curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh
```
For CN region:
```sh
curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh
```

noninteractive mode:

```sh
cat setup.sh | sudo -E bash -
```

or run as root

```sh
cat setup.sh | bash -
```

interactive mode:

```sh
sudo bash ./setup.sh
```

or run as root

```sh
bash ./setup.sh
```

