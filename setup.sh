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

INSTALL_PKG_ENABLE_ACT_USER=1
INSTALL_PKG_ENABLE_OPS=1
INSTALL_PKG_ENABLE_SRV=1
INSTALL_PKG_ENABLE_CLI=1
INSTALL_PKG_ENABLE_PYTHON=1
INSTALL_PKG_ENABLE_RUBY=1
INSTALL_PKG_ENABLE_NODEJS=1
INSTALL_PKG_ENABLE_JAVA=1
INSTALL_PKG_ENABLE_PHP=1
INSTALL_PKG_ENABLE_GOLANG=1
INSTALL_PKG_ENABLE_DOCKER=1
INSTALL_PKG_ENABLE_NGINX=1
INSTALL_PKG_ENABLE_LIBS=1

SKIP_check_installed=0
SKIP_set_installed=0
SKIP_base_env_check_setup=0
SKIP_set_user_shell=0
SKIP_setup_dist_user_group=0
SKIP_setup_system_env_files=0
SKIP_update_package_source=0
SKIP_install_package_system=0
SKIP_setup_current_env_files=0
SKIP_setup_package_addons=0
SKIP_setup_env_zsh=0
SKIP_setup_env_tmux=0
SKIP_setup_env_fzf=0
SKIP_setup_env_fonts=0
SKIP_setup_env_conda=0

INSTALL_PKGS_BASE="sudo net-tools iputils-ping iproute2 telnet curl wget httping nano procps traceroute iperf3 apt-transport-https ca-certificates lsb-release software-properties-common gnupg-agent gnupg2 pass rng-tools openssh-client ntp ntpdate language-pack-en-base language-pack-zh-hans zsh autojump fonts-powerline xfonts-75dpi xfonts-base xfonts-encodings xfonts-utils fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy locales-all"
INSTALL_PKGS_SYSTEM="build-essential gcc g++ make cmake autoconf automake patch gdb libtool cpp pkg-config libc6-dev libncurses-dev sqlite sqlite3 openssl unixodbc pkg-config re2c keyboard-configuration bzip2 unzip p7zip unrar-free git-core mercurial wget curl nano vim lsof ctags vim-doc vim-scripts ed gawk screen tmux valgrind graphviz graphviz-dev xsel xclip mc urlview tree tofrodos proxychains privoxy socat zhcon supervisor certbot lrzsz mc tig jq"

INSTALL_PKGS_SEGMENT_OPS="vim-nox neovim python-neovim python3-neovim xxd wamerican lnav htop iftop iotop nethogs dstat multitail ncdu ranger silversearcher-ag asciinema"
INSTALL_PKGS_SEGMENT_SRV="openssh-server"
INSTALL_PKGS_SEGMENT_CLI="redis-tools mysql-client zookeeper zookeeper-bin"
INSTALL_PKGS_SEGMENT_PYTHON="python python-dev python-pip python-setuptools python-lxml python3 python3-dev python3-pip python3-setuptools python3-venv python3-lxml"
INSTALL_PKGS_SEGMENT_RUBY="ruby ruby-dev"
INSTALL_PKGS_SEGMENT_NODEJS="nodejs yarn"
INSTALL_PKGS_SEGMENT_JAVA="openjdk-8-jdk maven"
INSTALL_PKGS_SEGMENT_PHP=""
INSTALL_PKGS_SEGMENT_DOCKER="docker-ce docker-ce-cli containerd.io"
INSTALL_PKGS_SEGMENT_NGINX="nginx-extras"
INSTALL_PKGS_SEGMENT_LIBS="libxml2-dev libbz2-dev libexpat1-dev libssl-dev libffi-dev libsecret-1-dev libgconf2-4 libdb-dev libgmp3-dev zlib1g-dev linux-libc-dev libgudev-1.0-dev uuid-dev libpng-dev libjpeg-dev libfreetype6-dev libxslt1-dev libssh-dev libssh2-1-dev libpcre3-dev libpcre++-dev libmhash-dev libmcrypt-dev libltdl7-dev mcrypt libiconv-hook-dev libsqlite-dev libgettextpo0 libwrap0-dev libreadline-dev libzookeeper-mt-dev libnghttp2-dev"
SETUP_PKG_SEGMENT_GOLANG_PATH="/usr/local/go/bin"

