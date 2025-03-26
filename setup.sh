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

# script env startup setup

CHECK_NEED_PROXY_URL="https://www.google.com/"

INSTALL_PKG_ENABLE_OPS=1
INSTALL_PKG_ENABLE_SRV=1
INSTALL_PKG_ENABLE_CLI=1
INSTALL_PKG_ENABLE_PYTHON=1
INSTALL_PKG_ENABLE_RUBY=1
INSTALL_PKG_ENABLE_NODEJS=1
INSTALL_PKG_ENABLE_JAVA=1
INSTALL_PKG_ENABLE_RUST=1
INSTALL_PKG_ENABLE_PHP=0
INSTALL_PKG_ENABLE_GOLANG=1
INSTALL_PKG_ENABLE_DOCKER=1
INSTALL_PKG_ENABLE_NGINX=0
INSTALL_PKG_ENABLE_LIBS=1
#
#SKIP_check_installed=0
#SKIP_set_installed=0
#SKIP_base_env_check_setup=0
#SKIP_set_user_shell=0
#SKIP_setup_dist_user_group=0
#SKIP_setup_system_env_files=0
#SKIP_update_package_source=0
#SKIP_install_package_system=0
#SKIP_setup_current_env_files=0
#SKIP_setup_package_addons=0
#SKIP_setup_env_zsh=0
#SKIP_setup_env_tmux=0
#SKIP_setup_env_fzf=0
#SKIP_setup_env_fonts=0
#SKIP_setup_env_conda=0

INSTALL_PKGS_BASE="sudo net-tools iputils-ping iproute2 telnet curl wget httping nano procps traceroute iperf3 apt-transport-https ca-certificates lsb-release software-properties-common gnupg-agent gnupg gnupg2 pass rng-tools openssh-client ntp ntpdate language-pack-en-base language-pack-zh-hans zsh autojump fonts-powerline xfonts-75dpi xfonts-base xfonts-encodings xfonts-utils fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy locales-all"
INSTALL_PKGS_SYSTEM="build-essential gcc g++ make cmake autoconf automake patch gdb libtool cpp pkg-config libc6-dev libncurses-dev sqlite3 openssl unixodbc pkg-config re2c keyboard-configuration bzip2 unzip p7zip unrar-free git-core mercurial wget curl nano vim lsof vim-doc vim-scripts ed gawk screen tmux valgrind graphviz graphviz-dev xsel xclip mc urlview tree tofrodos proxychains privoxy socat zhcon supervisor certbot lrzsz mc tig jq"

INSTALL_PKGS_SEGMENT_OPS="vim-nox neovim python3-neovim xxd wamerican lnav htop iftop iotop nethogs dstat multitail ncdu ranger silversearcher-ag asciinema"
INSTALL_PKGS_SEGMENT_SRV="openssh-server"
INSTALL_PKGS_SEGMENT_CLI="redis-tools mysql-client zookeeper zookeeper-bin"
INSTALL_PKGS_SEGMENT_PYTHON="python3 python3-dev python3-pip python3-setuptools python3-venv python3-lxml"
INSTALL_PKGS_SEGMENT_RUBY="ruby ruby-dev"
INSTALL_PKGS_SEGMENT_NODEJS="nodejs yarn"
INSTALL_PKGS_SEGMENT_JAVA="openjdk-8-jdk maven"
INSTALL_PKGS_SEGMENT_PHP=""
INSTALL_PKGS_SEGMENT_DOCKER="docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
INSTALL_PKGS_SEGMENT_NGINX="nginx-extras"
#INSTALL_PKGS_SEGMENT_LIBS="libxml2-dev libbz2-dev libexpat1-dev libssl-dev libffi-dev libsecret-1-dev libgconf2-4 libdb-dev libgmp3-dev zlib1g-dev linux-libc-dev libgudev-1.0-dev uuid-dev libpng-dev libjpeg-dev libfreetype6-dev libxslt1-dev libssh-dev libssh2-1-dev libpcre3-dev libpcre++-dev libmhash-dev libmcrypt-dev libltdl7-dev mcrypt libiconv-hook-dev libsqlite-dev libgettextpo0 libwrap0-dev libreadline-dev libzookeeper-mt-dev libnghttp2-dev"
INSTALL_PKGS_SEGMENT_LIBS="libxml2-dev libbz2-dev libexpat1-dev libssl-dev libffi-dev libsecret-1-dev libdb-dev libgmp3-dev zlib1g-dev linux-libc-dev libgudev-1.0-dev uuid-dev libpng-dev libjpeg-dev libfreetype6-dev libxslt1-dev libssh-dev libssh2-1-dev libpcre3-dev libmhash-dev libmcrypt-dev mcrypt libiconv-hook-dev libgettextpo0 libwrap0-dev libreadline-dev libzookeeper-mt-dev libnghttp2-dev"
INSTALL_PKGS_SEGMENT_LIBS_ADDON_BASE="sqlite libsqlite-dev libpcre++-dev libltdl7-dev"
INSTALL_PKGS_SEGMENT_LIBS_ADDON_24="sqlite3 libsqlite3-dev libpcre2-dev libltdl-dev"

SETUP_PKG_SEGMENT_GOLANG_PATH="/usr/local/go/bin"

PKG_VER_wkhtmltox="0.12.6.1-3"
PKG_OS_VER_wkhtmltox=""

PKG_VER_fd="10.1.0"
PKG_VER_ripgrep="14.1.0"
PKG_VER_bat="0.24.0"
PKG_VER_go="1.24.1"
PKG_VER_php_major="7.4"
PKG_VER_node_major="20"

SETUP_ACT_HOME=${HOME}
SETUP_ROOT_HOME="/root"
SETUP_USER="root"
SETUP_ROOT="root"
SETUP_USER_HOME=${SETUP_ACT_HOME}
SETUP_USER_HOME_DEFAULT=${SETUP_ACT_HOME}

ACT_USER=${SUDO_USER:-$(whoami)}
ACT_GROUP=$(id -gn ${ACT_USER})
SETUP_USER=${ACT_USER}

SETUP_RELEASE=$(lsb_release -cs)
SETUP_OS_SYSTEM=$(uname -s)
SETUP_OS_MACHINE=$(uname -m)
SETUP_OS_ARCH=$(dpkg --print-architecture)

# Extract major version number from release codename
SETUP_RELEASE_VER=$(lsb_release -rs)
SETUP_RELEASE_VER_MAJOR_PART=${SETUP_RELEASE_VER%.*}

# script env detect setup

# detect if script run as root
if [ "$EUID" -ne 0 ]; then
  echo "please run as root";
  exit 1;
fi
# detect if script run as noninteractive mode.
if [ -z ${SCRIPT_NONINTERACTIVE} ];then
  SCRIPT_NONINTERACTIVE=1
  SCRIPT_INTERACTIVE_CONFIRM="y"
  if [[ $- == *i* ]];then
    SCRIPT_NONINTERACTIVE=1
  else
    if [ -z "$PS1" ]; then
      read -e -p "Start Install? [y/n] " -i ${SCRIPT_INTERACTIVE_CONFIRM} SCRIPT_INTERACTIVE_CONFIRM
      if [[ "${SCRIPT_INTERACTIVE_CONFIRM}" == "y" ]];then
        SCRIPT_NONINTERACTIVE=0
      else
        SCRIPT_NONINTERACTIVE=1
      fi
    else
      SCRIPT_NONINTERACTIVE=1
    fi
  fi
else
  if [ ${SCRIPT_NONINTERACTIVE} -eq 1 ] ;then
    SCRIPT_NONINTERACTIVE=1
    DEBIAN_FRONTEND=noninteractive
    export DEBIAN_FRONTEND=noninteractive
  else
    SCRIPT_NONINTERACTIVE=0
  fi
fi


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


