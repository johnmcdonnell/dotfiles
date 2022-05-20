
# Read in env passwords
source ~/.passwords

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH=$PATH:$HOME/bin


export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/include
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib

export SHINY_MODE=LOCAL

