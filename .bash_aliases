# ls aliases (colorls)
if [ -x /usr/bin/dircolors ]; then
  alias ls='colorls -lh --color=auto --dark'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ll='ls -lah --color=auto --dark'
alias la='ls -A --color=auto --dark'
alias l='ls -lh --color=auto --dark'

# Dir changing shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

# Pkg mgmt
alias up='paru -Syu'
alias in='paru -S'
alias un='paru -R'

# Android
alias adbls='adb shell ps -A | grep -E "facebook|instagram|musically|snapchat|messenger|spotify|pubg"'
adbkill() {
  adb shell "ps -A | grep $1 | awk '{print \$2}' | while read pid; do su -c "kill -9 \$pid"; done"
}

# Misc
alias s='kitten ssh'
alias g='git'
alias pipsh='pipenv shell --fancy'

zds() {
  zellij list-sessions --short | while IFS= read -r session; do
    if [[ $session =~ .*-.* ]]; then
      zellij delete-session --force $session
    fi
  done
}
