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


print_status() {
    echo
    echo "## $1"
    echo
}

if test -t 1; then # if terminal
    ncolors=$(which tput > /dev/null && tput colors) # supports color
    if test -n "$ncolors" && test $ncolors -ge 8; then
        termcols=$(tput cols)
        bold="$(tput bold)"
        underline="$(tput smul)"
        standout="$(tput smso)"
        normal="$(tput sgr0)"
        black="$(tput setaf 0)"
        red="$(tput setaf 1)"
        green="$(tput setaf 2)"
        yellow="$(tput setaf 3)"
        blue="$(tput setaf 4)"
        magenta="$(tput setaf 5)"
        cyan="$(tput setaf 6)"
        white="$(tput setaf 7)"
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
  SCRIPT_NONINTERACTIVE=0

  if [ ! -z "${DEBIAN_FRONTEND}" ] && [ "${DEBIAN_FRONTEND}"=="noninteractive" ] ;then
    SCRIPT_NONINTERACTIVE=1
    USER_NAME=${USER_NAME_DEFAULT}
    USER_PASSWORD=${USER_PASSWORD_DEFAULT}
    CONDA_ENV_NAME=${CONDA_ENV_NAME_DEFAULT}
    CONDA_ENV_PY_VER=${CONDA_ENV_PY_VER_DEFAULT}
    TZ=${TZ_DEFAULT}
    TERM=${TERM_DEFAULT}
    ZSH_THEME=${ZSH_THEME_DEFAULT}
  else
    SCRIPT_NONINTERACTIVE=0
    read -e -p "USER_NAME: [${USER_NAME}] " -i ${USER_NAME} USER_NAME
    read -e -p "USER_PASSWORD: [${USER_PASSWORD}] " -i ${USER_PASSWORD} USER_PASSWORD
    read -e -p "CONDA_ENV_NAME: [${CONDA_ENV_NAME}] " -i ${CONDA_ENV_NAME} CONDA_ENV_NAME
    read -e -p "CONDA_ENV_PY_VER: [${CONDA_ENV_PY_VER}] " -i ${CONDA_ENV_PY_VER} CONDA_ENV_PY_VER
    read -e -p "TZ: [${TZ}] " -i ${TZ} TZ
    read -e -p "TERM: [${TERM}] " -i ${TERM} TERM
    read -e -p "ZSH_THEME: [${ZSH_THEME}] " -i ${ZSH_THEME} ZSH_THEME
  fi

  echo "SCRIPT_NONINTERACTIVE: [${SCRIPT_NONINTERACTIVE}] "
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
  if grep -q ${USER_NAME} /etc/group; then
    echo 'group already exists';
  else
    addgroup ${USER_NAME};
  fi
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
exec_cmd 'apt-get update'

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

print_status "Done."
}
## Defer setup until we have the complete script
setup


#sed -i -E "s/^Defaults env_reset/Defaults env_reset, timestamp_timeout=-1/g" /etc/sudoers
#sed -i -E "/\.myenvset/d" /root/.profile && \
#echo "export PATH=$HOME/.local/bin:$HOME/bin:$PATH:/usr/local/go/bin" >> /root/.profile && \
#echo "if [ -f $HOME/.myenvset ]; then source $HOME/.myenvset;fi" >> /root/.profile
