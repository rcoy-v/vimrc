# gpg agent for ssh auth
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# customized prompt
PS1='\[\e[38;5;75m\]\W\[\e[m\] \\$ '

# git
function gitRemotePatch() {
  curl -L $1 | git am -3 -s
}

function gitRemotePullRequest() {
  local remote=${2:-origin}
  git fetch ${remote} +refs/pull/$1/head:refs/remotes/${remote}/pr/$1
  git pull --no-rebase --squash ${remote} pull/$1/head
}

function gitCleanLocalBranches() {
  git branch | grep -v "^*" | xargs git branch -D
}

alias ll="ls -la"
alias gp=gitRemotePatch
alias gpr=gitRemotePullRequest
alias gclb=gitCleanLocalBranches
alias tf=terraform
alias d=docker
alias dco=docker-compose
