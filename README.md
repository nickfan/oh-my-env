# oh-my-env

my env setup script

## Translations

* [English](README.md)
* [简体中文](README.zh_CN.md)

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

