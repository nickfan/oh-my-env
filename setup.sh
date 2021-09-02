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


INSTALL_PKG_BASE="sudo net-tools iputils-ping iproute2 telnet curl wget httping nano procps traceroute iperf3 gnupg-agent apt-transport-https ca-certificates software-properties-common openssh-client openssh-server ntp ntpdate language-pack-en-base language-pack-zh-hans \
zsh autojump fonts-powerline xfonts-75dpi xfonts-base xfonts-encodings xfonts-utils fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy"
INSTALL_PKG_SYSTEM="redis-tools mysql-client nodejs yarn vim-nox neovim python-neovim python3-neovim xxd wamerican \
build-essential gcc g++ make cmake autoconf automake patch gdb libtool cpp pkg-config libc6-dev libncurses-dev sqlite sqlite3 openssl unixodbc pkg-config re2c keyboard-configuration bzip2 unzip p7zip unrar-free git-core mercurial wget curl nano vim lsof ctags vim-doc vim-scripts ed gawk screen tmux valgrind graphviz graphviz-dev xsel xclip mc urlview tree tofrodos proxychains privoxy socat zhcon supervisor certbot lrzsz mc htop iftop iotop nethogs dstat multitail tig jq ncdu ranger silversearcher-ag asciinema software-properties-common libxml2-dev libbz2-dev libexpat1-dev libssl-dev libffi-dev libsecret-1-dev libgconf2-4 libdb-dev libgmp3-dev zlib1g-dev linux-libc-dev libgudev-1.0-dev uuid-dev libpng-dev libjpeg-dev libfreetype6-dev libxslt1-dev libssh-dev libssh2-1-dev libpcre3-dev libpcre++-dev libmhash-dev libmcrypt-dev libltdl7-dev mcrypt libiconv-hook-dev libsqlite-dev libgettextpo0 libwrap0-dev libreadline-dev zookeeper zookeeper-bin libzookeeper-mt-dev gnupg2 pass rng-tools software-properties-common ruby ruby-dev python python-dev python-pip python-setuptools python-lxml python3 python3-dev python3-pip python3-setuptools python3-venv python3-lxml openjdk-8-jdk maven"
PKG_VER_wkhtmltox="0.12.6-1"
PKG_VER_fd="8.2.1"
PKG_VER_ripgrep="12.1.1"
PKG_VER_bat="0.17.1"
PKG_VER_go="1.17"
PKG_VER_node_major="12"
PKG_VER_zsh_in_docker="1.1.1"

SETUP_ACT_HOME=${HOME}
SETUP_ROOT_HOME="/root"
SETUP_USER="root"
SETUP_ROOT="root"
SETUP_USER_HOME=${SETUP_ACT_HOME}
SETUP_USER_HOME_DEFAULT=${SETUP_ACT_HOME}

init_env_conf(){
  SERVER_REGION_CN_DEFAULT="auto"
  USE_PROXY_DEFAULT="no"
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
NO_PROXY_LIST=${NO_PROXY_LIST_DEFAULT}
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
    read -e -p "SERVER_REGION_CN: [${SERVER_REGION_CN}] " SERVER_REGION_CN
    read -e -p "USE_PROXY: [${USE_PROXY}] " USE_PROXY
    read -e -p "PROXY_URI: [${PROXY_URI}] " PROXY_URI
    read -e -p "USER_NAME: [${USER_NAME}] " USER_NAME
    read -e -p "USER_PASSWORD: [${USER_PASSWORD}] " USER_PASSWORD
    read -e -p "CONDA_ENV_NAME: [${CONDA_ENV_NAME}] " CONDA_ENV_NAME
    read -e -p "CONDA_ENV_PY_VER: [${CONDA_ENV_PY_VER}] " CONDA_ENV_PY_VER
    read -e -p "TZ: [${TZ}] " TZ
    read -e -p "TERM: [${TERM}] " TERM
    read -e -p "ZSH_THEME: [${ZSH_THEME}] " ZSH_THEME
  else
    DEBIAN_FRONTEND=noninteractive
  fi
  SETUP_USER=${USER_NAME}
  SETUP_USER_HOME="/home/${USER_NAME}"
  SETUP_USER_HOME_DEFAULT="/home/${USER_NAME}"
  echo "USER_NAME: [${USER_NAME}] "
  echo "USER_PASSWORD: [${USER_PASSWORD}] "
  echo "CONDA_ENV_NAME: [${CONDA_ENV_NAME}] "
  echo "CONDA_ENV_PY_VER: [${CONDA_ENV_PY_VER}] "
  echo "TZ: [${TZ}] "
  echo "TERM: [${TERM}] "
  echo "ZSH_THEME: [${ZSH_THEME}] "
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
  if [[ "${USE_PROXY}" == "y" || "${USE_PROXY}" == "Y" || "${USE_PROXY}" == "yes" || "${USE_PROXY}" == "Yes"  || "${USE_PROXY}" == "YES" ]];then
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
  else
    cat >${SETUP_ACT_HOME}/.setpx.sh <<EOL
#!/usr/bin/env bash
export https_proxy=
export http_proxy=
export all_proxy=
export no_proxy=
EOL
    touch ${SETUP_ACT_HOME}/.apt_proxy.conf
  fi
  chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.apt_proxy.conf;
  chmod +x ${SETUP_ACT_HOME}/.setpx.sh;
  chmod +x ${SETUP_ACT_HOME}/.nopx.sh;
  chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.setpx.sh;
  chown ${ACT_USER}:${ACT_GROUP} ${SETUP_ACT_HOME}/.nopx.sh;

  if [[ "${USE_PROXY}" == "y" || "${USE_PROXY}" == "Y" || "${USE_PROXY}" == "yes" || "${USE_PROXY}" == "Yes"  || "${USE_PROXY}" == "YES" ]];then
    source ${SETUP_ACT_HOME}/.setpx.sh;
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
  if [ -f "${SETUP_ACT_HOME}/.ome.installed" ];then
    print_bold "Already installed now exit."
    exit 1;
  fi
}
set_installed(){
  echo "`date -u +'%Y-%m-%d %H:%M:%S %Z'`" > "${HOME}/.ome.installed";
}

