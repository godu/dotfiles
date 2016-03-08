ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
DISABLE_UPDATE_PROMPT=true
export UPDATE_ZSH_DAYS=1
plugins=(atom bower brew command-not-found docker git git-extra history node npm osx redis-cli rsync sublime sudo supervisor systemd vagrant web-search xcode yum)

source $ZSH/oh-my-zsh.sh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

eval "$(docker-machine env default)"

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

# added by travis gem
[ -f /Users/godu/.travis/travis.sh ] && source /Users/godu/.travis/travis.sh
export PATH="/usr/local/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export RPROMPT='${time} %{$fg[cyan]%}$(node_prompt_info)%{$reset_color%}%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'
