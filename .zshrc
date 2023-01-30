ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"

# DISABLE_UPDATE_PROMPT=true
# export UPDATE_ZSH_DAYS=7
# plugins=(aws brew brew-cask docker git git-extra history node npm osx redis-cli sudo heroku nyan ssh-agent zsh-autosuggestions zsh-syntax-highlighting)
plugins=(
    aws
    brew
    command-not-found
    docker
    docker-compose
    fnm
    git
    heroku
    history
    node
    npm
    macos
    redis-cli
    rust
    stack
    vscode
    zsh-interactive-cd
)

export PATH="/usr/local/sbin:/Users/arthurweber/.local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

export RPROMPT='${time} %{$fg_bold[red]%}$(git_current_branch)%{$reset_color%}'

alias dockerkillall='docker kill $(docker ps -q) && docker system prune --volumes -f'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q)'
alias dockerclean='dockercleanc || true && dockercleani'

alias dk='dockerkillall'
alias dc='docker-compose'

# fnm
eval "$(fnm env)"
fnm use
