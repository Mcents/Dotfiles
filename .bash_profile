[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile


#Git
alias ga="git add"
alias gd="git diff"
alias gds="git diff --staged"
alias gh="git hist"
alias gp="git push"
alias gcm="git commit -m "

#Bundle Exec
alias be="bundle exec"

#Jump to Folder
alias rumblef='cd Desktop/rumblefish'

#Docker
alias dc="docker-compose"

# Git branch in prompt.
parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
    export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"



