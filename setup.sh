#!/usr/bin/env bash
#
# Run as root
#
# curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | bash -
#   or
# wget -qO- https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | bash -
#
# or insert `sudo -E` before `bash`:
#
# curl -fsSL https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
#   or
# wget -qO- https://raw.githubusercontent.com/nickfan/oh-my-env/master/setup.sh | sudo -E bash -
#
# FOR CN region:
#
# Run as root
#
# curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | bash -
#   or
# wget -qO- https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | bash -
#
# or insert `sudo -E` before `bash`:
#
# curl -fsSL https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
#   or
# wget -qO- https://gitee.com/nickfan/oh-my-env/raw/master/setup.sh | sudo -E bash -
#
#
# Run at local as root noninteractive
#
# cat setup.sh | bash -
#
# or insert `sudo -E` before `bash`:
#
# cat setup.sh | sudo -E bash -
#
# Run at local as root interactive
#
# bash ./setup.sh
#
# or with sudo
#
# sudo bash ./setup.sh
#
#

print_status() {
    echo
    echo "## $1"
    echo
}

ACT_USER=$(whoami)
ACT_GROUP=$(id -gn)
SCRIPT_NONINTERACTIVE=1
SCRIPT_INTERACTIVE_CONFIRM="y"
if [[ $- == *i* ]];then
  SCRIPT_NONINTERACTIVE=1
else
  if [ -z "$PS1" ]; then
    read -e -p "Proceed? [y/n] " -i ${SCRIPT_INTERACTIVE_CONFIRM} SCRIPT_INTERACTIVE_CONFIRM
    echo ${SCRIPT_INTERACTIVE_CONFIRM}
    if [[ "${SCRIPT_INTERACTIVE_CONFIRM}" == "y" ]];then
      SCRIPT_NONINTERACTIVE=0
    else
      SCRIPT_NONINTERACTIVE=1
    fi
  else
    SCRIPT_NONINTERACTIVE=1
  fi
fi

print_bold() {
    title="$1"
    text="$2"

    echo
    echo "${red}================================================================================${normal}"
    echo "${red}================================================================================${normal}"
    echo
    echo -e "  ${bold}${yellow}${title}${normal}"
    echo
    echo -en "  ${text}"
    echo
    echo "${red}================================================================================${normal}"
    echo "${red}================================================================================${normal}"
}

bail() {
    echo 'Error executing command, exiting'
    exit 1
}

exec_cmd_nobail() {
    echo "+ $1"
    bash -c "$1"
}

exec_cmd() {
    exec_cmd_nobail "$1" || bail
}

check_root(){
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root";
    exit 1;
  fi
}

init_env(){
  USER_NAME_DEFAULT="www"
  USER_PASSWORD_DEFAULT="abc123"
  CONDA_ENV_NAME_DEFAULT="myenv"
  CONDA_ENV_PY_VER_DEFAULT="3.7"
  TZ_DEFAULT="etc/UTC"
  TERM_DEFAULT="xterm-256color"
  ZSH_THEME_DEFAULT="powerlevel10k"

  USER_NAME=${USER_NAME_DEFAULT}
  USER_PASSWORD=${USER_PASSWORD_DEFAULT}
  CONDA_ENV_NAME=${CONDA_ENV_NAME_DEFAULT}
  CONDA_ENV_PY_VER=${CONDA_ENV_PY_VER_DEFAULT}
  TZ=${TZ_DEFAULT}
  TERM=${TERM_DEFAULT}
  ZSH_THEME=${ZSH_THEME_DEFAULT}

  if [ -f "${HOME}/.omerc" ];then
    source "${HOME}/.omerc";
  else
    if [ -f "${HOME}/.omerc.example" ];then
      cp -af "${HOME}/.omerc.example" "${HOME}/.omerc";
      source "${HOME}/.omerc";
      chown ${ACT_USER}:${ACT_GROUP} ${HOME}/.omerc;
    else
      cat >${HOME}/.omerc.example <<EOL
USER_NAME=${USER_NAME_DEFAULT}
USER_PASSWORD=${USER_PASSWORD_DEFAULT}
CONDA_ENV_NAME=${CONDA_ENV_NAME_DEFAULT}
CONDA_ENV_PY_VER=${CONDA_ENV_PY_VER_DEFAULT}
TZ=${TZ_DEFAULT}
TERM=${TERM_DEFAULT}
ZSH_THEME=${ZSH_THEME_DEFAULT}

EOL
chown ${ACT_USER}:${ACT_GROUP} ${HOME}/.omerc.example;
    fi
  fi

  if [ ${SCRIPT_NONINTERACTIVE} -eq 0 ] ;then
    read -e -p "USER_NAME: [${USER_NAME}] " -i ${USER_NAME} USER_NAME
    read -e -p "USER_PASSWORD: [${USER_PASSWORD}] " -i ${USER_PASSWORD} USER_PASSWORD
    read -e -p "CONDA_ENV_NAME: [${CONDA_ENV_NAME}] " -i ${CONDA_ENV_NAME} CONDA_ENV_NAME
    read -e -p "CONDA_ENV_PY_VER: [${CONDA_ENV_PY_VER}] " -i ${CONDA_ENV_PY_VER} CONDA_ENV_PY_VER
    read -e -p "TZ: [${TZ}] " -i ${TZ} TZ
    read -e -p "TERM: [${TERM}] " -i ${TERM} TERM
    read -e -p "ZSH_THEME: [${ZSH_THEME}] " -i ${ZSH_THEME} ZSH_THEME
  else
    DEBIAN_FRONTEND="noninteractive"
  fi
  echo "USER_NAME: [${USER_NAME}] "
  echo "USER_PASSWORD: [${USER_PASSWORD}] "
  echo "CONDA_ENV_NAME: [${CONDA_ENV_NAME}] "
  echo "CONDA_ENV_PY_VER: [${CONDA_ENV_PY_VER}] "
  echo "TZ: [${TZ}] "
  echo "TERM: [${TERM}] "
  echo "ZSH_THEME: [${ZSH_THEME}] "
}

