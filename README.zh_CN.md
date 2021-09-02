# oh-my-env

环境配置脚本

## 翻译

[English](README.md)
[简体中文](README.zh_CN.md)

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

