ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
DISABLE_UPDATE_PROMPT=true

plugins=(
  aws
  brew
  docker
  git
  history
  node
  npm
  osx
  redis-cli
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-nvm
)

export UPDATE_ZSH_DAYS=7
export NVM_LAZY_LOAD=true

source $ZSH/oh-my-zsh.sh

function node_prompt_info() {
  local node_prompt
  node_prompt=$(node -v 2>/dev/null)
  [[ "${node_prompt}x" == "x" ]] && return
  node_prompt=${node_prompt:1}
  echo "${ZSH_THEME_NVM_PROMPT_PREFIX}${node_prompt}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
}

export RPROMPT='${time} %{$fg[cyan]%}$(node_prompt_info)%{$reset_color%}%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'
# . `brew --prefix`/etc/profile.d/z.sh

alias dockerkillall='docker kill $(docker ps -q)'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q)'
alias dockerclean='dockercleanc || true && dockercleani'

alias dc='docker-compose'
alias dk='dockerkillall'

function neuron () {
  dockerArgs=()
  matchedArgs=${(M)@:#-*S*}
  restArgs=${@:#-*S*}

  if [[ -n $matchedArgs ]]; then 
    dockerArgs=("-p" "8080:8080")
    matchedArgs=${(S)matchedArgs#S}
    matchedArgs=${matchedArgs#^-$}
    restArgs+=("-s" "0.0.0.0:8080")
  fi
  docker run --rm -it $dockerArgs --user $(id -u):$(id -g) -v "$(pwd):/zettelkasten" -w /zettelkasten sridca/neuron neuron $restArgs $matchedArgs
}
alias neuron=neuron
