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

# More handy aliases
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias g='git'
alias up='paru -Syu'
alias in='paru -S'
alias un='paru -R'

# For adb stuff
adbkill() {
  adb shell "ps -A | grep $1 | awk '{print \$2}' | while read pid; do su -c "kill -9 \$pid"; done"
}

alias adbls='adb shell ps -A | grep -E "facebook|instagram|musically|snapchat|messenger|spotify|pubg"'

# SSH kitty compatibility
# alias s="kitten ssh"
