ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
DISABLE_UPDATE_PROMPT=true
export UPDATE_ZSH_DAYS=1
plugins=(atom bower brew command-not-found docker history git git-extras git-flow node npm osx redis-cli rsync sublime sudo supervisor systemd vagrant web-search xcode yum)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH:/usr/lib64/qt-3.3/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/godu/.local/bin:/home/godu/bin

export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig
