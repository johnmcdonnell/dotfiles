
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.aliases ]; then
	. ~/.aliases 
fi

set -o vi
export EDITOR=vim
#source /Users/jvm/Development/venv/bin/activate

