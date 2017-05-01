set -o vi
setopt autopushd pushdsilent


# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Make everything a little user friendlier with vim and less
export PAGER=less
#export LESS="-iMSx4 -FX"
export LESS="-erX"

export EDITOR=vim

# Help
#unalias run-help
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
autoload run-help
alias help=run-help

HELPDIR=/usr/local/share/zsh/help


# Activate Development virtual environment
echo "Loading virtualenv $HOME/venv/bin/activate"
source $HOME/venv/bin/activate

# Activate autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Hub
eval "$(hub alias -s)"

#------------------------------
# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

setprompt() {
  # load some modules
  setopt prompt_subst

  # make some aliases for the colours: (coud use normal escap.seq's too)
  for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$fg[${(L)color}]%}'
  done
  PR_NO_COLOR="%{$terminfo[sgr0]%}"

  # Check the UID
  if [[ $UID -ge 1000 ]]; then # normal user
    eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
    eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
  elif [[ $UID -eq 0 ]]; then # root
    eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
    eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
  fi

  # Check if we are on SSH or not
  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
  else 
    eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
  fi
  # set the prompt
  PS1=$'(`basename \"$VIRTUAL_ENV\"`)${PR_CYAN}[${PR_USER}${PR_CYAN}@${PR_HOST}${PR_CYAN}][$FG[147]%~${PR_CYAN}]${PR_USER_OP} '
  PS2=$'%_>'
  vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
      echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
  }
  RPROMPT=$'$(vcs_info_wrapper)'
}
setprompt