init_env_conf(){
  SERVER_REGION_CN_DEFAULT="auto"
  USE_PROXY_DEFAULT="auto"
  REPO_USE_PROXY_DEFAULT="n"
  PROXY_URI_DEFAULT="http://127.0.0.1:7890"
  NO_PROXY_LIST_DEFAULT="localhost,.example.com,169.254.169.254,0.0.0.0/8,10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,233.252.0.0/24,240.0.0.0/4,255.255.255.255/32"
  USER_NAME_DEFAULT="www"
  USER_PASSWORD_DEFAULT="abc123"
  CONDA_ENV_NAME_DEFAULT="myenv"
  CONDA_ENV_PY_VER_DEFAULT="3.12"
  TZ_DEFAULT="etc/UTC"
  TERM_DEFAULT="xterm-256color"
  ZSH_THEME_DEFAULT="powerlevel10k"

  SERVER_REGION_CN=${SERVER_REGION_CN_DEFAULT}
  USE_PROXY=${USE_PROXY_DEFAULT}
  REPO_USE_PROXY=${REPO_USE_PROXY_DEFAULT}
  PROXY_URI=${PROXY_URI_DEFAULT}
  NO_PROXY_LIST=${NO_PROXY_LIST_DEFAULT}
  USER_NAME=${USER_NAME_DEFAULT}
  USER_PASSWORD=${USER_PASSWORD_DEFAULT}
  USER_HOME="/home/${USER_NAME}"
  CONDA_ENV_NAME=${CONDA_ENV_NAME_DEFAULT}
  CONDA_ENV_PY_VER=${CONDA_ENV_PY_VER_DEFAULT}
  TZ=${TZ_DEFAULT}
  TERM=${TERM_DEFAULT}
  ZSH_THEME=${ZSH_THEME_DEFAULT}

  if [ ! -d "${SETUP_ACT_HOME}/.ome" ];then
    mkdir -p "${SETUP_ACT_HOME}/.ome"
    chown -R ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.ome
  fi

  if [ -f "${SETUP_ACT_HOME}/.omerc" ];then
    source "${SETUP_ACT_HOME}/.omerc";
  else
    if [ -f "${SETUP_ACT_HOME}/.omerc.example" ];then
      cp -af "${SETUP_ACT_HOME}/.omerc.example" "${SETUP_ACT_HOME}/.omerc";
      source "${SETUP_ACT_HOME}/.omerc";
      chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.omerc;
    else
      cat >${SETUP_ACT_HOME}/.omerc.example <<EOL
SERVER_REGION_CN=${SERVER_REGION_CN_DEFAULT}
USE_PROXY=${USE_PROXY_DEFAULT}
REPO_USE_PROXY=${REPO_USE_PROXY_DEFAULT}
PROXY_URI=${PROXY_URI_DEFAULT}
NO_PROXY_LIST="${NO_PROXY_LIST_DEFAULT}"
USER_NAME=${USER_NAME_DEFAULT}
USER_PASSWORD=${USER_PASSWORD_DEFAULT}
CONDA_ENV_NAME=${CONDA_ENV_NAME_DEFAULT}
CONDA_ENV_PY_VER=${CONDA_ENV_PY_VER_DEFAULT}
TZ="${TZ_DEFAULT}"
TERM=${TERM_DEFAULT}
ZSH_THEME="${ZSH_THEME_DEFAULT}"
EOL
chown ${ACT_USER}:${ACT_GROUP} ${HOME}/.omerc.example;
    fi
  fi

  if [ ${SCRIPT_NONINTERACTIVE} -eq 0 ] ;then
    read -e -p "SERVER_REGION_CN: " -i ${SERVER_REGION_CN} SERVER_REGION_CN
    read -e -p "USE_PROXY: " -i ${USE_PROXY} USE_PROXY
    read -e -p "REPO_USE_PROXY: " -i ${REPO_USE_PROXY} REPO_USE_PROXY
    read -e -p "PROXY_URI: " -i ${PROXY_URI} PROXY_URI
    read -e -p "USER_NAME: " -i ${USER_NAME} USER_NAME
    read -e -p "USER_PASSWORD: " -i ${USER_PASSWORD} USER_PASSWORD
    read -e -p "CONDA_ENV_NAME: " -i ${CONDA_ENV_NAME} CONDA_ENV_NAME
    read -e -p "CONDA_ENV_PY_VER: " -i ${CONDA_ENV_PY_VER} CONDA_ENV_PY_VER
    read -e -p "TZ: " -i ${TZ} TZ
    read -e -p "TERM: " -i ${TERM} TERM
    read -e -p "ZSH_THEME: " -i ${ZSH_THEME} ZSH_THEME
  else
    DEBIAN_FRONTEND=noninteractive
  fi
  SETUP_USER=${USER_NAME}
  SETUP_USER_HOME="/home/${USER_NAME}"
  SETUP_USER_HOME_DEFAULT="/home/${USER_NAME}"

  if [ ${USER_NAME} == "root" ];then
    USER_HOME="/root"
    SETUP_USER_HOME="/root"
  else
    USER_HOME="/home/${USER_NAME}"
    SETUP_USER_HOME="/home/${USER_NAME}"
  fi
  if [ ${SERVER_REGION_CN} == "auto" ];then
    echo "detecting server region in CN "
#    SERVER_REGION_CODE=$(curl -fsSL https://ipapi.co/country_code)
    SERVER_REGION_CODE=$(curl -fsSL http://ip-api.com/line/?fields=countryCode)
    echo "result: ${SERVER_REGION_CODE}"
    if [ ${SERVER_REGION_CODE} == "CN" ] || [ ${SERVER_REGION_CODE} == "cn" ];then
      SERVER_REGION_CN="y"
    else
      SERVER_REGION_CN="n"
    fi
  fi
  if [ ${USE_PROXY} == "auto" ];then
    echo "detecting if need use proxy..."
    if ! check_url_is_ok "${CHECK_NEED_PROXY_URL}" ; then
      echo "checking if proxy connection ok..."
      if ! check_proxy_is_ok "${PROXY_URI}" ; then
        echo "proxy connection invalid.";
        USE_PROXY="n"
        if [ ${REPO_USE_PROXY} == "auto" ];then
          REPO_USE_PROXY="n"
        fi
      else
        USE_PROXY="y"
        if [ ${REPO_USE_PROXY} == "auto" ];then
          REPO_USE_PROXY="n"
        fi
      fi
    fi
  fi
  setup_env_set_proxy

  if [ -f "${SETUP_ACT_HOME}/.ome/steps.env" ];then
    source "${SETUP_ACT_HOME}/.ome/steps.env";
  fi

  echo "======================"
  echo "ACT_USER: [${ACT_USER}]"
  echo "ACT_GROUP: [${ACT_GROUP}]"
  echo "SETUP_USER: [${SETUP_USER}]"
  echo "SETUP_USER: [${SETUP_USER}]"
  echo "SERVER_REGION_CN: [${SERVER_REGION_CN}] "
  echo "USE_PROXY: [${USE_PROXY}] "
  echo "REPO_USE_PROXY: [${REPO_USE_PROXY}] "
  echo "PROXY_URI: [${PROXY_URI}] "
  echo "USER_NAME: [${USER_NAME}] "
  echo "USER_PASSWORD: [${USER_PASSWORD}] "
  echo "CONDA_ENV_NAME: [${CONDA_ENV_NAME}] "
  echo "CONDA_ENV_PY_VER: [${CONDA_ENV_PY_VER}] "
  echo "TZ: [${TZ}] "
  echo "TERM: [${TERM}] "
  echo "ZSH_THEME: [${ZSH_THEME}] "
}

setup_env_set_proxy(){
  cat >${SETUP_ACT_HOME}/.nopx.sh <<EOL
#!/usr/bin/env bash
#unset PROXY_URI
unset http_proxy
unset https_proxy
unset ftp_proxy
unset all_proxy
EOL
  if [ ! -z ${PROXY_URI} ];then
    if [[ ! -f ${SETUP_ACT_HOME}/.apt_proxy.conf ]];then
      if [[ "${REPO_USE_PROXY}" == "ok" || "${REPO_USE_PROXY}" == "y" || "${REPO_USE_PROXY}" == "Y" || "${REPO_USE_PROXY}" == "yes" || "${REPO_USE_PROXY}" == "Yes"  || "${REPO_USE_PROXY}" == "YES" ]];then
        echo "Acquire::http::Proxy \"${PROXY_URI}\";" >${SETUP_ACT_HOME}/.apt_proxy.conf
      else
        touch ${SETUP_ACT_HOME}/.apt_proxy.conf
      fi
    fi
    cat >${SETUP_ACT_HOME}/.setpx.sh <<EOL
#!/usr/bin/env bash
export PROXY_URI="${PROXY_URI}";
export https_proxy="${PROXY_URI}";
export http_proxy="${PROXY_URI}";
export all_proxy="${PROXY_URI}";
export no_proxy="${NO_PROXY_LIST}"
EOL
  else
    touch ${SETUP_ACT_HOME}/.apt_proxy.conf
    cat >${SETUP_ACT_HOME}/.setpx.sh <<EOL
#!/usr/bin/env bash
export PROXY_URI=
export https_proxy=
export http_proxy=
export all_proxy=
export no_proxy=
EOL
  fi
  chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.apt_proxy.conf;
  chmod +x ${SETUP_ACT_HOME}/.setpx.sh;
  chmod +x ${SETUP_ACT_HOME}/.nopx.sh;
  chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.setpx.sh;
  chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.nopx.sh;
}
activate_env_set_proxy(){
  if [[ "${USE_PROXY}" == "ok" || "${USE_PROXY}" == "y" || "${USE_PROXY}" == "Y" || "${USE_PROXY}" == "yes" || "${USE_PROXY}" == "Yes"  || "${USE_PROXY}" == "YES" ]];then
    if [ -f "${SETUP_ACT_HOME}/.setpx.sh" ];then
      source ${SETUP_ACT_HOME}/.setpx.sh;
      echo "now activate proxy settings";
      echo "PROXY_URI: ${PROXY_URI}";
      echo "https_proxy: ${https_proxy}";
      echo "http_proxy: ${http_proxy}";
      echo "all_proxy: ${all_proxy}";
      echo "no_proxy: ${no_proxy}";
    else
        echo "proxy settings file not found";
        exit 1;
    fi
  fi
}
deactivate_env_set_proxy(){
  if [ -f "${SETUP_ACT_HOME}/.nopx.sh" ];then
    source ${SETUP_ACT_HOME}/.nopx.sh;
    echo "now deactivate proxy settings";
    echo "PROXY_URI: ${PROXY_URI}";
    echo "https_proxy: ${https_proxy}";
    echo "http_proxy: ${http_proxy}";
    echo "all_proxy: ${all_proxy}";
    echo "no_proxy: ${no_proxy}";
  else
    echo "proxy settings file not found";
    exit 1;
  fi
}
print_status() {
    echo
    echo "## $1"
    echo
}

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
check_url_is_ok(){
  status_code=$(curl --connect-timeout ${2:-7} --max-time ${3:-7} -s -o /dev/null -w "%{http_code}" ${1})
  if [ "${status_code}" = "000" ]; then
    # 1 = false
    return 1
  else
    # 0 = true
    return 0
  fi
}
check_proxy_is_ok(){
  status_code=$(curl --connect-timeout ${3:-7} --max-time ${4:-7} -x ${1:-${PROXY_URI}} -s -o /dev/null -w "%{http_code}" ${2:-${CHECK_NEED_PROXY_URL}})
  if [ "${status_code}" = "000" ]; then
    # 1 = false
    return 1
  else
    # 0 = true
    return 0
  fi
}
get_my_ip() {
    case "`uname`" in
        Darwin)
         myip=`echo "show State:/Network/Global/IPv4" | scutil | grep PrimaryInterface | awk '{print $3}' | xargs ifconfig | grep inet | grep -v inet6 | awk '{print $2}'`
         ;;
        *)