update_apt_source(){
  apt-get update;
}
install_base_package(){
  apt-get install -y --no-install-recommends \
    sudo net-tools iputils-ping iproute2 telnet curl wget httping nano procps traceroute iperf3 gnupg-agent apt-transport-https ca-certificates software-properties-common openssh-client openssh-server ntp ntpdate language-pack-en-base language-pack-zh-hans \
    zsh autojump fonts-powerline xfonts-75dpi xfonts-base xfonts-encodings xfonts-utils fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy
}

set_root_user(){
  chsh -s /bin/zsh root
}

setup_dist_user_group(){
  getent group ${USER_NAME} || groupadd ${USER_NAME}
  if id "${USER_NAME}" &>/dev/null; then
      echo 'user already exists'
  else
    adduser --quiet --disabled-password --shell /bin/zsh --ingroup ${USER_NAME} --home /home/${USER_NAME} --gecos "User" ${USER_NAME}
    echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo ${USER_NAME} && usermod -aG adm ${USER_NAME} && usermod -aG www-data ${USER_NAME}
  fi
}

setup() {

check_root

print_status "Installing the EnvSetup ..."

if $(uname -m | grep -Eq ^armv6); then
    print_status "You appear to be running on ARMv6 hardware. Unfortunately this is not currently supported by the EnvSetup Linux distributions."
    exit 1
fi

PRE_INSTALL_PKGS=""

# Check that HTTPS transport is available to APT
# (Check snaked from: https://get.docker.io/ubuntu/)

if [ ! -e /usr/lib/apt/methods/https ]; then
    PRE_INSTALL_PKGS="${PRE_INSTALL_PKGS} apt-transport-https"
fi

if [ ! -x /usr/bin/lsb_release ]; then
    PRE_INSTALL_PKGS="${PRE_INSTALL_PKGS} lsb-release"
fi

if [ ! -x /usr/bin/curl ] && [ ! -x /usr/bin/wget ]; then
    PRE_INSTALL_PKGS="${PRE_INSTALL_PKGS} curl"
fi

# Used by apt-key to add new keys

if [ ! -x /usr/bin/gpg ]; then
    PRE_INSTALL_PKGS="${PRE_INSTALL_PKGS} gnupg"
fi

# Populating Cache
print_status "Populating apt-get cache..."
#exec_cmd 'apt-get update'

if [ "X${PRE_INSTALL_PKGS}" != "X" ]; then
    print_status "Installing packages required for setup:${PRE_INSTALL_PKGS}..."
    # This next command needs to be redirected to /dev/null or the script will bork
    # in some environments
    exec_cmd "apt-get install -y${PRE_INSTALL_PKGS} > /dev/null 2>&1"
fi

IS_PRERELEASE=$(lsb_release -d | grep 'Ubuntu .*development' >& /dev/null; echo $?)
if [[ $IS_PRERELEASE -eq 0 ]]; then
    print_status "Your distribution, identified as \"$(lsb_release -d -s)\", is a pre-release version of Ubuntu. EnvSetup does not maintain official support for Ubuntu versions until they are formally released."
    exit 1
fi

init_env
setup_dist_user_group

print_status "Done."
}
## Defer setup until we have the complete script
setup

