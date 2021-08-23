ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"

# DISABLE_UPDATE_PROMPT=true
# export UPDATE_ZSH_DAYS=7
# plugins=(aws brew brew-cask docker git git-extra history node npm osx redis-cli sudo heroku nyan ssh-agent zsh-autosuggestions zsh-syntax-highlighting)
plugins=(
    aws
    brew
    docker
    docker-compose
    dotnet
    heroku
    history
    node
    npm
    osx
    redis-cli
    stack
)

export PATH="/usr/local/sbin:/Users/arthurweber/.local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

export RPROMPT='${time} %{$fg_bold[red]%}$(git_current_branch)%{$reset_color%}'

alias dockerkillall='docker kill $(docker ps -q)'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q)'
alias dockerclean='dockercleanc || true && dockercleani'

alias dc='docker-compose'
alias dk="dockerkillall"

function neuron () {
  dockerArgs=()
  matchedArgs=${(M)@:#-*S*}
  restArgs=${@:#-*S*}

  if [[ -n $matchedArgs ]]; then
    dockerArgs=("-p" "2300:2300")
    matchedArgs=${(S)matchedArgs#S}
    matchedArgs=${matchedArgs#^-$}
    restArgs+=("-s" "0.0.0.0:2300")
  fi
  sh -c "docker run --rm -it $dockerArgs --user $(id -u):$(id -g) -v "$(pwd):/zettelkasten" -w /zettelkasten sridca/neuron neuron -d . $restArgs $matchedArgs"
}
alias neuron=neuron

# fnm
eval "$(fnm env)"
fnm use