#         myip=`ip route get 1 | awk '{print $NF;exit}'`
         myip=`ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p'`
         ;;
  esac
  echo $myip
}

check_set_setup_user(){
  SETUP_USER=${1:-${USER_NAME}}
  if [[ "${SETUP_USER}" == "root" ]];then
    SETUP_USER_HOME=${SETUP_ROOT_HOME}
  else
    SETUP_USER_HOME="/home/${SETUP_USER}"
  fi
#  return ${SETUP_USER}
}
check_installed(){
  if ! check_skip_step "check_installed";then return 0;fi
  if [ -f "${SETUP_ACT_HOME}/.ome/installed" ];then
    print_bold "Already installed now exit."
    exit 1;
  fi
  set_resume_step "check_installed"
}
set_installed(){
  if ! check_skip_step "set_installed";then return 0;fi
  echo "`date -u +'%Y-%m-%d %H:%M:%S %Z'`" > "${SETUP_ACT_HOME}/.ome/installed";
  chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.ome/installed;
  set_resume_step "set_installed"
}
check_skip_step(){
  STEP_LABEL_CURRENT=${1};
  STEP_USER_CURRENT=${2};
  if [ -n "${STEP_LABEL_CURRENT}" ];then
    SKIP_LABEL_VAR_NAME="SKIP_${STEP_LABEL_CURRENT}";
    if [ -n "${STEP_USER_CURRENT}" ];then
      SKIP_LABEL_VAR_NAME="${SKIP_LABEL_VAR_NAME}_${STEP_USER_CURRENT}";
    fi
#    echo "SKIP_LABEL_VAR_NAME: ${SKIP_LABEL_VAR_NAME}"
    SKIP_LABEL_VAR_VALUE=${!SKIP_LABEL_VAR_NAME}
#    echo "SKIP_LABEL_VAR_VALUE: ${SKIP_LABEL_VAR_VALUE}"
    if [[ ${SKIP_LABEL_VAR_VALUE} -eq 1 ]];then
      echo "[SKIP] ${STEP_LABEL_CURRENT} ${STEP_USER_CURRENT}";
      return 1;
    else
      echo "[STEP] ${STEP_LABEL_CURRENT} ${STEP_USER_CURRENT}";
      return 0;
    fi
  else
    return 0;
  fi
}
set_resume_step(){
  STEP_LABEL_CURRENT=${1};
  STEP_USER_CURRENT=${2};
  if [ -n "${STEP_LABEL_CURRENT}" ];then
    SKIP_LABEL_VAR_NAME="SKIP_${STEP_LABEL_CURRENT}";
    if [ -n "${STEP_USER_CURRENT}" ];then
      SKIP_LABEL_VAR_NAME="${SKIP_LABEL_VAR_NAME}_${STEP_USER_CURRENT}";
    fi
    if [ ! -d "${SETUP_ACT_HOME}/.ome" ];then
      mkdir -p "${SETUP_ACT_HOME}/.ome";
      chown -R ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.ome;
    fi
    if [[ ! -f "${SETUP_ACT_HOME}/.ome/steps.env" ]];then
      touch ${SETUP_ACT_HOME}/.ome/steps.env;
    fi
    sed -i -E "/${SKIP_LABEL_VAR_NAME}=/d" ${SETUP_ACT_HOME}/.ome/steps.env;
    echo "${SKIP_LABEL_VAR_NAME}=1" >> ${SETUP_ACT_HOME}/.ome/steps.env;
    chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.ome/steps.env;
  fi
}
done_resume_setp(){
  if [ ! -d "${SETUP_ACT_HOME}/.ome" ];then
    mkdir -p "${SETUP_ACT_HOME}/.ome";
    chown -R ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.ome;
  fi
  if [[ -f "${SETUP_ACT_HOME}/.ome/steps.env" ]];then
    rm -rf "${SETUP_ACT_HOME}/.ome/steps.env";
  fi
}

base_env_check_setup(){
  if ! check_skip_step "base_env_check_setup";then return 0;fi

  if $(uname -m | grep -Eq ^armv6); then
      print_status "You appear to be running on ARMv6 hardware. Unfortunately this is not currently supported by the EnvSetup Linux distributions."
      exit 1
  fi

  # Populating Cache
  print_status "Populating apt-get cache..."
  exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf update"
  exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf install -y --no-install-recommends ${INSTALL_PKGS_BASE}"
  IS_PRERELEASE=$(lsb_release -d | grep 'Ubuntu .*development' >& /dev/null; echo $?)
  if [[ $IS_PRERELEASE -eq 0 ]]; then
      print_status "Your distribution, identified as \"$(lsb_release -d -s)\", is a pre-release version of Ubuntu. EnvSetup does not maintain official support for Ubuntu versions until they are formally released."
      exit 1
  fi
  set_resume_step "base_env_check_setup"
}

set_user_shell(){
  check_set_setup_user ${1:-${SETUP_USER}};
  if ! check_skip_step "set_user_shell" ${SETUP_USER};then return 0;fi
  chsh -s /bin/zsh ${SETUP_USER}
  set_resume_step "set_user_shell" ${SETUP_USER}
}