check_root(){
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root";
    exit 1;
  fi
}
check_url_is_ok(){
  status_code=$(curl --connect-timeout 15 --max-time 20 -s -o /dev/null -w "%{http_code}" ${1})
  if [ "${status_code}" = "000" ]; then
    # 1 = false
    return 1
  else
    # 0 = true
    return 0
  fi
}
base_env_check_setup(){

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
exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf update"

if [ "X${PRE_INSTALL_PKGS}" != "X" ]; then
    print_status "Installing packages required for setup:${PRE_INSTALL_PKGS}..."
    # This next command needs to be redirected to /dev/null or the script will bork
    # in some environments
    exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf install -y ${PRE_INSTALL_PKGS} > /dev/null 2>&1"
fi

IS_PRERELEASE=$(lsb_release -d | grep 'Ubuntu .*development' >& /dev/null; echo $?)
if [[ $IS_PRERELEASE -eq 0 ]]; then
    print_status "Your distribution, identified as \"$(lsb_release -d -s)\", is a pre-release version of Ubuntu. EnvSetup does not maintain official support for Ubuntu versions until they are formally released."
    exit 1
fi

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

install_package_base(){
  exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf install -y --no-install-recommends ${INSTALL_PKG_BASE}"
}

setup_system_env_conf(){
    echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment && \
    echo 'GOROOT="/usr/local/go"' >> /etc/environment && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
}
setup_system_env_files(){
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
      ln -nfs /home/${USER_NAME} /home/user
    fi
}
setup_user_root_profile(){
    sed -i -E "/\.myenvset/d" ${SETUP_ROOT_HOME}/.profile && \
    echo "export PATH=\$HOME/.local/bin:\$HOME/bin:\$PATH:/usr/local/go/bin" >> ${SETUP_ROOT_HOME}/.profile && \
    echo "if [ -f \$HOME/.myenvset ]; then source \$HOME/.myenvset;fi" >> ${SETUP_ROOT_HOME}/.profile
}
update_package_source(){
  curl -fsSL https://deb.nodesource.com/setup_${PKG_VER_node_major}.x | bash -
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
  echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  add-apt-repository -y ppa:neovim-ppa/stable
  exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf update"
}
install_package_system(){
  exec_cmd "apt-get -c ${SETUP_ACT_HOME}/.apt_proxy.conf install -y --no-install-recommends ${INSTALL_PKG_SYSTEM}"
}
setup_current_env_files(){
  check_set_setup_user ${1:-${SETUP_USER}}
  mkdir -p ${SETUP_USER_HOME}/{bin,tmp,setup,opt,go/{src,bin,pkg},var/{log,tmp,run}} && \
  mkdir -p ${SETUP_USER_HOME}/{.ssh/{config.d,ctrl.d},.local/bin,.config,.cache,.m2,.yarn,.npm,.node-gyp,.composer,.aria2} && \
  mkdir -p ${SETUP_USER_HOME}/Downloads/temp && \
  ln -nfs /data/app ~/Code
}
setup_package_addons(){
  check_set_setup_user ${1:-${SETUP_USER}}
  mkdir -p ${SETUP_USER_HOME}/setup && cd ${SETUP_USER_HOME}/setup
  exec_cmd "wget https://github.com/wkhtmltopdf/packaging/releases/download/${PKG_VER_wkhtmltox}/wkhtmltox_${PKG_VER_wkhtmltox}.bionic_amd64.deb"
  dpkg -i -E wkhtmltox_${PKG_VER_wkhtmltox}.bionic_amd64.deb
  exec_cmd "wget https://github.com/sharkdp/fd/releases/download/v${PKG_VER_fd}/fd_${PKG_VER_fd}_amd64.deb"
  dpkg -i -E fd_${PKG_VER_fd}_amd64.deb
  exec_cmd "wget https://github.com/BurntSushi/ripgrep/releases/download/${PKG_VER_ripgrep}/ripgrep_${PKG_VER_ripgrep}_amd64.deb"
  dpkg -i -E ripgrep_${PKG_VER_ripgrep}_amd64.deb
  exec_cmd "wget https://github.com/sharkdp/bat/releases/download/v${PKG_VER_bat}/bat_${PKG_VER_bat}_amd64.deb"
  dpkg -i bat_${PKG_VER_bat}_amd64.deb
}
setup_lang_go(){
    GOLANG_DL_URL="https://golang.org/dl/go${PKG_VER_go}.linux-amd64.tar.gz"
    if [ ! check_url_is_ok "${GOLANG_DL_URL}" ];then
        GOLANG_DL_URL="https://studygolang.com/dl/golang/go${PKG_VER_go}.linux-amd64.tar.gz"
    fi
    exec_cmd "wget ${GOLANG_DL_URL}"
    rm -rf /usr/local/go && tar -C /usr/local -xzf go${PKG_VER_go}.linux-amd64.tar.gz && \
echo $' \n\
export GOROOT="/usr/local/go" \n\
export PATH="$PATH:/usr/local/go/bin" \n\
' > /etc/profile.d/go
}

setup_env_zsh(){
  check_set_setup_user ${1:-${SETUP_USER}}
  exec_cmd "wget -O ${SETUP_USER_HOME}/.p10k.zsh https://raw.githubusercontent.com/romkatv/powerlevel10k/master/config/p10k-lean.zsh"
  sudo -H -u ${SETUP_USER} bash -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v${PKG_VER_zsh_in_docker}/zsh-in-docker.sh)" -- \
    -t powerlevel10k/powerlevel10k \
    -p git \
    -p ssh-agent \
    -p z \
    -p autojump \
    -p history \
    -p last-working-dir \
    -p docker \
    -p github \
    -p jsontools \
    -p node \
    -p npm \
    -p golang \
    -p tmux \
    -p tmuxinator \
    -p catimg \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -a 'export ZSH_DISABLE_COMPFIX=true' \
    -a 'HIST_STAMPS="yyyy-mm-dd"' \
    -a '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' \
    -a 'export ZSH_TMUX_AUTOSTART=false' \
    -a 'export ZSH_TMUX_AUTOCONNECT=false' \
    -a 'zstyle :omz:plugins:ssh-agent agent-forwarding on' \
    -a 'if [ -f $HOME/.myenvset ]; then source $HOME/.myenvset;fi' \
    -a 'export PATH=$HOME/.local/bin:$HOME/bin:$PATH:/usr/local/go/bin' \
    -a '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh' \
    -a 'if [ "$TERM" = "xterm-256color" ] && [ -z "$INSIDE_EMACS" ]; then test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh";fi'
    sed -i -E "/POWERLEVEL9K_/d" ${SETUP_USER_HOME}/.zshrc && \
    cp -af ${SETUP_USER_HOME}/.oh-my-zsh /home/${USER_NAME}/ && \
    cp -af ${SETUP_USER_HOME}/.zshrc /home/${USER_NAME}/ && sed -i 's/root/home\/${USER_NAME}/g' /home/${USER_NAME}/.zshrc && \
    cp -af ${SETUP_USER_HOME}/.p10k.zsh /home/${USER_NAME}/ && \
    chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.oh-my-zsh && \
    chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.zshrc && \
    chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.p10k.zsh
}
setup_env_tmux(){
  check_set_setup_user ${1:-${SETUP_USER}}
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
  cp -af ${SETUP_USER_HOME}/.tmux.conf.local /home/${USER_NAME}/ && chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.tmux.conf.local
}
setup_env_fzf(){
  check_set_setup_user ${1:-${SETUP_USER}}
  if [ ! -d ${SETUP_USER_HOME}/.fzf ];then
    sudo -H -u ${SETUP_USER} bash -c "git clone --depth 1 https://github.com/junegunn/fzf.git ${SETUP_USER_HOME}/.fzf && ${SETUP_USER_HOME}/.fzf/install"
  fi
}

setup() {
check_installed
check_root
print_status "Installing ..."
init_env_conf
base_env_check_setup
setup_dist_user_group
install_package_base
setup_system_env_conf
setup_system_env_files
setup_user_root_profile
update_package_source
install_package_system
check_set_setup_user ${SETUP_ROOT}
setup_current_env_files ${SETUP_ROOT}
setup_package_addons ${SETUP_ROOT}
setup_lang_go
setup_env_zsh ${SETUP_ROOT}
setup_env_tmux ${SETUP_ROOT}
setup_env_fzf ${SETUP_ROOT}
set_installed
print_status "Done."
}
## Defer setup until we have the complete script
setup
