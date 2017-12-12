ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
DISABLE_UPDATE_PROMPT=true
export UPDATE_ZSH_DAYS=7
plugins=(aws brew brew-cask docker git git-extra history node npm osx redis-cli sudo heroku nyan ssh-agent zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
      nvm reinstall-packages default
      nvm alias default $(nvm version)
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

load-nvmrc

function node_prompt_info() {
  local node_prompt
  node_prompt=$(node -v 2>/dev/null)
  [[ "${node_prompt}x" == "x" ]] && return
  node_prompt=${node_prompt:1}
  echo "${ZSH_THEME_NVM_PROMPT_PREFIX}${node_prompt}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
}

# added by travis gem
[ -f /Users/godu/.travis/travis.sh ] && source /Users/godu/.travis/travis.sh
export PATH="/usr/local/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export RPROMPT='${time} %{$fg[cyan]%}$(node_prompt_info)%{$reset_color%}%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'
# . `brew --prefix`/etc/profile.d/z.sh

alias dockerkillall='docker kill $(docker ps -q)'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q)'
alias dockerclean='dockercleanc || true && dockercleani'

alias dc='docker-compose'
