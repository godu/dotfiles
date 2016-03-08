ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
DISABLE_UPDATE_PROMPT=true
export UPDATE_ZSH_DAYS=1
plugins=(autoenv autojump aws boot2docker bower branch brew brew-cask cask colored-man-pages colorize command-not-found common-aliases copydir copyfile cp debian dircycle dirhistory dirpersist dnf docker docker-compose emoji emoji-clock encode64 extract fastfile fedora frontend-search git git-extras git-flow git-flow-avh git-hubflow git-prompt git-remote-branch gitfast github gitignore grunt gulp heroku history history-substring-search marked2 node npm nvm nyan osx profiles redis-cli repo rsync screen ssh-agent sublime sudo supervisor systemadmin systemd terminalapp terminitor terraform thefuck themes torrent ubuntu urltools vagrant vault vi-mode vim-interaction web-search xcode zsh-navigation-tools zsh_reload)

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
