set -o vi
setopt autopushd pushdsilent


if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

export PATH=$PATH:$HOME/bin
export EDITOR=vim

# Activate Development virtual environment
#source /Users/jvm/Development/venv/bin/activate

# Activate autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