PKG_VER_wkhtmltox="0.12.6-1"
PKG_VER_fd="8.2.1"
PKG_VER_ripgrep="12.1.1"
PKG_VER_bat="0.17.1"
PKG_VER_go="1.17"
PKG_VER_php_major="7.4"
PKG_VER_node_major="12"
PKG_VER_zsh_in_docker="1.1.1"

CHECK_PROXY_URL="https://www.google.com/"

SETUP_ACT_HOME=${HOME}
SETUP_ROOT_HOME="/root"
SETUP_USER="root"
SETUP_ROOT="root"
SETUP_USER_HOME=${SETUP_ACT_HOME}
SETUP_USER_HOME_DEFAULT=${SETUP_ACT_HOME}

init_env_conf(){
  SERVER_REGION_CN_DEFAULT="auto"
  USE_PROXY_DEFAULT="auto"
  PROXY_URI_DEFAULT="http://127.0.0.1:1884"
  NO_PROXY_LIST_DEFAULT="localhost,.example.com,169.254.169.254,128.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24"
  USER_NAME_DEFAULT="www"
  USER_PASSWORD_DEFAULT="abc123"
  CONDA_ENV_NAME_DEFAULT="myenv"
  CONDA_ENV_PY_VER_DEFAULT="3.7"
  TZ_DEFAULT="etc/UTC"
  TERM_DEFAULT="xterm-256color"
  ZSH_THEME_DEFAULT="powerlevel10k"

  SERVER_REGION_CN=${SERVER_REGION_CN_DEFAULT}
  USE_PROXY=${USE_PROXY_DEFAULT}
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
    SERVER_REGION_CODE=$(curl -fsSL https://ipapi.co/country_code)
    if [ ${SERVER_REGION_CODE} == "CN" ] || [ ${SERVER_REGION_CODE} == "cn" ];then
      SERVER_REGION_CN="y"
    else
      SERVER_REGION_CN="n"
    fi
  fi
  if [ ${USE_PROXY} == "auto" ];then
    echo "detecting if need use proxy..."
    if ! check_url_is_ok "${CHECK_PROXY_URL}" ; then
      echo "checking if proxy connection ok..."
      if ! check_proxy_is_ok "${PROXY_URI}" ; then
        echo "proxy connection invalid.";
        USE_PROXY="n"
      else
        USE_PROXY="y"
      fi
    fi
  fi

  echo "======================"
  echo "ACT_USER: [${ACT_USER}]"
  echo "ACT_GROUP: [${ACT_GROUP}]"
  echo "SETUP_USER: [${SETUP_USER}]"
  echo "SETUP_USER: [${SETUP_USER}]"
  echo "SERVER_REGION_CN: [${SERVER_REGION_CN}] "
  echo "USE_PROXY: [${USE_PROXY}] "
  echo "PROXY_URI: [${PROXY_URI}] "
  echo "USER_NAME: [${USER_NAME}] "
  echo "USER_PASSWORD: [${USER_PASSWORD}] "
  echo "CONDA_ENV_NAME: [${CONDA_ENV_NAME}] "
  echo "CONDA_ENV_PY_VER: [${CONDA_ENV_PY_VER}] "
  echo "TZ: [${TZ}] "
  echo "TERM: [${TERM}] "
  echo "ZSH_THEME: [${ZSH_THEME}] "
  setup_env_set_proxy
}

ACT_USER=${SUDO_USER:-$(whoami)}
ACT_GROUP=$(id -gn ${ACT_USER})
SETUP_USER=${ACT_USER}
if [ -z ${SCRIPT_NONINTERACTIVE} ];then
  SCRIPT_NONINTERACTIVE=1
  SCRIPT_INTERACTIVE_CONFIRM="y"
  if [[ $- == *i* ]];then
    SCRIPT_NONINTERACTIVE=1
  else
    if [ -z "$PS1" ]; then
      read -e -p "Proceed? [y/n] " -i ${SCRIPT_INTERACTIVE_CONFIRM} SCRIPT_INTERACTIVE_CONFIRM
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
setup_env_set_proxy(){
  cat >${SETUP_ACT_HOME}/.nopx.sh <<EOL
#!/usr/bin/env bash
unset http_proxy
unset https_proxy
unset ftp_proxy
unset all_proxy
EOL
  if [ ! -z ${PROXY_URI} ];then
    echo 'Acquire::http::Proxy "${PROXY_URI}";' >${SETUP_ACT_HOME}/.apt_proxy.conf
    cat >${SETUP_ACT_HOME}/.setpx.sh <<EOL
#!/usr/bin/env bash
export https_proxy="${PROXY_URI}";
export http_proxy="${PROXY_URI}";
export all_proxy="${PROXY_URI}";
export no_proxy="${NO_PROXY_LIST}"
EOL
  else
    touch ${SETUP_ACT_HOME}/.apt_proxy.conf
    cat >${SETUP_ACT_HOME}/.setpx.sh <<EOL
#!/usr/bin/env bash
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
  if [[ "${USE_PROXY}" == "ok" || "${USE_PROXY}" == "y" || "${USE_PROXY}" == "Y" || "${USE_PROXY}" == "yes" || "${USE_PROXY}" == "Yes"  || "${USE_PROXY}" == "YES" ]];then
    if [ -f "${SETUP_ACT_HOME}/.setpx.sh" ];then
      source ${SETUP_ACT_HOME}/.setpx.sh;
      echo "now active proxy settings";
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
  status_code=$(curl --connect-timeout ${3:-7} --max-time ${4:-7} -x ${1:-${PROXY_URI}} -s -o /dev/null -w "%{http_code}" ${2:-${CHECK_PROXY_URL}})
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
  if [[ ${SKIP_check_installed} -eq 1 ]];then echo "[SKIP] check_installed";return 0;fi
  echo "STEP check_installed"
  if [ -f "${SETUP_ACT_HOME}/.ome.installed" ];then
    print_bold "Already installed now exit."
    exit 1;
  fi
}
set_installed(){
  if [[ ${SKIP_set_installed} -eq 1 ]];then echo "[SKIP] check_installed";return 0;fi
  echo "`date -u +'%Y-%m-%d %H:%M:%S %Z'`" > "${HOME}/.ome.installed";
}

check_root(){
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root";
    exit 1;
  fi
}

base_env_check_setup(){
  if [[ ${SKIP_base_env_check_setup} -eq 1 ]];then echo "[SKIP] base_env_check_setup";return 0;fi
  echo "STEP base_env_check_setup"

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

}

set_user_shell(){
  if [[ ${SKIP_set_user_shell} -eq 1 ]];then echo "[SKIP] set_user_shell";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP set_user_shell : ${SETUP_USER}"
  chsh -s /bin/zsh ${SETUP_USER}
}

setup_dist_user_group(){
  if [[ ${SKIP_setup_dist_user_group} -eq 1 ]];then echo "[SKIP] setup_dist_user_group";return 0;fi
  echo "STEP setup_dist_user_group"
  getent group ${USER_NAME} || groupadd ${USER_NAME}
  if id "${USER_NAME}" &>/dev/null; then
      echo 'user already exists'
  else
    adduser --quiet --disabled-password --shell /bin/zsh --ingroup ${USER_NAME} --home ${USER_HOME} --gecos "User" ${USER_NAME}
    echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo ${USER_NAME} && usermod -aG adm ${USER_NAME} && usermod -aG www-data ${USER_NAME}
  fi
}
setup_system_env_files(){
  if [[ ${SKIP_setup_system_env_files} -eq 1 ]];then echo "[SKIP] setup_system_env_files";return 0;fi
  echo "STEP setup_system_env_files"
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  if [[ ${INSTALL_PKG_ENABLE_JAVA} -eq 1 ]];then
    sed -i -E "/JAVA_HOME=/d" /etc/environment && \
    echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment
  fi
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    sed -i -E "/GOROOT=/d" /etc/environment && \
    echo 'GOROOT="/usr/local/go"' >> /etc/environment
  fi
  mkdir -p /data/{app/{backup,etc,tmp,certs,www,ops,downloads/temp},var/{log/app,run,tmp}} && \
    ln -nfs /data/var /data/app/var && \
    chown -R ${USER_NAME}:${USER_NAME} /data/app && \
    chown -R ${USER_NAME}:${USER_NAME} /data/var && \
    ln -nfs /data/app /data/wwwroot && \
    ln -nfs /data/var/log /data/wwwlogs && \
    ln -nfs /data/app /home/wwwroot && \
    ln -nfs /data/var/log /home/wwwlogs && \
    ln -nfs /home /Users
    if [[ "${USER_NAME}" != "user" && "${USER_NAME}" != "root" ]];then
      ln -nfs ${USER_HOME} /home/user
    fi
}
update_package_source(){
  if [[ ${SKIP_update_package_source} -eq 1 ]];then echo "[SKIP] update_package_source";return 0;fi
  echo "STEP update_package_source"
  if [[ ${INSTALL_PKG_ENABLE_OPS} -eq 1 ]];then
    add-apt-repository -y -n ppa:neovim-ppa/stable
  fi
  if [[ ${INSTALL_PKG_ENABLE_DOCKER} -eq 1 ]];then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    if [[ ${SERVER_REGION_CN} == "y" ]];then
      add-apt-repository -y -n "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
    else
      add-apt-repository -y -n "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    fi
  fi
  if [[ ${INSTALL_PKG_ENABLE_PHP} -eq 1 ]];then
    add-apt-repository -y -n ppa:ondrej/php
  fi
  if [[ ${INSTALL_PKG_ENABLE_NGINX} -eq 1 ]];then
    add-apt-repository -y -n ppa:nginx/stable
  fi
  if [[ ${INSTALL_PKG_ENABLE_NODEJS} -eq 1 ]];then
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    curl -fsSL https://deb.nodesource.com/setup_${PKG_VER_node_major}.x | bash -
  else
    exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf update"
  fi
}
install_package_system(){
  if [[ ${SKIP_install_package_system} -eq 1 ]];then echo "[SKIP] install_package_system";return 0;fi
  echo "STEP install_package_system"
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
    INSTALL_PKGS_SETUP="${INSTALL_PKGS_SETUP} ${INSTALL_PKGS_SEGMENT_LIBS}"
  fi
  exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf install -y --no-install-recommends ${INSTALL_PKGS_SETUP}"
}
setup_current_env_files(){
  if [[ ${SKIP_setup_current_env_files} -eq 1 ]];then echo "[SKIP] setup_current_env_files";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP setup_current_env_files : ${SETUP_USER}"
  ADDON_PATH_SEG=""
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    ADDON_PATH_SEG="${ADDON_PATH_SEG}:${SETUP_PKG_SEGMENT_GOLANG_PATH}"
  fi
  sed -i -E "/\.myenvset/d" ${SETUP_USER_HOME}/.profile && \
  echo "export PATH=\$HOME/.local/bin:\$HOME/bin:\$PATH${ADDON_PATH_SEG}" >> ${SETUP_USER_HOME}/.profile && \
  echo "if [ -f \$HOME/.myenvset ]; then source \$HOME/.myenvset;fi" >> ${SETUP_USER_HOME}/.profile

  mkdir -p ${SETUP_USER_HOME}/{bin,tmp,setup,opt,var/{log,tmp,run}} && \
  mkdir -p ${SETUP_USER_HOME}/{.ssh/{config.d,ctrl.d},.local/bin,.config,.cache,.aria2} && \
  mkdir -p ${SETUP_USER_HOME}/Downloads/temp
  if [[ ! -d ${SETUP_USER_HOME}/Code ]];then
      ln -nfs /data/app ${SETUP_USER_HOME}/Code
  fi
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    mkdir -p ${SETUP_USER_HOME}/go/{src,bin,pkg}
  fi
  if [[ ${INSTALL_PKG_ENABLE_NODEJS} -eq 1 ]];then
    mkdir -p ${SETUP_USER_HOME}/{.yarn,.npm,.node-gyp}
  fi
  if [[ ${INSTALL_PKG_ENABLE_JAVA} -eq 1 ]];then
    mkdir -p ${SETUP_USER_HOME}/.m2
  fi
  if [[ ${INSTALL_PKG_ENABLE_PHP} -eq 1 ]];then
    mkdir -p ${SETUP_USER_HOME}/.composer
  fi
}
setup_package_addons(){
  if [[ ${SKIP_setup_package_addons} -eq 1 ]];then echo "[SKIP] setup_package_addons";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP setup_package_addons : ${SETUP_USER}"
  mkdir -p ${SETUP_USER_HOME}/setup && chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/setup && cd ${SETUP_USER_HOME}/setup
  exec_cmd "wget https://github.com/wkhtmltopdf/packaging/releases/download/${PKG_VER_wkhtmltox}/wkhtmltox_${PKG_VER_wkhtmltox}.bionic_amd64.deb"
  dpkg -i -E wkhtmltox_${PKG_VER_wkhtmltox}.bionic_amd64.deb
  if [[ ${INSTALL_PKG_ENABLE_OPS} -eq 1 ]];then
    exec_cmd "wget https://github.com/sharkdp/fd/releases/download/v${PKG_VER_fd}/fd_${PKG_VER_fd}_amd64.deb"
    dpkg -i -E fd_${PKG_VER_fd}_amd64.deb
    exec_cmd "wget https://github.com/BurntSushi/ripgrep/releases/download/${PKG_VER_ripgrep}/ripgrep_${PKG_VER_ripgrep}_amd64.deb"
    dpkg -i -E ripgrep_${PKG_VER_ripgrep}_amd64.deb
    exec_cmd "wget https://github.com/sharkdp/bat/releases/download/v${PKG_VER_bat}/bat_${PKG_VER_bat}_amd64.deb"
    dpkg -i bat_${PKG_VER_bat}_amd64.deb
  fi
  if [[ ${INSTALL_PKG_ENABLE_DOCKER} -eq 1 ]];then
    exec_cmd "curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash"
    exec_cmd "wget -O ${SETUP_USER_HOME}/setup/dry-linux-amd64 https://github.com/moncho/dry/releases/download/v0.10-beta.1/dry-linux-amd64"
    mv ${SETUP_USER_HOME}/setup/dry-linux-amd64 /usr/local/bin/dry
    chmod +x /usr/local/bin/dry
    exec_cmd "wget -O ${SETUP_USER_HOME}/setup/ctop https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64"
    mv ${SETUP_USER_HOME}/setup/ctop /usr/local/bin/ctop
    chmod +x /usr/local/bin/ctop
    exec_cmd "wget -O ${SETUP_USER_HOME}/setup/docker-compose https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"
    mv ${SETUP_USER_HOME}/setup/docker-compose /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    my_host_ip="$(get_my_ip)"
    sed -i -E "/host.docker.internal/d" /etc/hosts && \
    echo "${my_host_ip} host.docker.internal" >> /etc/hosts
  fi
  if [[ ${INSTALL_PKG_ENABLE_GOLANG} -eq 1 ]];then
    GOLANG_DL_URL="https://golang.org/dl/go${PKG_VER_go}.linux-amd64.tar.gz"
    if ! check_url_is_ok "${GOLANG_DL_URL}" ; then
        GOLANG_DL_URL="https://golang.google.cn/dl/go${PKG_VER_go}.linux-amd64.tar.gz"
    fi
    exec_cmd "wget ${GOLANG_DL_URL}"
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
}

setup_env_zsh(){
  if [[ ${SKIP_setup_env_zsh} -eq 1 ]];then echo "[SKIP] setup_env_zsh";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP setup_env_zsh : ${SETUP_USER}"
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
      cp -af ${SETUP_USER_HOME}/.zshrc ${USER_HOME}/ && sed -i "s/${SETUP_USER_HOME}/${USER_HOME}/g" ${USER_HOME}/.zshrc && \
      cp -af ${SETUP_USER_HOME}/.p10k.zsh ${USER_HOME}/
    fi
    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.oh-my-zsh && \
    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.zshrc && \
    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.p10k.zsh
}
setup_env_tmux(){
  if [[ ${SKIP_setup_env_tmux} -eq 1 ]];then echo "[SKIP] setup_env_tmux";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP setup_env_tmux : ${SETUP_USER}"
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
}
setup_env_fzf(){
  if [[ ${SKIP_setup_env_fzf} -eq 1 ]];then echo "[SKIP] setup_env_fzf";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP setup_env_fzf : ${SETUP_USER}"
  if [ -d ${SETUP_USER_HOME}/.fzf ];then return 0;fi
  sudo -H -u ${SETUP_USER} bash -c "git clone --depth 1 https://github.com/junegunn/fzf.git ${SETUP_USER_HOME}/.fzf && ${SETUP_USER_HOME}/.fzf/install"
}
setup_env_fonts(){
  if [[ ${SKIP_setup_env_fonts} -eq 1 ]];then echo "[SKIP] setup_env_fonts";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP setup_env_fonts : ${SETUP_USER}"
  if [ -d ${SETUP_USER_HOME}/.local/share/fonts ];then return 0;fi
  mkdir -p ${SETUP_USER_HOME}/setup && chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/setup && cd ${SETUP_USER_HOME}/setup
  sudo -H -u ${SETUP_USER} bash -c "git clone https://github.com/powerline/fonts.git --depth=1 ${SETUP_USER_HOME}/setup/font_powerline && \
  mkdir -p ${SETUP_USER_HOME}/.local/share/fonts && cd ${SETUP_USER_HOME}/setup/font_powerline && bash ${SETUP_USER_HOME}/setup/font_powerline/install.sh && \
  cd ${SETUP_USER_HOME}/.local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && unzip Hack.zip && \
  cd ${SETUP_USER_HOME}/.local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip && unzip Meslo.zip && \
  fc-cache -vf"
  if [[ "${USER_NAME}" != "${SETUP_USER}" ]];then
      mkdir -p ${USER_HOME}/setup && chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/setup/
      mkdir -p ${USER_HOME}/.local/share/fonts
      cp -af ${SETUP_USER_HOME}/setup/font_powerline ${USER_HOME}/setup/ && \
      cp -af ${SETUP_USER_HOME}/.local/share/fonts ${USER_HOME}/.local/share/
  fi
  chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/setup/font_powerline && \
  chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.local
}
setup_env_conda(){
  if [[ ${SKIP_setup_env_conda} -eq 1 ]];then echo "[SKIP] setup_env_conda";return 0;fi
  check_set_setup_user ${1:-${SETUP_USER}}
  echo "STEP setup_env_conda : ${SETUP_USER}"
  if [ -d ${SETUP_USER_HOME}/miniconda3 ];then return 0;fi
  mkdir -p ${SETUP_USER_HOME}/setup && chown ${SETUP_USER}:${SETUP_USER} ${SETUP_USER_HOME}/setup && cd ${SETUP_USER_HOME}/setup
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
  bash ${SETUP_USER_HOME}/miniconda.sh -b -p ${SETUP_USER_HOME}/miniconda3

  if [[ ${SERVER_REGION_CN} == "y" ]];then
    cat >${SETUP_USER_HOME}/.condarc <<EOL
show_channel_urls: true
auto_activate_base: true
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
auto_activate_base: true
report_errors: false
channels:
  - defaults
  - conda-forge
EOL
  fi
}
setup() {
check_installed
check_root
print_status "Installing ..."
init_env_conf
base_env_check_setup
setup_dist_user_group
setup_system_env_files
update_package_source
install_package_system
set_user_shell ${SETUP_ROOT}
set_user_shell ${USER_NAME}
setup_package_addons ${SETUP_ROOT}
setup_current_env_files ${SETUP_ROOT}
setup_current_env_files ${USER_NAME}
setup_env_zsh ${SETUP_ROOT}
setup_env_tmux ${SETUP_ROOT}
setup_env_fonts ${SETUP_ROOT}
setup_env_fzf ${SETUP_ROOT}
setup_env_fzf ${USER_NAME}
setup_env_conda ${SETUP_ROOT}
setup_env_conda ${USER_NAME}
set_installed
print_status "Done."
}
## Defer setup until we have the complete script
setup