setup_dist_user_group(){
  if ! check_skip_step "setup_dist_user_group";then return 0;fi
  getent group adm || groupadd -r -g 4 adm
  getent group sudo || groupadd -r -g 27 sudo
  getent group admin || groupadd -r -g 127 admin

  getent group ${USER_NAME} || groupadd ${USER_NAME}
  if id "${USER_NAME}" &>/dev/null; then
      echo 'user already exists'
  else
    adduser --quiet --disabled-password --shell /bin/zsh --ingroup ${USER_NAME} --home ${USER_HOME} --gecos "User" ${USER_NAME}
    if [ -n "${USER_PASSWORD}" ]; then
      echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd
    fi
  fi
  usermod -aG sudo ${USER_NAME} && usermod -aG adm ${USER_NAME} && usermod -aG www-data ${USER_NAME}
  set_resume_step "setup_dist_user_group"
}
setup_system_env_files(){
  if ! check_skip_step "setup_system_env_files";then return 0;fi
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  if [[ ${INSTALL_PKG_ENABLE_JAVA} -eq 1 ]];then
    sed -i -E "/JAVA_HOME=/d" /etc/environment && \
    echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment
  fi
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    sed -i -E "/GOROOT=/d" /etc/environment && \
    echo 'GOROOT="/usr/local/go"' >> /etc/environment
  fi
  mkdir -p /data/{app/{backup,etc,tmp,certs,www,ops,downloads/temp},var/{log/app,run,tmp}}
  if [[ ! -d /data/app/var ]];then
    ln -nfs /data/var /data/app/var;
  fi
  chown -R ${USER_NAME}:${USER_NAME} /data/app && \
  chown -R ${USER_NAME}:${USER_NAME} /data/var
  if [[ ! -d /data/wwwroot ]];then
    ln -nfs /data/app /data/wwwroot;
  fi
  if [[ ! -d /data/wwwlogs ]];then
    ln -nfs /data/var/log /data/wwwlogs;
  fi
  if [[ ! -d /home/wwwroot ]];then
    ln -nfs /data/app /home/wwwroot;
  fi
  if [[ ! -d /Users ]];then
    ln -nfs /home /Users;
  fi
  if [[ "${USER_NAME}" != "user" && "${USER_NAME}" != "root" ]];then
    if [[ ! -d /home/user ]];then
      ln -nfs ${USER_HOME} /home/user;
    fi
  fi
  set_resume_step "setup_system_env_files"
}
update_package_source(){
  if ! check_skip_step "update_package_source";then return 0;fi

  if [[ ${INSTALL_PKG_ENABLE_OPS} -eq 1 ]];then
    add-apt-repository -y -n ppa:neovim-ppa/stable
  fi
  if [[ ${INSTALL_PKG_ENABLE_DOCKER} -eq 1 ]];then
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    install -m 0755 -d /etc/apt/keyrings
    if [[ ${SERVER_REGION_CN} == "y" ]];then
      curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg
      curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
      chmod a+r /etc/apt/keyrings/docker.gpg
      chmod a+r /etc/apt/keyrings/docker.asc
      echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    else
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
      chmod a+r /etc/apt/keyrings/docker.gpg
      chmod a+r /etc/apt/keyrings/docker.asc
      echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    fi
  fi
  if [[ ${INSTALL_PKG_ENABLE_PHP} -eq 1 ]];then
    add-apt-repository -y -n ppa:ondrej/php
  fi
  if [[ ${INSTALL_PKG_ENABLE_NGINX} -eq 1 ]];then
    add-apt-repository -y -n ppa:nginx/stable
  fi
  if [[ ${INSTALL_PKG_ENABLE_NODEJS} -eq 1 ]];then
    curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/yarnkey.gpg
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    curl -fsSL https://deb.nodesource.com/setup_${PKG_VER_node_major}.x | bash -
  else
    exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf update"
  fi
  set_resume_step "update_package_source"
}
install_package_system(){
  if ! check_skip_step "install_package_system";then return 0;fi
  INSTALL_PKGS_SETUP=${INSTALL_PKGS_SYSTEM}
  if [[ ${INSTALL_PKG_ENABLE_OPS} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_OPS}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_SRV} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_SRV}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_CLI} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_CLI}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_PYTHON} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_PYTHON}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_RUBY} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_RUBY}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_NODEJS} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_NODEJS}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_JAVA} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_JAVA}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_DOCKER} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_DOCKER}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_NGINX} -eq 1 ]];then
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_NGINX}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_PHP} -eq 1 ]];then
    if [[ ${PKG_VER_php_major} == "7.1" ]];then
      INSTALL_PKGS_SEGMENT_PHP="php7.1 php7.1-cli php7.1-dev php7.1-fpm php7.1-curl php7.1-gd php7.1-gmp php7.1-intl php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-readline php7.1-soap php7.1-sqlite3 php7.1-zip php7.1-opcache php7.1-xml php7.1-raphf php7.1-propro php-xml php-pear phpunit php-http php-apcu php-imagick php-redis php-memcached php-apcu-bc php-memcache php-msgpack php-geoip php-igbinary php-amqp libnghttp2-dev"
    elif [[ ${PKG_VER_php_major} == "7.2" ]];then
      INSTALL_PKGS_SEGMENT_PHP="php7.2 php7.2-cli php7.2-dev php7.2-fpm php7.2-curl php7.2-gd php7.2-gmp php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-readline php7.2-soap php7.2-sqlite3 php7.2-zip php7.2-opcache php7.2-xml php7.2-raphf php7.2-propro php-xml php-pear phpunit php-http php-apcu php-imagick php-redis php-memcached php-apcu-bc php-memcache php-msgpack php-geoip php-igbinary php-amqp libnghttp2-dev"
    elif [[ ${PKG_VER_php_major} == "7.3" ]];then
      INSTALL_PKGS_SEGMENT_PHP="php7.3 php7.3-cli php7.3-dev php7.3-fpm php7.3-curl php7.3-gd php7.3-gmp php7.3-intl php7.3-json php7.3-mbstring php7.3-mysql php7.3-readline php7.3-soap php7.3-sqlite3 php7.3-zip php7.3-opcache php7.3-xml php7.3-raphf php7.3-propro php-xml php-pear phpunit php-http php-apcu php-imagick php-redis php-memcached php-apcu-bc php-memcache php-msgpack php-geoip php-igbinary php-amqp libnghttp2-dev"
    elif [[ ${PKG_VER_php_major} == "7.4" ]];then
      INSTALL_PKGS_SEGMENT_PHP="php7.4 php7.4-cli php7.4-dev php7.4-fpm php7.4-curl php7.4-gd php7.4-gmp php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-readline php7.4-soap php7.4-sqlite3 php7.4-zip php7.4-opcache php7.4-xml php7.4-raphf php7.4-propro php-xml php-pear phpunit php-http php-apcu php-imagick php-redis php-memcached php-apcu-bc php-memcache php-msgpack php-geoip php-igbinary php-amqp libnghttp2-dev"
    else
      INSTALL_PKGS_SEGMENT_PHP="php${PKG_VER_php_major} php${PKG_VER_php_major}-cli php${PKG_VER_php_major}-dev php${PKG_VER_php_major}-fpm php${PKG_VER_php_major}-curl php${PKG_VER_php_major}-gd php${PKG_VER_php_major}-gmp php${PKG_VER_php_major}-intl php${PKG_VER_php_major}-json php${PKG_VER_php_major}-mbstring php${PKG_VER_php_major}-mysql php${PKG_VER_php_major}-readline php${PKG_VER_php_major}-soap php${PKG_VER_php_major}-sqlite3 php${PKG_VER_php_major}-zip php${PKG_VER_php_major}-opcache php${PKG_VER_php_major}-xml php${PKG_VER_php_major}-raphf php${PKG_VER_php_major}-propro php-xml php-pear phpunit php-http php-apcu php-imagick php-redis php-memcached php-apcu-bc php-memcache php-msgpack php-geoip php-igbinary php-amqp libnghttp2-dev"
    fi
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_PHP}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_LIBS} -eq 1 ]];then
    # Check if version-specific addon package list exists
    ADDON_VAR_NAME="INSTALL_PKGS_SEGMENT_LIBS_ADDON_${SETUP_RELEASE_VER_MAJOR_PART}"
    if [ -n "${!ADDON_VAR_NAME}" ]; then
      # If version-specific addon exists, use it
      INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_LIBS} ${!ADDON_VAR_NAME}"
    else
      # Otherwise use base addon
      INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_LIBS} ${INSTALL_PKGS_SEGMENT_LIBS_ADDON_BASE}"
    fi
  fi
  exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf install -y --no-install-recommends ${INSTALL_PKGS_SETUP}"
  set_resume_step "install_package_system"
}
setup_current_env_files(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_current_env_files" ${SETUP_USER};then return 0;fi
  ADDON_PATH_SEG=""
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    ADDON_PATH_SEG="${ADDON_PATH_SEG}:\$HOME/go/bin:${SETUP_PKG_SEGMENT_GOLANG_PATH}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_NODEJS} -eq 1 ]];then
    ADDON_PATH_SEG="${ADDON_PATH_SEG}:\$HOME/.yarn/bin"
  fi
  if [[ ${INSTALL_PKG_ENABLE_RUST} -eq 1 ]];then
    ADDON_PATH_SEG="${ADDON_PATH_SEG}:\$HOME/.cargo/bin"
  fi
  if [[ ${INSTALL_PKG_ENABLE_PHP} -eq 1 ]];then
    ADDON_PATH_SEG="${ADDON_PATH_SEG}:\$HOME/.composer/vendor/bin"
  fi
  sed -i -E "/\.myenvset/d" ${SETUP_USER_HOME}/.profile && \
  echo "export PATH=\$HOME/.local/bin:\$HOME/bin:/usr/local/bin:/usr/local/sbin${ADDON_PATH_SEG}:\$PATH" >> ${SETUP_USER_HOME}/.profile && \
  echo "if [ -f \$HOME/.myenvset ]; then source \$HOME/.myenvset;fi" >> ${SETUP_USER_HOME}/.profile
  chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.profile
  sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/{bin,tmp,setup,opt,var/{log,tmp,run}} && \
  mkdir -p ${SETUP_USER_HOME}/{.ssh/{config.d,ctrl.d},.local/bin,.config,.cache,.aria2} && \
  mkdir -p ${SETUP_USER_HOME}/Downloads/temp"

  if [[ ! -d ${SETUP_USER_HOME}/Code ]];then
      sudo -H -u ${SETUP_USER} bash -c "ln -nfs /data/app ${SETUP_USER_HOME}/Code"
  fi
  if [[ ${INSTALL_PKG_ENABLE_DOCKER} -eq 1 ]];then
    sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/.docker"
  fi
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/go/{src,bin,pkg}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_NODEJS} -eq 1 ]];then
    sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/{.yarn,.npm,.node-gyp}"
  fi
  if [[ ${INSTALL_PKG_ENABLE_JAVA} -eq 1 ]];then
    sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/.m2"
    if [[ ! -f ${SETUP_USER_HOME}/.m2/settings.xml && -f /usr/share/maven/conf/settings.xml ]];then
      cp -af /usr/share/maven/conf/settings.xml ${SETUP_USER_HOME}/.m2/settings.xml
      chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.m2/settings.xml
    fi
  fi
  if [[ ${INSTALL_PKG_ENABLE_RUST} -eq 1 ]];then
    sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/.cargo"
  fi
  if [[ ${INSTALL_PKG_ENABLE_PHP} -eq 1 ]];then
    sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/.composer"
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.myenvset ]];then
    cat >${SETUP_USER_HOME}/.myenvset <<EOL
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias xdmcp='/opt/X11/bin/X -query'
alias air='~/.air'
export PATH="\$HOME/.local/bin:\$HOME/bin:/usr/local/bin:/usr/local/sbin${ADDON_PATH_SEG}:\$PATH"
export no_proxy="${NO_PROXY_LIST}"

