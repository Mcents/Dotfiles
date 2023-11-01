export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
export PATH=~/.asdf/shims:$PATH
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

# Git branch in prompt.
parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
		 }
		 export PS1=" \[\033[92m\]\w\[\033[96m\]\$(parse_git_branch)\[\033[00m\] $ "

#Git
alias ga="git add"
alias gd="git diff"
alias gds="git diff --staged"
alias gh="git history"
alias gp="git push"
alias gcm="git commit -m "

#Jump to Folder
alias ucbi='cd Desktop/ucbi/ucbi_dev'
alias vimrc='cd ~/.vimrc'


