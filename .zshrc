ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
DISABLE_UPDATE_PROMPT=true
export UPDATE_ZSH_DAYS=1
plugins=(atom bower brew command-not-found docker history git git-extras git-flow node npm osx redis-cli rsync sublime sudo supervisor systemd vagrant web-search xcode yum)

source $ZSH/oh-my-zsh.sh

### NVM
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