if [ -z "\$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add -k
fi

function setpx(){
  if [[ -z "\${1}" ]] && [[ -f \${HOME}/.setpx.sh ]] ;then
    source \${HOME}/.setpx.sh
  else
    local pxuri="\${1:-${PROXY_URI}}"
    export https_proxy="\${pxuri}";
    export http_proxy="\${pxuri}";
    export all_proxy="\${pxuri}";
  fi
}

function setnopx(){
#    unset PROXY_URI
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
}
function gitsetpx(){
  if [[ -z "\${1}" ]] && [[ -f \${HOME}/.setpx.sh ]] ;then
    source \${HOME}/.setpx.sh
    local pxuri="\${PROXY_URI}"
    git config --global http.proxy '\${pxuri}'
    git config --global https.proxy '\${pxuri}'
  else
    local pxuri="\${1:-${PROXY_URI}}"
    git config --global http.proxy '\${pxuri}'
    git config --global https.proxy '\${pxuri}'
  fi
}
function gitsetnopx(){
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

### CN mirrors setup ###
if [[ -f \$HOME/.myenv_mirrors_cn && -f \$HOME/.myenv_use_cn ]]; then source \$HOME/.myenv_mirrors_cn;fi
### local setup ###
if [ -f \$HOME/.myenv_local ]; then source \$HOME/.myenv_local;fi
### secret settings ###
if [ -f \$HOME/.myenv_secret ]; then source \$HOME/.myenv_secret;fi
### custom settings ###
if [ -f \$HOME/.myenv_custom ]; then source \$HOME/.myenv_custom;fi
EOL
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.myenvset
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.myenv_mirrors_cn ]];then
    cat >${SETUP_USER_HOME}/.myenv_mirrors_cn <<EOL
### CN mirrors setup ###
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export GO_SOURCE_URL="https://github.com/golang/go"
export GOPROXY=https://goproxy.cn,direct
export GOSUMDB=sum.golang.google.cn

#export RUSTUP_DIST_SERVER=https://static.rust-lang.org
#export RUSTUP_UPDATE_ROOT=https://static.rust-lang.org/rustup
#export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
#export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

EOL
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.myenv_mirrors_cn
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.myenv_secret ]];then
    cat >${SETUP_USER_HOME}/.myenv_secret <<EOL
#export HOMEBREW_GITHUB_API_TOKEN=_
EOL
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.myenv_secret
  fi
  if [[ ! -f ${SETUP_USER_HOME}/.myenv_local ]];then
    cat >${SETUP_USER_HOME}/.myenv_local <<EOL
export GOPATH=\$HOME/go
export CSC_IDENTITY_AUTO_DISCOVERY=false
export PIP_CONFIG_FILE=\$HOME/.pip/pip.conf

# ip route | grep default | awk '{print \$3}'
# or
# cat /etc/resolv.conf | grep nameserver | awk '{ print \$2 }'
#export WSL_HOST_IP=\$(awk '/nameserver / {print \$2; exit}' /etc/resolv.conf 2>/dev/null)
#export DISPLAY=\${WSL_HOST_IP}:0.0
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
setwslpx(){
  local wslpxhost="\${1:-\$WSL_HOST_IP}"
  local wslpxport="\${2:-7890}"
  export https_proxy="http://\${wslpxhost}:\${wslpxport}";
  export http_proxy="http://\${wslpxhost}:\${wslpxport}";
  export all_proxy="http://\${wslpxhost}:\${wslpxport}";
}
EOL
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.myenv_local
  fi

  if [[ ${SERVER_REGION_CN} == "y" ]];then
    sudo -H -u ${SETUP_USER} bash -c "touch ${SETUP_USER_HOME}/.myenv_use_cn"
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.gitignore_global ]];then
    cat >${SETUP_USER_HOME}/.gitignore_global <<EOL
*~
.DS_Store
.project
/.settings
.idea/*
/.idea/*
.idea
*.log
*.iml

EOL
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.gitignore_global
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.git-commit-template.txt ]];then
    cat >${SETUP_USER_HOME}/.git-commit-template.txt <<EOL
# <type>: (If applied, this commit will...) <subject> (Max 50 char)
# |<----  Using a Maximum Of 50 Characters  ---->|


# Explain why this change is being made
# |<----   Try To Limit Each Line to a Maximum Of 72 Characters   ---->|

# Provide links or keys to any relevant tickets, articles or other resources
# Example: Github issue #23

# --- COMMIT END ---
# Type can be
#    feat     (new feature)
#    fix      (bug fix)
#    refactor (refactoring production code)
#    style    (formatting, missing semi colons, etc; no code change)
#    docs     (changes to documentation)
#    test     (adding or refactoring tests; no production code change)
#    chore    (updating grunt tasks etc; no production code change)
# --------------------
# Remember to
#   - Capitalize the subject line
#   - Use the imperative mood in the subject line
#   - Do not end the subject line with a period
#   - Separate subject from body with a blank line
#   - Use the body to explain what and why vs. how
#   - Can use multiple lines with "-" for bullet points in body
# --------------------
# For updated template, visit:
# https://gist.github.com/adeekshith/cd4c95a064977cdc6c50
# Licence CC
EOL
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.git-commit-template.txt
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.gitconfig_default ]];then
    cat >${SETUP_USER_HOME}/.gitconfig_default <<EOL
[user]
	name = maintainer
	email = me@example.com
	username = maintainer
[core]
	excludesfile = ~/.gitignore_global
	autocrlf = input
	ignorecase = false
	pager =
	safecrlf = true
[alias]
	test = "!gi() { curl http://www.gitignore.io/api/$@ ;}; gi"
	co = checkout
	ci = commit
	st = status
	br = branch
	lg = "log --graph --decorate=short --pretty=oneline"
[pull]
	rebase = false
[push]
	default = simple
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
[format]
  ;pretty = oneline
  pretty = format:"%h - %cd - %an, %ce : %s"
[commit]
	template = ~/.git-commit-template.txt
	gpgsign = false
[color]
  pager = true
  ui = auto
  status = auto
  diff = auto
  branch = auto
  showBranch = auto
  interactive = auto
  grep = auto
[color "status"]
  header = black bold
  branch = cyan
  nobranch = red
  unmerged = red
  untracked = cyan
  added = cyan
  changed = red
[color "diff"]
  meta = red bold
  frag = black bold
  func = blue
  old = red
  new = cyan
  commit = blue
  whitespace = red
  context = normal
[color "branch"]
  current = cyan
  local = blue
  remote = magenta
  upstream = magenta
  plain = normal
[color "decorate"]
  branch = blue
  remoteBranch = magenta
  tag = magenta
  stash = cyan
  HEAD = blue
[color "interactive"]
  prompt = red
  header = red bold
  error = red
  help = black bold
[color "grep"]
  context = normal
  match = cyan
  filename = blue
  function = blue
  selected = normal
  separator = red bold
  linenumber = normal

EOL
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.gitconfig_default
  fi
  if [[ ! -f ${SETUP_USER_HOME}/.gitconfig ]];then
    cp -af ${SETUP_USER_HOME}/.gitconfig_default ${SETUP_USER_HOME}/.gitconfig
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.gitconfig
  fi
  if [[ "${USE_PROXY}" == "ok" || "${USE_PROXY}" == "y" || "${USE_PROXY}" == "Y" || "${USE_PROXY}" == "yes" || "${USE_PROXY}" == "Yes"  || "${USE_PROXY}" == "YES" ]];then
    sudo -H -u ${SETUP_USER} bash -c "git config --global http.proxy ${PROXY_URI} && git config --global https.proxy ${PROXY_URI}"
  else
    sudo -H -u ${SETUP_USER} bash -c "git config --global --unset http.proxy && git config --global --unset https.proxy"
  fi
  sudo -H -u ${SETUP_USER} bash -c "git config --global http.version HTTP/1.1"
  sudo -H -u ${SETUP_USER} bash -c "git config --global http.postBuffer 157286400"
  set_resume_step "setup_current_env_files" ${SETUP_USER}
}
setup_package_addons(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_package_addons" ${SETUP_USER};then return 0;fi

  mkdir -p ${SETUP_USER_HOME}/setup && chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/setup && cd ${SETUP_USER_HOME}/setup
  PKG_OS_VER_wkhtmltox=${SETUP_RELEASE}
  if [[ ${SETUP_RELEASE_VER_MAJOR_PART} -gt 22 ]]; then
    PKG_OS_VER_wkhtmltox="jammy"
  else
    PKG_OS_VER_wkhtmltox=${SETUP_RELEASE}
  fi

  if [[ ! -f ${SETUP_USER_HOME}/setup/wkhtmltox_${PKG_VER_wkhtmltox}.${PKG_OS_VER_wkhtmltox}_amd64.deb ]];then
      exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/wkhtmltox_${PKG_VER_wkhtmltox}.${PKG_OS_VER_wkhtmltox}_amd64.deb https://github.com/wkhtmltopdf/packaging/releases/download/${PKG_VER_wkhtmltox}/wkhtmltox_${PKG_VER_wkhtmltox}.${PKG_OS_VER_wkhtmltox}_amd64.deb"
  fi
  dpkg -i -E wkhtmltox_${PKG_VER_wkhtmltox}.${PKG_OS_VER_wkhtmltox}_amd64.deb
  if [[ ${INSTALL_PKG_ENABLE_OPS} -eq 1 ]];then
    if [[ ! -f ${SETUP_USER_HOME}/setup/fd_${PKG_VER_fd}_amd64.deb ]];then
        exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/fd_${PKG_VER_fd}_amd64.deb https://github.com/sharkdp/fd/releases/download/v${PKG_VER_fd}/fd_${PKG_VER_fd}_amd64.deb"
    fi
    dpkg -i -E fd_${PKG_VER_fd}_amd64.deb
    if [[ ! -f ${SETUP_USER_HOME}/setup/ripgrep_${PKG_VER_ripgrep}_amd64.deb ]];then
        exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/ripgrep_${PKG_VER_ripgrep}_amd64.deb https://github.com/BurntSushi/ripgrep/releases/download/${PKG_VER_ripgrep}/ripgrep_${PKG_VER_ripgrep}-1_amd64.deb"
    fi
    dpkg -i -E ripgrep_${PKG_VER_ripgrep}_amd64.deb
    if [[ ! -f ${SETUP_USER_HOME}/setup/bat_${PKG_VER_bat}_amd64.deb ]];then
      exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/bat_${PKG_VER_bat}_amd64.deb https://github.com/sharkdp/bat/releases/download/v${PKG_VER_bat}/bat_${PKG_VER_bat}_amd64.deb"
    fi
    dpkg -i bat_${PKG_VER_bat}_amd64.deb
  fi
  if [[ ${INSTALL_PKG_ENABLE_DOCKER} -eq 1 ]];then
    exec_cmd "curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash"
    if [[ ! -f /usr/local/bin/dry ]];then
      exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/dry-linux-amd64 https://github.com/moncho/dry/releases/download/v0.11.2/dry-linux-amd64"
      mv ${SETUP_USER_HOME}/setup/dry-linux-amd64 /usr/local/bin/dry
      chmod +x /usr/local/bin/dry
    fi
    if [[ ! -f /usr/local/bin/ctop ]];then
      exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/ctop https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64"
      mv ${SETUP_USER_HOME}/setup/ctop /usr/local/bin/ctop
      chmod +x /usr/local/bin/ctop
    fi
#    if [[ ! -f /usr/local/bin/docker-compose ]];then
#      exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/docker-compose https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-${SETUP_OS_SYSTEM,,}-${SETUP_OS_MACHINE}"
#      mv ${SETUP_USER_HOME}/setup/docker-compose /usr/local/bin/docker-compose
#      chmod +x /usr/local/bin/docker-compose
#    fi
    my_host_ip="$(get_my_ip)"
    sed -i -E "/host.docker.internal/d" /etc/hosts && \
    echo "${my_host_ip} host.docker.internal" >> /etc/hosts
    if [[ ! -d /etc/systemd/system/docker.service.d ]];then
      mkdir -p /etc/systemd/system/docker.service.d
    fi
    if [[ ! -f /etc/systemd/system/docker.service.d/override.conf ]];then
      cat >/etc/systemd/system/docker.service.d/override.conf <<EOL
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
EOL
    fi

    if [[ ! -d /etc/docker/ ]];then
      mkdir -p /etc/docker
    fi
    if [[ ! -f /etc/docker/daemon.json ]];then
      if [[ ${SERVER_REGION_CN} == "y" ]];then
        cat >/etc/docker/daemon.json <<EOL
{
  "registry-mirrors": [
  ],
  "insecure-registries": [],
  "hosts": ["unix:///var/run/docker.sock"],
  "data-root": "/var/lib/docker",
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-opts": {
    "max-file": "5",
    "max-size": "10m"
  },
  "live-restore": true,
  "experimental": true,
  "features": {
    "buildkit": true
  },
  "builder": {
    "gc": {
      "enabled": true,
      "defaultKeepStorage": "20GB"
    }
  }
}
EOL
      else
        cat >/etc/docker/daemon.json <<EOL
{
  "registry-mirrors": [
  ],
  "insecure-registries": [],
  "hosts": ["unix:///var/run/docker.sock"],
  "data-root": "/var/lib/docker",
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-opts": {
    "max-file": "5",
    "max-size": "10m"
  },
  "live-restore": true,
  "experimental": true,
  "features": {
    "buildkit": true
  },
  "builder": {
    "gc": {
      "enabled": true,
      "defaultKeepStorage": "20GB"
    }
  }
}
EOL
      fi
    fi
    getent group docker || groupadd docker
    sudo usermod -aG docker ${USER_NAME}
  fi
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    if [[ ! -f ${SETUP_USER_HOME}/setup/go${PKG_VER_go}.linux-amd64.tar.gz ]];then
      GOLANG_DL_URL="https://go.dev/dl/go${PKG_VER_go}.linux-amd64.tar.gz"
      if ! check_url_is_ok "${GOLANG_DL_URL}" ; then
        GOLANG_DL_URL="https://mirrors.ustc.edu.cn/golang/go${PKG_VER_go}.linux-amd64.tar.gz"
      fi
      exec_cmd "curl -fsSL -o ${SETUP_USER_HOME}/setup/go${PKG_VER_go}.linux-amd64.tar.gz ${GOLANG_DL_URL}"
    fi
    rm -rf /usr/local/go && tar -C /usr/local -xzf go${PKG_VER_go}.linux-amd64.tar.gz && \
echo $' \n\
export GOROOT="/usr/local/go" \n\
export PATH="$PATH:/usr/local/go/bin" \n\
' > /etc/profile.d/go
  fi
  if [[ ${INSTALL_PKG_ENABLE_PHP} -eq 1 ]];then
    mkdir -p /var/lib/php/fpmsessions
    chown -R ${USER_NAME}:${USER_NAME} /var/lib/php/fpmsessions
    pecl channel-update pecl.php.net
    cat >/etc/php/${PKG_VER_php_major}/mods-available/zzz_custom.ini <<EOL
; priority=99

expose_php = Off
date.timezone=Etc/UTC
;date.timezone=Asia/Shanghai
max_execution_time = 600
default_socket_timeout = 600
memory_limit = 512M
post_max_size = 512M
upload_max_filesize = 512M

phar.readonly=off

;cgi.fix_pathinfo=0
cgi.fix_pathinfo=0
session.save_path = "/var/lib/php/fpmsessions"
session.gc_probability = 1
EOL
    phpenmod -v ${PKG_VER_php_major} zzz_custom
    if [[ ${PKG_VER_php_major} == "7.1" ]];then
      pecl install https://pecl.php.net/get/zookeeper-0.6.4.tgz
    else
      pecl install https://pecl.php.net/get/zookeeper-0.7.2.tgz
    fi
    cat >/etc/php/${PKG_VER_php_major}/mods-available/zookeeper.ini <<EOL
; priority=25
extension=zookeeper.so
EOL
    phpenmod -v ${PKG_VER_php_major} zookeeper
    curl -sS https://getcomposer.org/installer -o composer-setup.php
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    if [[ ${SERVER_REGION_CN} == "y" ]];then
        sudo -H -u ${USER_NAME} bash -c "composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ && composer config -g process-timeout 2000"
    else
      sudo -H -u ${USER_NAME} bash -c "composer config -g process-timeout 2000"
    fi
    wget https://psysh.org/psysh
    mv psysh /usr/local/bin/
    chmod +x /usr/local/bin/psysh
  fi
  if [[ ${INSTALL_PKG_ENABLE_NGINX} -eq 1 ]];then
      git clone https://github.com/perusio/nginx_ensite.git ${SETUP_USER_HOME}/setup/nginx_ensite
      cd ${SETUP_USER_HOME}/setup/nginx_ensite && sudo make install
      mkdir -p /usr/local/tengine
      ln -s /etc/nginx /usr/local/tengine/conf
      ln -s /etc/nginx/sites-enabled /etc/nginx/vhost
      mv /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/0-default
  fi

  if [[ ${INSTALL_PKG_ENABLE_RUST} -eq 1 ]];then
      if [[ ${SERVER_REGION_CN} == "y" ]];then
#        if [[ "${USE_PROXY}" == "ok" || "${USE_PROXY}" == "y" || "${USE_PROXY}" == "Y" || "${USE_PROXY}" == "yes" || "${USE_PROXY}" == "Yes"  || "${USE_PROXY}" == "YES" ]];then
#          sudo -H -u ${SETUP_USER} bash -c "curl -x ${PROXY_URI} --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
#          if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
#              sudo -H -u ${USER_NAME} bash -c "curl -x ${PROXY_URI} --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
#          fi
#        else
          sudo -H -u ${SETUP_USER} bash -c "source ${SETUP_USER_HOME}/.myenv_mirrors_cn && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
          if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
              sudo -H -u ${USER_NAME} bash -c "source ${SETUP_USER_HOME}/.myenv_mirrors_cn && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
          fi
#        fi
        sudo -H -u ${SETUP_USER} bash -c "mkdir -p ${SETUP_USER_HOME}/.cargo"

        if [[ ! -f ${SETUP_USER_HOME}/.cargo/config_tpl_cn ]];then
          cat >${SETUP_USER_HOME}/.cargo/config_tpl_cn <<EOL
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"

# replace with your prefer mirror
replace-with = 'sjtu'
#replace-with = 'ustc'

# tsinghua
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"

# ustc
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"

# sjtug
[source.sjtu]
registry = "https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index"

# rustcc
[source.rustcc]
registry = "git://crates.rustcc.cn/crates.io-index"
EOL
          chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.cargo/config_tpl_cn
        fi
        if [[ ! -f ${SETUP_USER_HOME}/.cargo/config ]];then
          cp -af ${SETUP_USER_HOME}/.cargo/config_tpl_cn ${SETUP_USER_HOME}/.cargo/config
          chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.cargo/config
        fi
    else
      sudo -H -u ${SETUP_USER} bash -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
      if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
          sudo -H -u ${USER_NAME} bash -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
      fi
    fi

  fi
  set_resume_step "setup_package_addons" ${SETUP_USER}
}

setup_env_zsh(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_env_zsh" ${SETUP_USER};then return 0;fi

  if [[ -d ${SETUP_USER_HOME}/.oh-my-zsh && -f ${SETUP_USER_HOME}/.p10k.zsh ]];then return 0;fi
  exec_cmd "wget -O ${SETUP_USER_HOME}/.p10k.zsh https://raw.githubusercontent.com/romkatv/powerlevel10k/master/config/p10k-lean.zsh"
  chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.p10k.zsh;
  sudo -H -u ${SETUP_USER} bash -c "$(curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended
  sudo -H -u ${SETUP_USER} bash -c "git clone https://github.com/romkatv/powerlevel10k ${SETUP_USER_HOME}/.oh-my-zsh/custom/themes/powerlevel10k && \
  git clone https://github.com/zsh-users/zsh-autosuggestions ${SETUP_USER_HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-completions ${SETUP_USER_HOME}/.oh-my-zsh/custom/plugins/zsh-completions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${SETUP_USER_HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
  git clone https://github.com/zsh-users/zsh-history-substring-search ${SETUP_USER_HOME}/.oh-my-zsh/custom/plugins/zsh-history-substring-search
"

cat >${SETUP_USER_HOME}/.zshrc <<EOL
export ZSH_DISABLE_COMPFIX=true
export ZSH="${SETUP_USER_HOME}/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
HIST_STAMPS="yyyy-mm-dd"
plugins=(
tmux tmuxinator
ssh-agent z autojump history last-working-dir zsh-completions zsh-autosuggestions zsh-syntax-highlighting
catimg git golang npm node docker github httpie jsontools
composer laravel5
)
#autoload -U compinit && compinit
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false
zstyle :omz:plugins:ssh-agent agent-forwarding on
source \$ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ -f \$HOME/.myenvset ]; then source \$HOME/.myenvset;fi
export iterm2_hostname="$(hostname -f):22"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ "\$TERM" = "xterm-256color" ] && [ -z "\$INSIDE_EMACS" ]; then
  test -e "\${HOME}/.iterm2_shell_integration.zsh" && source "\${HOME}/.iterm2_shell_integration.zsh"
fi
[ -f ~/.acme.sh/acme.sh.env ] && source ~/.acme.sh/acme.sh.env

if [ -f ${SETUP_USER_HOME}/miniconda3/bin/conda ];then

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="\$('${SETUP_USER_HOME}/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "\$__conda_setup"
else
    if [ -f "${SETUP_USER_HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${SETUP_USER_HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${SETUP_USER_HOME}/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -d ${SETUP_USER_HOME}/miniconda3/envs/${CONDA_ENV_NAME} ];then
  source ${SETUP_USER_HOME}/miniconda3/bin/activate ${CONDA_ENV_NAME}
fi

fi

EOL

  if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
    cp -af ${SETUP_USER_HOME}/.oh-my-zsh ${USER_HOME}/ && \
    cp -af ${SETUP_USER_HOME}/.zshrc ${USER_HOME}/ && sed -i "s|${SETUP_USER_HOME}|${USER_HOME}|g" ${USER_HOME}/.zshrc && \
    cp -af ${SETUP_USER_HOME}/.p10k.zsh ${USER_HOME}/
  fi
  chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.oh-my-zsh && \
  chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.zshrc && \
  chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.p10k.zsh

  set_resume_step "setup_env_zsh" ${SETUP_USER}
}
setup_env_tmux(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_env_tmux" ${SETUP_USER};then return 0;fi

  if [ -d ${SETUP_USER_HOME}/.tmux ];then return 0;fi
  sudo -H -u ${SETUP_USER} bash -c "cd ${SETUP_USER_HOME} && git clone https://github.com/gpakosz/.tmux.git ${SETUP_USER_HOME}/.tmux && \
    ln -nfs -f ${SETUP_USER_HOME}/.tmux/.tmux.conf ${SETUP_USER_HOME}/.tmux.conf && \
    cp ${SETUP_USER_HOME}/.tmux/.tmux.conf.local ${SETUP_USER_HOME}/"
    sed -i -E '/^# -- clipboard/,$d' ${SETUP_USER_HOME}/.tmux.conf.local && \
    echo $' \n\
tmux_conf_copy_to_os_clipboard=true \n\
bind - splitw -v # vertical split (prefix -)  \n\
bind | splitw -h # horizontal split (prefix |)  \n\
tmux_conf_theme_24b_colour=true \n\
set -g history-limit 10000 \n\
set -g mouse on \n\
set -gu prefix2 \n\
unbind C-a \n\
unbind C-b \n\
set -g prefix C-g \n\
bind C-g send-prefix \n\
' >> ${SETUP_USER_HOME}/.tmux.conf.local
  if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
      cp -af ${SETUP_USER_HOME}/.tmux ${USER_HOME}/ && \
      cp -af ${SETUP_USER_HOME}/.tmux.conf.local ${USER_HOME}/
  fi
  chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.tmux && \
  chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.tmux.conf.local
  set_resume_step "setup_env_tmux" ${SETUP_USER}
}
setup_env_fzf(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_env_fzf" ${SETUP_USER};then return 0;fi

  if [ -d ${SETUP_USER_HOME}/.fzf ];then return 0;fi
  sudo -H -u ${SETUP_USER} bash -c "git clone --depth 1 https://github.com/junegunn/fzf.git ${SETUP_USER_HOME}/.fzf && ${SETUP_USER_HOME}/.fzf/install"
  set_resume_step "setup_env_fzf" ${SETUP_USER}
}
setup_env_fonts(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_env_fonts" ${SETUP_USER};then return 0;fi

  if [ -d ${SETUP_USER_HOME}/.local/share/fonts ];then return 0;fi
  mkdir -p ${SETUP_USER_HOME}/.local/share/fonts && chown -R ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.local/share && cd ${SETUP_USER_HOME}/.local/share/fonts;
  wget -O ${SETUP_USER_HOME}/.local/share/fonts/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && unzip ${SETUP_USER_HOME}/.local/share/fonts/Hack.zip
  wget -O ${SETUP_USER_HOME}/.local/share/fonts/Meslo.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip && unzip ${SETUP_USER_HOME}/.local/share/fonts/Meslo.zip
  chown -R ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.local/share;
  sudo -H -u ${SETUP_USER} bash -c "git clone https://github.com/powerline/fonts.git --depth=1 ${SETUP_USER_HOME}/.local/share/fonts/font_powerline && cd ${SETUP_USER_HOME}/.local/share/fonts/font_powerline && bash ${SETUP_USER_HOME}/.local/share/fonts/font_powerline/install.sh && cd ${SETUP_USER_HOME}/.local/share/fonts && fc-cache -vf"
  if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
      mkdir -p ${USER_HOME}/.local/share/fonts
      cp -af ${SETUP_USER_HOME}/.local/share/fonts ${USER_HOME}/.local/share/
      chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.local/share;
  fi
  set_resume_step "setup_env_fonts" ${SETUP_USER}
}
setup_env_conda(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_env_conda" ${SETUP_USER};then return 0;fi

  if [ -d ${SETUP_USER_HOME}/miniconda3 ];then return 0;fi
  if [[ ! -f ${SETUP_USER_HOME}/.condarc ]];then
    if [[ ${SERVER_REGION_CN} == "y" ]];then
      cat >${SETUP_USER_HOME}/.condarc <<EOL
show_channel_urls: true
auto_activate_base: false
report_errors: false
channel_alias: https://mirrors.tuna.tsinghua.edu.cn/anaconda
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/win-64/
  - http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - defaults
  - conda-forge
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
EOL

    else
      cat >${SETUP_USER_HOME}/.condarc <<EOL
show_channel_urls: true
auto_activate_base: false
report_errors: false
channels:
  - defaults
  - conda-forge
EOL
    fi
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.condarc
  fi

  if [[ ! -f ${SETUP_USER_HOME}/miniconda.sh ]];then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ${SETUP_USER_HOME}/miniconda.sh && \
    chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/miniconda.sh
  fi
  if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
      if [[ ! -f ${USER_HOME}/miniconda.sh ]];then
          cp -af ${SETUP_USER_HOME}/miniconda.sh ${USER_HOME}/miniconda.sh
          chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/miniconda.sh
      fi
  fi
  sudo -H -u ${SETUP_USER} bash ${SETUP_USER_HOME}/miniconda.sh -b -p ${SETUP_USER_HOME}/miniconda3
  sudo -H -u ${SETUP_USER} bash -c "${SETUP_USER_HOME}/miniconda3/bin/conda init zsh && \
    ${SETUP_USER_HOME}/miniconda3/bin/conda update -y -n base -c defaults conda && \
    ${SETUP_USER_HOME}/miniconda3/bin/conda create -y --name ${CONDA_ENV_NAME} python=${CONDA_ENV_PY_VER}"
  set_resume_step "setup_env_conda" ${SETUP_USER}
}
setup_env_sync_conf(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if ! check_skip_step "setup_env_sync_conf" ${SETUP_USER};then return 0;fi
  if [[ ! -f ${SETUP_USER_HOME}/.apt_proxy.conf ]];then
    if [[ -f ${SETUP_ACT_HOME}/.apt_proxy.conf ]];then
      cp -af ${SETUP_ACT_HOME}/.apt_proxy.conf ${SETUP_USER_HOME}/.apt_proxy.conf
      chown -R ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.apt_proxy.conf
    fi
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.nopx.sh ]];then
    if [[ -f ${SETUP_ACT_HOME}/.nopx.sh ]];then
      cp -af ${SETUP_ACT_HOME}/.nopx.sh ${SETUP_USER_HOME}/.nopx.sh
      chown -R ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.nopx.sh
    fi
  fi

  if [[ ! -f ${SETUP_USER_HOME}/.setpx.sh ]];then
    if [[ -f ${SETUP_ACT_HOME}/.setpx.sh ]];then
      cp -af ${SETUP_ACT_HOME}/.setpx.sh ${SETUP_USER_HOME}/.setpx.sh
      chown -R ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/.setpx.sh
    fi
  fi
  if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
    cp -af ${SETUP_USER_HOME}/.apt_proxy.conf ${USER_HOME}/.apt_proxy.conf && \
    cp -af ${SETUP_USER_HOME}/.nopx.sh ${USER_HOME}/.nopx.sh && \
    cp -af ${SETUP_USER_HOME}/.setpx.sh ${USER_HOME}/.setpx.sh

    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.apt_proxy.conf && \
    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.nopx.sh && \
    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.setpx.sh
  fi
  set_resume_step "setup_env_sync_conf" ${SETUP_USER}
}
setup() {
check_installed
print_status "Installing ..."
init_env_conf
base_env_check_setup
setup_dist_user_group
setup_system_env_files
deactivate_env_set_proxy
update_package_source
install_package_system
set_user_shell ${SETUP_ROOT}
set_user_shell ${USER_NAME}
setup_current_env_files ${SETUP_ROOT}
setup_current_env_files ${USER_NAME}
activate_env_set_proxy
setup_package_addons ${SETUP_ROOT}
setup_env_zsh ${SETUP_ROOT}
setup_env_tmux ${SETUP_ROOT}
setup_env_fonts ${SETUP_ROOT}
setup_env_fzf ${SETUP_ROOT}
setup_env_fzf ${USER_NAME}
setup_env_conda ${SETUP_ROOT}
setup_env_conda ${USER_NAME}
#done_resume_setp
setup_env_sync_conf ${SETUP_ROOT}
set_installed
print_status "Done."
}
## Defer setup until we have the complete script
setup
