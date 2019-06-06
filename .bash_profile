[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile


#Git
alias ga="git add"
alias gd="git diff"
alias gds="git diff --staged"
alias gh="git history"
alias gp="git push"
alias gcm="git commit -m "

#Bundle Exec
alias be="bundle exec"

export BUNDLER_EDITOR=/usr/bin/vim

#Jump to Folder
alias hfa='cd Desktop/hfa'

#Docker
alias dc="docker-compose"

# Git branch in prompt.
parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
		 }
		 export PS1=" \[\033[92m\]\w\[\033[96m\]\$(parse_git_branch)\[\033[00m\] $ "


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"





