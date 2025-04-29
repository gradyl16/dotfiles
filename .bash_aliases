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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Full pkg upgrade
alias up='sudo apt-get update && sudo apt-get upgrade -y'

# For OS machine problems
alias bam='bear --append -- make'
alias bm='bear -- make'
alias mc='make clean'
alias n='nix develop --extra-experimental-features nix-command --extra-experimental-features flakes'
alias em='cd /home/asclepius/school/uiuc/classes/cs423-osd/mp/mp4/mp4-gradyl16/linux/; qemu-script/cs423-q'
alias li='\ls -lah --color=auto'

# For adb stuff
adbkill() {
  adb shell "ps -A | grep $1 | awk '{print \$2}' | while read pid; do su -c "kill -9 \$pid"; done"
}

alias adbls='adb shell ps -A | grep -E "facebook|instagram|musically|snapchat|messenger|spotify|pubg"'
